import 'package:equatable/equatable.dart';
import 'grid_model.dart';

/// Represents a single sheet in the spreadsheet
class SheetModel extends Equatable {
  final String id;
  final String name;
  final String gid;
  final GridData gridData;

  const SheetModel({
    required this.id,
    required this.name,
    required this.gid,
    required this.gridData,
  });

  /// Create an empty sheet
  factory SheetModel.empty(String id, String name, String gid) {
    return SheetModel(
      id: id,
      name: name,
      gid: gid,
      gridData: GridData.empty(),
    );
  }

  /// Create a copy with updated values
  SheetModel copyWith({
    String? id,
    String? name,
    String? gid,
    GridData? gridData,
  }) {
    return SheetModel(
      id: id ?? this.id,
      name: name ?? this.name,
      gid: gid ?? this.gid,
      gridData: gridData ?? this.gridData,
    );
  }

  @override
  List<Object?> get props => [id, name, gid, gridData];

  @override
  String toString() => 'SheetModel(id: $id, name: $name, gid: $gid)';
}

/// Collection of sheets in the workbook
class WorkbookModel extends Equatable {
  final List<SheetModel> sheets;
  final String currentSheetId;

  const WorkbookModel({
    required this.sheets,
    required this.currentSheetId,
  });

  /// Get current sheet
  SheetModel get currentSheet {
    return sheets.firstWhere(
      (sheet) => sheet.id == currentSheetId,
      orElse: () => sheets.first,
    );
  }

  /// Get sheet by ID
  SheetModel? getSheetById(String id) {
    try {
      return sheets.firstWhere((sheet) => sheet.id == id);
    } catch (e) {
      return null;
    }
  }

  /// Switch to a different sheet
  WorkbookModel switchSheet(String sheetId) {
    return WorkbookModel(
      sheets: sheets,
      currentSheetId: sheetId,
    );
  }

  /// Update a specific sheet's data
  WorkbookModel updateSheet(String sheetId, GridData gridData) {
    final updatedSheets = sheets.map((sheet) {
      if (sheet.id == sheetId) {
        return sheet.copyWith(gridData: gridData);
      }
      return sheet;
    }).toList();

    return WorkbookModel(
      sheets: updatedSheets,
      currentSheetId: currentSheetId,
    );
  }

  @override
  List<Object?> get props => [sheets, currentSheetId];
}
