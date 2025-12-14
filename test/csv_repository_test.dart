import 'package:flutter_test/flutter_test.dart';
import 'package:midc_pms/features/spreadsheet/data/repositories/csv_repository.dart';
import 'package:midc_pms/core/constants/app_strings.dart';

void main() {
  group('CsvRepository', () {
    test('loads CSV from URL successfully', () async {
      // Arrange
      final repository = CsvRepository();

      // Act
      final gridData = await repository.loadCsvFromUrl(AppStrings.csvUrl);

      // Assert
      expect(gridData, isNotNull);
      expect(gridData.maxRows, 500);
      expect(gridData.maxCols, 500);
      expect(gridData.isEmpty, false);

      print('CSV loaded successfully!');
      print('Grid size: ${gridData.maxRows}x${gridData.maxCols}');
      print('Non-empty cells: ${gridData.cellCount}');

      // Sample some cells
      if (gridData.cellCount > 0) {
        final cells = gridData.getAllCells().take(5);
        print('\nFirst 5 cells:');
        for (final cell in cells) {
          print('  Cell(${cell.row}, ${cell.col}): "${cell.value}"');
        }
      }

      // Cleanup
      repository.dispose();
    });
  });
}
