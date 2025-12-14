/// Application-wide string constants
class AppStrings {
  AppStrings._(); // Private constructor to prevent instantiation

  // App
  static const String appName = 'MIDC-PMS';
  static const String appTitle = 'MIDC Project Management System';

  // Views
  static const String sheetView = 'Sheet';
  static const String applicationView = 'Application';

  // CSV
  static const String csvUrl =
      'https://docs.google.com/spreadsheets/d/e/2PACX-1vS0CP_CtEVr6yK4EezIrKdbHxlxvvx6vKP25vS5T5dpUazZek0cj4oIe1w83xubWLJvTHLNvXi3kqBz/pub?output=csv';

  // Messages
  static const String loadingData = 'Loading spreadsheet data...';
  static const String errorLoadingData = 'Error loading data';
  static const String noData = 'No data available';

  // Error messages
  static const String csvLoadError = 'Failed to load CSV data';
  static const String networkError = 'Network error. Please check your connection.';
  static const String parseError = 'Failed to parse CSV data';
}
