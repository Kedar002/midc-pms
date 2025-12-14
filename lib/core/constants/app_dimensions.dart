/// Application-wide dimension constants
///
/// Defines default sizes for the spreadsheet grid and UI components.
class AppDimensions {
  AppDimensions._(); // Private constructor to prevent instantiation

  // Grid dimensions
  static const int maxRows = 500;
  static const int maxCols = 500;

  // Default cell sizes
  static const double defaultColumnWidth = 100.0;
  static const double defaultRowHeight = 30.0;

  // Min/Max cell sizes
  static const double minColumnWidth = 50.0;
  static const double maxColumnWidth = 500.0;
  static const double minRowHeight = 20.0;
  static const double maxRowHeight = 200.0;

  // Header sizes
  static const double columnHeaderHeight = 30.0;
  static const double rowHeaderWidth = 60.0;

  // Resizer
  static const double resizerWidth = 8.0;
  static const double resizerLineWidth = 2.0;

  // Cell padding
  static const double cellPaddingHorizontal = 8.0;
  static const double cellPaddingVertical = 4.0;

  // Border widths
  static const double cellBorderWidth = 1.0;
  static const double selectionBorderWidth = 2.0;

  // Toolbar
  static const double toolbarHeight = 50.0;

  // Virtualization buffer (number of extra rows/cols to render off-screen)
  static const int virtualizationBuffer = 5;
}
