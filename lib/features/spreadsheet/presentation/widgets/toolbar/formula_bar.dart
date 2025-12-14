import 'package:flutter/material.dart';
import '../../../../../core/constants/app_colors.dart';
import '../../../../../core/utils/column_utils.dart';

/// Formula bar widget (shows cell reference and value)
class FormulaBar extends StatefulWidget {
  final int? selectedRow;
  final int? selectedCol;
  final String? cellValue;
  final Function(String)? onValueChanged;

  const FormulaBar({
    super.key,
    this.selectedRow,
    this.selectedCol,
    this.cellValue,
    this.onValueChanged,
  });

  @override
  State<FormulaBar> createState() => _FormulaBarState();
}

class _FormulaBarState extends State<FormulaBar> {
  late TextEditingController _controller;
  final FocusNode _focusNode = FocusNode();

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController(text: widget.cellValue ?? '');
  }

  @override
  void didUpdateWidget(FormulaBar oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.cellValue != oldWidget.cellValue) {
      _controller.text = widget.cellValue ?? '';
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    _focusNode.dispose();
    super.dispose();
  }

  String _getCellReference() {
    if (widget.selectedRow == null || widget.selectedCol == null) {
      return '';
    }
    final col = ColumnUtils.getColumnLetter(widget.selectedCol!);
    final row = (widget.selectedRow! + 1).toString();
    return '$col$row';
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 35,
      decoration: const BoxDecoration(
        color: AppColors.background,
        border: Border(
          bottom: BorderSide(color: AppColors.border, width: 1),
        ),
      ),
      child: Row(
        children: [
          // Cell reference
          Container(
            width: 100,
            padding: const EdgeInsets.symmetric(horizontal: 12),
            decoration: const BoxDecoration(
              border: Border(
                right: BorderSide(color: AppColors.border, width: 1),
              ),
            ),
            child: Center(
              child: Text(
                _getCellReference(),
                style: const TextStyle(
                  color: AppColors.textPrimary,
                  fontSize: 13,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ),

          // Formula/value input
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8),
              child: TextField(
                controller: _controller,
                focusNode: _focusNode,
                style: const TextStyle(
                  color: AppColors.textPrimary,
                  fontSize: 13,
                ),
                decoration: const InputDecoration(
                  border: InputBorder.none,
                  hintText: 'Enter value',
                  hintStyle: TextStyle(
                    color: AppColors.textTertiary,
                    fontSize: 13,
                  ),
                  contentPadding: EdgeInsets.symmetric(vertical: 8),
                ),
                onSubmitted: (value) {
                  if (widget.onValueChanged != null) {
                    widget.onValueChanged!(value);
                  }
                },
                onChanged: (value) {
                  // Optionally update on every change
                  // widget.onValueChanged?.call(value);
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
