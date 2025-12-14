import 'package:equatable/equatable.dart';
import '../../data/models/grid_model.dart';

/// Base class for all spreadsheet states
abstract class SpreadsheetState extends Equatable {
  const SpreadsheetState();

  @override
  List<Object?> get props => [];
}

/// Initial state before any data is loaded
class SpreadsheetInitial extends SpreadsheetState {
  const SpreadsheetInitial();
}

/// State when loading CSV data
class SpreadsheetLoading extends SpreadsheetState {
  const SpreadsheetLoading();
}

/// State when spreadsheet is loaded and ready
class SpreadsheetLoaded extends SpreadsheetState {
  final GridData gridData;
  final CellSelection? selection;
  final CellEditing? editing;
  final Map<int, double> columnWidths;
  final Map<int, double> rowHeights;

  const SpreadsheetLoaded({
    required this.gridData,
    this.selection,
    this.editing,
    this.columnWidths = const {},
    this.rowHeights = const {},
  });

  /// Create a copy with updated values
  SpreadsheetLoaded copyWith({
    GridData? gridData,
    CellSelection? selection,
    CellEditing? editing,
    Map<int, double>? columnWidths,
    Map<int, double>? rowHeights,
    bool clearSelection = false,
    bool clearEditing = false,
  }) {
    return SpreadsheetLoaded(
      gridData: gridData ?? this.gridData,
      selection: clearSelection ? null : (selection ?? this.selection),
      editing: clearEditing ? null : (editing ?? this.editing),
      columnWidths: columnWidths ?? this.columnWidths,
      rowHeights: rowHeights ?? this.rowHeights,
    );
  }

  @override
  List<Object?> get props => [
        gridData,
        selection,
        editing,
        columnWidths,
        rowHeights,
      ];
}

/// State when there's an error
class SpreadsheetError extends SpreadsheetState {
  final String message;

  const SpreadsheetError(this.message);

  @override
  List<Object?> get props => [message];
}

/// Helper class to track selected cell
class CellSelection extends Equatable {
  final int row;
  final int col;

  const CellSelection(this.row, this.col);

  @override
  List<Object?> get props => [row, col];

  @override
  String toString() => 'CellSelection(row: $row, col: $col)';
}

/// Helper class to track cell being edited
class CellEditing extends Equatable {
  final int row;
  final int col;
  final String initialValue;

  const CellEditing(this.row, this.col, this.initialValue);

  @override
  List<Object?> get props => [row, col, initialValue];

  @override
  String toString() =>
      'CellEditing(row: $row, col: $col, initialValue: "$initialValue")';
}
