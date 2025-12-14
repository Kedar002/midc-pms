/// Utility functions for column letter conversion
class ColumnUtils {
  ColumnUtils._(); // Private constructor to prevent instantiation

  /// Convert column index to letter (0 -> A, 1 -> B, ..., 25 -> Z, 26 -> AA, etc.)
  static String getColumnLetter(int index) {
    String result = '';
    int num = index;

    while (num >= 0) {
      result = String.fromCharCode(65 + (num % 26)) + result;
      num = (num ~/ 26) - 1;
      if (num < 0) break;
    }

    return result;
  }

  /// Convert column letter to index (A -> 0, B -> 1, ..., Z -> 25, AA -> 26, etc.)
  static int getColumnIndex(String letter) {
    int result = 0;
    for (int i = 0; i < letter.length; i++) {
      result = result * 26 + (letter.codeUnitAt(i) - 64);
    }
    return result - 1;
  }
}
