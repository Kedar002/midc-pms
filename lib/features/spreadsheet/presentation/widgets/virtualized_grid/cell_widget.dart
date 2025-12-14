import 'package:flutter/material.dart';
import '../../../data/models/cell_model.dart';
import '../../../../../core/constants/app_colors.dart';
import '../../../../../core/constants/app_dimensions.dart';

/// Widget to display a single cell in the spreadsheet
class CellWidget extends StatelessWidget {
  final CellModel cellData;
  final bool isSelected;
  final bool isEditing;
  final double width;
  final double height;
  final VoidCallback onTap;
  final VoidCallback onDoubleTap;

  const CellWidget({
    super.key,
    required this.cellData,
    required this.isSelected,
    required this.isEditing,
    required this.width,
    required this.height,
    required this.onTap,
    required this.onDoubleTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      onDoubleTap: onDoubleTap,
      child: Container(
        width: width,
        height: height,
        decoration: BoxDecoration(
          color: isSelected ? AppColors.selectedCell : AppColors.cellBackground,
          border: Border.all(
            color: isSelected
                ? AppColors.selectionBorder
                : AppColors.cellBorder,
            width: isSelected
                ? AppDimensions.selectionBorderWidth
                : AppDimensions.cellBorderWidth,
          ),
        ),
        padding: const EdgeInsets.symmetric(
          horizontal: AppDimensions.cellPaddingHorizontal,
          vertical: AppDimensions.cellPaddingVertical,
        ),
        child: Align(
          alignment: Alignment.centerLeft,
          child: Text(
            cellData.value,
            style: const TextStyle(
              color: AppColors.textPrimary,
              fontSize: 14,
            ),
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
        ),
      ),
    );
  }
}
