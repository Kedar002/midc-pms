import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../data/models/grid_model.dart';
import '../../bloc/spreadsheet_bloc.dart';
import '../../bloc/spreadsheet_event.dart';
import '../../bloc/spreadsheet_state.dart';
import '../../../../../core/constants/app_colors.dart';
import '../../../../../core/constants/app_dimensions.dart';
import 'cell_widget.dart';
import 'column_header.dart';
import 'row_header.dart';

/// Virtualized grid widget that displays the spreadsheet
///
/// This widget implements efficient rendering by only displaying
/// visible cells based on scroll position.
class VirtualizedGrid extends StatefulWidget {
  final GridData gridData;
  final CellSelection? selection;
  final CellEditing? editing;
  final Map<int, double> columnWidths;
  final Map<int, double> rowHeights;

  const VirtualizedGrid({
    super.key,
    required this.gridData,
    this.selection,
    this.editing,
    this.columnWidths = const {},
    this.rowHeights = const {},
  });

  @override
  State<VirtualizedGrid> createState() => _VirtualizedGridState();
}

class _VirtualizedGridState extends State<VirtualizedGrid> {
  final ScrollController _horizontalController = ScrollController();
  final ScrollController _verticalController = ScrollController();

  // Visible range (will be calculated based on scroll position)
  int _firstVisibleRow = 0;
  int _lastVisibleRow = 30; // Show 30 rows initially
  int _firstVisibleCol = 0;
  int _lastVisibleCol = 15; // Show 15 columns initially

  @override
  void initState() {
    super.initState();
    _horizontalController.addListener(_onScroll);
    _verticalController.addListener(_onScroll);
  }

  @override
  void dispose() {
    _horizontalController.dispose();
    _verticalController.dispose();
    super.dispose();
  }

  void _onScroll() {
    // Calculate visible range based on scroll position
    setState(() {
      final verticalOffset = _verticalController.offset;
      final horizontalOffset = _horizontalController.offset;

      _firstVisibleRow =
          (verticalOffset / AppDimensions.defaultRowHeight).floor();
      _lastVisibleRow = _firstVisibleRow + 30;

      _firstVisibleCol =
          (horizontalOffset / AppDimensions.defaultColumnWidth).floor();
      _lastVisibleCol = _firstVisibleCol + 15;

      // Clamp to valid range
      _firstVisibleRow = _firstVisibleRow.clamp(0, widget.gridData.maxRows - 1);
      _lastVisibleRow = _lastVisibleRow.clamp(0, widget.gridData.maxRows);
      _firstVisibleCol = _firstVisibleCol.clamp(0, widget.gridData.maxCols - 1);
      _lastVisibleCol = _lastVisibleCol.clamp(0, widget.gridData.maxCols);
    });
  }

  double _getColumnWidth(int col) {
    return widget.columnWidths[col] ?? AppDimensions.defaultColumnWidth;
  }

  double _getRowHeight(int row) {
    return widget.rowHeights[row] ?? AppDimensions.defaultRowHeight;
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        // Main grid viewport
        Positioned(
          top: AppDimensions.columnHeaderHeight,
          left: AppDimensions.rowHeaderWidth,
          right: 0,
          bottom: 0,
          child: _buildGridViewport(),
        ),

        // Column headers (sticky top)
        Positioned(
          top: 0,
          left: AppDimensions.rowHeaderWidth,
          right: 0,
          height: AppDimensions.columnHeaderHeight,
          child: _buildColumnHeaders(),
        ),

        // Row headers (sticky left)
        Positioned(
          top: AppDimensions.columnHeaderHeight,
          left: 0,
          bottom: 0,
          width: AppDimensions.rowHeaderWidth,
          child: _buildRowHeaders(),
        ),

        // Top-left corner
        Positioned(
          top: 0,
          left: 0,
          width: AppDimensions.rowHeaderWidth,
          height: AppDimensions.columnHeaderHeight,
          child: Container(
            decoration: const BoxDecoration(
              color: AppColors.headerBackground,
              border: Border(
                right: BorderSide(color: AppColors.cellBorder, width: 1),
                bottom: BorderSide(color: AppColors.cellBorder, width: 1),
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildColumnHeaders() {
    return SingleChildScrollView(
      controller: _horizontalController,
      scrollDirection: Axis.horizontal,
      physics: const ClampingScrollPhysics(),
      child: Row(
        children: List.generate(
          widget.gridData.maxCols,
          (col) => ColumnHeader(
            colIndex: col,
            width: _getColumnWidth(col),
          ),
        ),
      ),
    );
  }

  Widget _buildRowHeaders() {
    return SingleChildScrollView(
      controller: _verticalController,
      scrollDirection: Axis.vertical,
      physics: const ClampingScrollPhysics(),
      child: Column(
        children: List.generate(
          widget.gridData.maxRows,
          (row) => RowHeader(
            rowIndex: row,
            height: _getRowHeight(row),
          ),
        ),
      ),
    );
  }

  Widget _buildGridViewport() {
    return Scrollbar(
      controller: _verticalController,
      thumbVisibility: true,
      child: Scrollbar(
        controller: _horizontalController,
        thumbVisibility: true,
        notificationPredicate: (notification) => notification.depth == 1,
        child: SingleChildScrollView(
          controller: _verticalController,
          scrollDirection: Axis.vertical,
          child: SingleChildScrollView(
            controller: _horizontalController,
            scrollDirection: Axis.horizontal,
            child: _buildCellGrid(),
          ),
        ),
      ),
    );
  }

  Widget _buildCellGrid() {
    // Calculate total dimensions
    final totalHeight = widget.gridData.maxRows * AppDimensions.defaultRowHeight;
    final totalWidth = widget.gridData.maxCols * AppDimensions.defaultColumnWidth;

    return SizedBox(
      height: totalHeight,
      width: totalWidth,
      child: Stack(
        children: _buildVisibleCells(),
      ),
    );
  }

  List<Widget> _buildVisibleCells() {
    final cells = <Widget>[];

    for (int row = _firstVisibleRow; row < _lastVisibleRow && row < widget.gridData.maxRows; row++) {
      for (int col = _firstVisibleCol; col < _lastVisibleCol && col < widget.gridData.maxCols; col++) {
        final cellData = widget.gridData.getCell(row, col);
        final isSelected = widget.selection?.row == row && widget.selection?.col == col;
        final isEditing = widget.editing?.row == row && widget.editing?.col == col;

        cells.add(
          Positioned(
            top: row * AppDimensions.defaultRowHeight,
            left: col * AppDimensions.defaultColumnWidth,
            child: CellWidget(
              cellData: cellData,
              isSelected: isSelected,
              isEditing: isEditing,
              width: _getColumnWidth(col),
              height: _getRowHeight(row),
              onTap: () {
                context.read<SpreadsheetBloc>().add(SelectCell(row, col));
              },
              onDoubleTap: () {
                context.read<SpreadsheetBloc>().add(StartCellEditing(row, col));
              },
            ),
          ),
        );
      }
    }

    return cells;
  }
}
