import 'package:flutter/material.dart';
import '../../../../../core/constants/app_colors.dart';
import '../../../../../core/constants/app_dimensions.dart';

/// Widget to display row headers (1, 2, 3, ...)
class RowHeader extends StatelessWidget {
  final int rowIndex;
  final double height;

  const RowHeader({
    super.key,
    required this.rowIndex,
    required this.height,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: AppDimensions.rowHeaderWidth,
      height: height,
      decoration: const BoxDecoration(
        color: AppColors.headerBackground,
        border: Border(
          right: BorderSide(color: AppColors.cellBorder, width: 1),
          bottom: BorderSide(color: AppColors.cellBorder, width: 1),
        ),
      ),
      child: Center(
        child: Text(
          '${rowIndex + 1}', // Row numbers start at 1
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
