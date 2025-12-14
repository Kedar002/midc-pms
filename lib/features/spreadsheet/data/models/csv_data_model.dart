import 'package:equatable/equatable.dart';
import 'package:csv/csv.dart';
import 'cell_model.dart';
import 'grid_model.dart';

/// Represents parsed CSV data
///
/// Handles CSV parsing and conversion to GridData format.
class CsvDataModel extends Equatable {
  final List<List<String>> rows;

  const CsvDataModel({required this.rows});

  /// Parse CSV string into CsvDataModel
  factory CsvDataModel.fromCsvString(String csvContent) {
    try {
      final List<List<dynamic>> rawData = const CsvToListConverter().convert(
        csvContent,
        eol: '\n',
        fieldDelimiter: ',',
        textDelimiter: '"',
        textEndDelimiter: '"',
        shouldParseNumbers: false, // Keep everything as strings
      );

      // Convert dynamic to String
      final List<List<String>> stringData = rawData.map((row) {
        return row.map((cell) => cell?.toString() ?? '').toList();
      }).toList();

      return CsvDataModel(rows: stringData);
    } catch (e) {
      throw Exception('Failed to parse CSV: $e');
    }
  }

  /// Convert CSV data to GridData
  ///
  /// Only stores non-empty cells for memory efficiency
  GridData toGridData({int? maxRows, int? maxCols}) {
    final Map<String, CellModel> cells = {};

    for (int row = 0; row < rows.length; row++) {
      if (maxRows != null && row >= maxRows) break;

      final rowData = rows[row];
      for (int col = 0; col < rowData.length; col++) {
        if (maxCols != null && col >= maxCols) break;

        final value = rowData[col].trim();
        if (value.isNotEmpty) {
          final key = 'R${row}C$col';
          cells[key] = CellModel(
            row: row,
            col: col,
            value: value,
          );
        }
      }
    }

    return GridData(
      maxRows: maxRows ?? 500,
      maxCols: maxCols ?? 500,
      cells: cells,
    );
  }

  /// Get row count
  int get rowCount => rows.length;

  /// Get column count (max columns across all rows)
  int get colCount {
    if (rows.isEmpty) return 0;
    return rows.map((row) => row.length).reduce((a, b) => a > b ? a : b);
  }

  /// Check if CSV is empty
  bool get isEmpty => rows.isEmpty;

  @override
  List<Object?> get props => [rows];

  @override
  String toString() =>
      'CsvDataModel(rowCount: $rowCount, colCount: $colCount)';
}
