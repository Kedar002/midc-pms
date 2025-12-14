import 'package:equatable/equatable.dart';
import 'cell_model.dart';
import '../../../../core/constants/app_dimensions.dart';

/// Represents the entire spreadsheet grid with sparse storage
///
/// Uses a Map to store only non-empty cells, significantly reducing
/// memory usage for large grids with many empty cells.
///
/// Key format: "R{row}C{col}" (e.g., "R5C10" for row 5, column 10)
class GridData extends Equatable {
  final int maxRows;
  final int maxCols;
  final Map<String, CellModel> cells;

  const GridData({
    this.maxRows = AppDimensions.maxRows,
    this.maxCols = AppDimensions.maxCols,
    this.cells = const {},
  });

  /// Generate key for cell lookup
  static String _key(int row, int col) => 'R${row}C$col';

  /// Get cell at position (row, col)
  /// Returns empty cell if position is not in the map
  CellModel getCell(int row, int col) {
    return cells[_key(row, col)] ?? CellModel.empty(row, col);
  }

  /// Check if cell exists in the map (not empty)
  bool hasCell(int row, int col) {
    return cells.containsKey(_key(row, col));
  }

  /// Set cell value (creates new immutable GridData)
  /// Removes cell from map if value is empty to save memory
  GridData setCell(CellModel cell) {
    final newCells = Map<String, CellModel>.from(cells);
    final key = _key(cell.row, cell.col);

    if (cell.value.trim().isEmpty) {
      // Remove empty cells to save memory
      newCells.remove(key);
    } else {
      newCells[key] = cell;
    }

    return GridData(
      maxRows: maxRows,
      maxCols: maxCols,
      cells: newCells,
    );
  }

  /// Set cell value by coordinates (convenience method)
  GridData setCellValue(int row, int col, String value) {
    return setCell(CellModel(row: row, col: col, value: value));
  }

  /// Clear cell at position
  GridData clearCell(int row, int col) {
    final newCells = Map<String, CellModel>.from(cells);
    newCells.remove(_key(row, col));

    return GridData(
      maxRows: maxRows,
      maxCols: maxCols,
      cells: newCells,
    );
  }

  /// Get all non-empty cells
  List<CellModel> getAllCells() {
    return cells.values.toList();
  }

  /// Get number of non-empty cells
  int get cellCount => cells.length;

  /// Check if grid is empty
  bool get isEmpty => cells.isEmpty;

  /// Convert to JSON (for future persistence)
  Map<String, dynamic> toJson() {
    return {
      'maxRows': maxRows,
      'maxCols': maxCols,
      'cells': cells.map((key, cell) => MapEntry(key, cell.toJson())),
    };
  }

  /// Create from JSON (for future persistence)
  factory GridData.fromJson(Map<String, dynamic> json) {
    final cellsJson = json['cells'] as Map<String, dynamic>;
    final cells = cellsJson.map(
      (key, value) =>
          MapEntry(key, CellModel.fromJson(value as Map<String, dynamic>)),
    );

    return GridData(
      maxRows: json['maxRows'] as int,
      maxCols: json['maxCols'] as int,
      cells: cells,
    );
  }

  /// Create empty grid
  factory GridData.empty() {
    return const GridData();
  }

  @override
  List<Object?> get props => [maxRows, maxCols, cells];

  @override
  String toString() =>
      'GridData(maxRows: $maxRows, maxCols: $maxCols, cellCount: $cellCount)';
}
