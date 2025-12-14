import 'package:http/http.dart' as http;
import '../models/csv_data_model.dart';
import '../models/grid_model.dart';
import '../../../../core/constants/app_dimensions.dart';

/// Repository for loading and parsing CSV data
///
/// Handles fetching CSV from URL and converting to GridData.
class CsvRepository {
  final http.Client httpClient;

  CsvRepository({http.Client? httpClient})
      : httpClient = httpClient ?? http.Client();

  /// Load CSV data from URL and convert to GridData
  ///
  /// Throws Exception if:
  /// - Network request fails
  /// - HTTP status is not 200
  /// - CSV parsing fails
  Future<GridData> loadCsvFromUrl(String url) async {
    try {
      // Fetch CSV from URL
      final response = await httpClient.get(Uri.parse(url));

      if (response.statusCode != 200) {
        throw Exception(
            'Failed to load CSV: HTTP ${response.statusCode}');
      }

      // Parse CSV content
      final csvData = CsvDataModel.fromCsvString(response.body);

      // Convert to GridData with max dimensions
      return csvData.toGridData(
        maxRows: AppDimensions.maxRows,
        maxCols: AppDimensions.maxCols,
      );
    } on http.ClientException catch (e) {
      throw Exception('Network error while loading CSV: $e');
    } catch (e) {
      throw Exception('Error loading CSV: $e');
    }
  }

  /// Dispose of the HTTP client
  void dispose() {
    httpClient.close();
  }
}
