import 'package:flutter/material.dart';
import 'package:technical_task/utils/extension.dart';
import 'package:technical_task/widget/buttom.dart';

class CustomBottomSheet extends StatelessWidget {
  final String message, buttonText;
  final void Function()? confirm;
  const CustomBottomSheet({
    super.key,
    this.confirm,
    required this.message,
    required this.buttonText,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(8),
          topRight: Radius.circular(8),
        ),
        color: Colors.white,
      ),
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
      child: ListView(
        shrinkWrap: true,
        children: [
          Text(
            message,
            style: context.title.copyWith(
              fontSize: 28,
              fontWeight: FontWeight.w500,
            ),
          ),
          const SizedBox(height: 24),
          Row(
            children: [
              Expanded(
                child: CustomButton(
                  onTap: () => Navigator.pop(context),
                  color: Colors.white,
                  text: "Ləğv et",
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: CustomButton(
                  onTap: confirm,
                  color: context.mainRed,
                  text: buttonText,
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
