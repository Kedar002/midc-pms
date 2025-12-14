import 'package:equatable/equatable.dart';

/// Represents a single cell in the spreadsheet
///
/// Stores the cell's position (row, col) and its value.
/// Future enhancements may include cell styling, formulas, etc.
class CellModel extends Equatable {
  final int row;
  final int col;
  final String value;

  const CellModel({
    required this.row,
    required this.col,
    required this.value,
  });

  /// Factory constructor for creating an empty cell
  factory CellModel.empty(int row, int col) {
    return CellModel(
      row: row,
      col: col,
      value: '',
    );
  }

  /// Create a copy of this cell with updated values
  CellModel copyWith({
    int? row,
    int? col,
    String? value,
  }) {
    return CellModel(
      row: row ?? this.row,
      col: col ?? this.col,
      value: value ?? this.value,
    );
  }

  /// Convert cell to JSON (for future persistence)
  Map<String, dynamic> toJson() {
    return {
      'row': row,
      'col': col,
      'value': value,
    };
  }

  /// Create cell from JSON (for future persistence)
  factory CellModel.fromJson(Map<String, dynamic> json) {
    return CellModel(
      row: json['row'] as int,
      col: json['col'] as int,
      value: json['value'] as String,
    );
  }

  @override
  List<Object?> get props => [row, col, value];

  @override
  String toString() => 'CellModel(row: $row, col: $col, value: $value)';
}
