import 'package:flutter_bloc/flutter_bloc.dart';
import '../../data/repositories/csv_repository.dart';
import 'spreadsheet_event.dart';
import 'spreadsheet_state.dart';
import '../../../../core/constants/app_dimensions.dart';

/// BLoC for managing spreadsheet state and operations
class SpreadsheetBloc extends Bloc<SpreadsheetEvent, SpreadsheetState> {
  final CsvRepository csvRepository;

  SpreadsheetBloc({required this.csvRepository})
      : super(const SpreadsheetInitial()) {
    on<LoadCsvData>(_onLoadCsvData);
    on<SelectCell>(_onSelectCell);
    on<StartCellEditing>(_onStartCellEditing);
    on<CommitCellEdit>(_onCommitCellEdit);
    on<CancelCellEditing>(_onCancelCellEditing);
    on<UpdateCellValue>(_onUpdateCellValue);
    on<ResizeColumn>(_onResizeColumn);
    on<ResizeRow>(_onResizeRow);
    on<NavigateCell>(_onNavigateCell);
    on<ClearCell>(_onClearCell);
  }

  /// Load CSV data from URL
  Future<void> _onLoadCsvData(
    LoadCsvData event,
    Emitter<SpreadsheetState> emit,
  ) async {
    emit(const SpreadsheetLoading());

    try {
      final gridData = await csvRepository.loadCsvFromUrl(event.url);

      emit(SpreadsheetLoaded(
        gridData: gridData,
        columnWidths: {},
        rowHeights: {},
      ));
    } catch (e) {
      emit(SpreadsheetError('Failed to load CSV: ${e.toString()}'));
    }
  }

  /// Select a cell
  void _onSelectCell(
    SelectCell event,
    Emitter<SpreadsheetState> emit,
  ) {
    if (state is SpreadsheetLoaded) {
      final currentState = state as SpreadsheetLoaded;

      // If currently editing, don't change selection
      if (currentState.editing != null) return;

      emit(currentState.copyWith(
        selection: CellSelection(event.row, event.col),
      ));
    }
  }

  /// Start editing a cell
  void _onStartCellEditing(
    StartCellEditing event,
    Emitter<SpreadsheetState> emit,
  ) {
    if (state is SpreadsheetLoaded) {
      final currentState = state as SpreadsheetLoaded;

      // Get current cell value
      final cell = currentState.gridData.getCell(event.row, event.col);

      emit(currentState.copyWith(
        selection: CellSelection(event.row, event.col),
        editing: CellEditing(event.row, event.col, cell.value),
      ));
    }
  }

  /// Commit cell edit
  void _onCommitCellEdit(
    CommitCellEdit event,
    Emitter<SpreadsheetState> emit,
  ) {
    if (state is SpreadsheetLoaded) {
      final currentState = state as SpreadsheetLoaded;

      if (currentState.editing != null) {
        final editing = currentState.editing!;

        // Update grid data with new value
        final updatedGridData = currentState.gridData.setCellValue(
          editing.row,
          editing.col,
          event.value,
        );

        emit(currentState.copyWith(
          gridData: updatedGridData,
          clearEditing: true, // Exit edit mode
        ));
      }
    }
  }

  /// Cancel cell editing
  void _onCancelCellEditing(
    CancelCellEditing event,
    Emitter<SpreadsheetState> emit,
  ) {
    if (state is SpreadsheetLoaded) {
      final currentState = state as SpreadsheetLoaded;

      emit(currentState.copyWith(clearEditing: true));
    }
  }

  /// Update cell value directly
  void _onUpdateCellValue(
    UpdateCellValue event,
    Emitter<SpreadsheetState> emit,
  ) {
    if (state is SpreadsheetLoaded) {
      final currentState = state as SpreadsheetLoaded;

      final updatedGridData = currentState.gridData.setCellValue(
        event.row,
        event.col,
        event.value,
      );

      emit(currentState.copyWith(gridData: updatedGridData));
    }
  }

  /// Resize a column
  void _onResizeColumn(
    ResizeColumn event,
    Emitter<SpreadsheetState> emit,
  ) {
    if (state is SpreadsheetLoaded) {
      final currentState = state as SpreadsheetLoaded;

      // Clamp width to valid range
      final clampedWidth = event.width.clamp(
        AppDimensions.minColumnWidth,
        AppDimensions.maxColumnWidth,
      );

      final updatedWidths =
          Map<int, double>.from(currentState.columnWidths);
      updatedWidths[event.colIndex] = clampedWidth;

      emit(currentState.copyWith(columnWidths: updatedWidths));
    }
  }

  /// Resize a row
  void _onResizeRow(
    ResizeRow event,
    Emitter<SpreadsheetState> emit,
  ) {
    if (state is SpreadsheetLoaded) {
      final currentState = state as SpreadsheetLoaded;

      // Clamp height to valid range
      final clampedHeight = event.height.clamp(
        AppDimensions.minRowHeight,
        AppDimensions.maxRowHeight,
      );

      final updatedHeights = Map<int, double>.from(currentState.rowHeights);
      updatedHeights[event.rowIndex] = clampedHeight;

      emit(currentState.copyWith(rowHeights: updatedHeights));
    }
  }

  /// Navigate to another cell using keyboard
  void _onNavigateCell(
    NavigateCell event,
    Emitter<SpreadsheetState> emit,
  ) {
    if (state is SpreadsheetLoaded) {
      final currentState = state as SpreadsheetLoaded;

      // Can't navigate while editing
      if (currentState.editing != null) return;

      final currentSelection = currentState.selection;
      if (currentSelection == null) return;

      int newRow = currentSelection.row;
      int newCol = currentSelection.col;

      switch (event.direction) {
        case NavigationDirection.up:
          newRow = (newRow - 1).clamp(0, AppDimensions.maxRows - 1);
          break;
        case NavigationDirection.down:
          newRow = (newRow + 1).clamp(0, AppDimensions.maxRows - 1);
          break;
        case NavigationDirection.left:
          newCol = (newCol - 1).clamp(0, AppDimensions.maxCols - 1);
          break;
        case NavigationDirection.right:
          newCol = (newCol + 1).clamp(0, AppDimensions.maxCols - 1);
          break;
      }

      emit(currentState.copyWith(
        selection: CellSelection(newRow, newCol),
      ));
    }
  }

  /// Clear cell content
  void _onClearCell(
    ClearCell event,
    Emitter<SpreadsheetState> emit,
  ) {
    if (state is SpreadsheetLoaded) {
      final currentState = state as SpreadsheetLoaded;

      final updatedGridData =
          currentState.gridData.clearCell(event.row, event.col);

      emit(currentState.copyWith(gridData: updatedGridData));
    }
  }
}
