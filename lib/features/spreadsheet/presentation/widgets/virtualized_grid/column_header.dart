import 'package:flutter/material.dart';
import '../../../../../core/constants/app_colors.dart';
import '../../../../../core/constants/app_dimensions.dart';
import '../../../../../core/utils/column_utils.dart';

/// Widget to display column headers (A, B, C, ..., Z, AA, AB, etc.)
class ColumnHeader extends StatelessWidget {
  final int colIndex;
  final double width;

  const ColumnHeader({
    super.key,
    required this.colIndex,
    required this.width,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: AppDimensions.columnHeaderHeight,
      decoration: const BoxDecoration(
        color: AppColors.headerBackground,
        border: Border(
          right: BorderSide(color: AppColors.cellBorder, width: 1),
          bottom: BorderSide(color: AppColors.cellBorder, width: 1),
        ),
      ),
      child: Center(
        child: Text(
          ColumnUtils.getColumnLetter(colIndex),
          style: const TextStyle(
            color: AppColors.headerText,
            fontSize: 12,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
    );
  }
}
