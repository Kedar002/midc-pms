import 'package:equatable/equatable.dart';

/// Base class for all spreadsheet events
abstract class SpreadsheetEvent extends Equatable {
  const SpreadsheetEvent();

  @override
  List<Object?> get props => [];
}

/// Event to load CSV data from URL
class LoadCsvData extends SpreadsheetEvent {
  final String url;

  const LoadCsvData(this.url);

  @override
  List<Object?> get props => [url];
}

/// Event to select a cell
class SelectCell extends SpreadsheetEvent {
  final int row;
  final int col;

  const SelectCell(this.row, this.col);

  @override
  List<Object?> get props => [row, col];
}

/// Event to start editing a cell
class StartCellEditing extends SpreadsheetEvent {
  final int row;
  final int col;

  const StartCellEditing(this.row, this.col);

  @override
  List<Object?> get props => [row, col];
}

/// Event to commit the current cell edit
class CommitCellEdit extends SpreadsheetEvent {
  final String value;

  const CommitCellEdit(this.value);

  @override
  List<Object?> get props => [value];
}

/// Event to cancel the current cell editing
class CancelCellEditing extends SpreadsheetEvent {
  const CancelCellEditing();
}

/// Event to update a cell value directly
class UpdateCellValue extends SpreadsheetEvent {
  final int row;
  final int col;
  final String value;

  const UpdateCellValue(this.row, this.col, this.value);

  @override
  List<Object?> get props => [row, col, value];
}

/// Event to resize a column
class ResizeColumn extends SpreadsheetEvent {
  final int colIndex;
  final double width;

  const ResizeColumn(this.colIndex, this.width);

  @override
  List<Object?> get props => [colIndex, width];
}

/// Event to resize a row
class ResizeRow extends SpreadsheetEvent {
  final int rowIndex;
  final double height;

  const ResizeRow(this.rowIndex, this.height);

  @override
  List<Object?> get props => [rowIndex, height];
}

/// Navigation directions for keyboard navigation
enum NavigationDirection { up, down, left, right }

/// Event to navigate between cells using keyboard
class NavigateCell extends SpreadsheetEvent {
  final NavigationDirection direction;

  const NavigateCell(this.direction);

  @override
  List<Object?> get props => [direction];
}

/// Event to clear a cell
class ClearCell extends SpreadsheetEvent {
  final int row;
  final int col;

  const ClearCell(this.row, this.col);

  @override
  List<Object?> get props => [row, col];
}
