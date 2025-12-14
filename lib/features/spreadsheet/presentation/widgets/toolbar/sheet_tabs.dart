import 'package:flutter/material.dart';
import '../../../data/models/sheet_model.dart';
import '../../../../../core/constants/app_colors.dart';

/// Sheet tabs widget (similar to Google Sheets bottom tabs)
class SheetTabs extends StatelessWidget {
  final List<SheetModel> sheets;
  final String currentSheetId;
  final Function(String) onSheetChanged;

  const SheetTabs({
    super.key,
    required this.sheets,
    required this.currentSheetId,
    required this.onSheetChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40,
      decoration: const BoxDecoration(
        color: AppColors.surface,
        border: Border(
          top: BorderSide(color: AppColors.border, width: 1),
        ),
      ),
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: sheets.length,
        itemBuilder: (context, index) {
          final sheet = sheets[index];
          final isActive = sheet.id == currentSheetId;

          return GestureDetector(
            onTap: () => onSheetChanged(sheet.id),
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
              margin: const EdgeInsets.only(right: 2),
              decoration: BoxDecoration(
                color: isActive ? AppColors.background : Colors.transparent,
                border: Border(
                  bottom: BorderSide(
                    color: isActive ? AppColors.textPrimary : Colors.transparent,
                    width: 2,
                  ),
                ),
              ),
              child: Center(
                child: Text(
                  sheet.name,
                  style: TextStyle(
                    color: isActive ? AppColors.textPrimary : AppColors.textSecondary,
                    fontSize: 13,
                    fontWeight: isActive ? FontWeight.w600 : FontWeight.normal,
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
