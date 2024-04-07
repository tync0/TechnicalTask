import 'package:flutter/material.dart';
import 'package:technical_task/utils/extension.dart';

class CustomButton extends StatelessWidget {
  final Color color;
  final String text;
  final void Function()? onTap;
  const CustomButton({
    super.key,
    required this.color,
    required this.text,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(8),
      child: Container(
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(8),
          border: Border.all(
            width: 3,
            color: color == Colors.white
                ? const Color(0xFFC4C4C4)
                : Colors.transparent,
          ),
        ),
        height: 48,
        child: Center(
          child: Text(
            text,
            style: context.title.copyWith(
              color: color == Colors.white ? Colors.black : Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}
