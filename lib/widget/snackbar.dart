import 'package:flutter/material.dart';
import 'package:technical_task/utils/extension.dart';

ScaffoldFeatureController<SnackBar, SnackBarClosedReason> showCustomSnack(
  BuildContext context,
) {
  return ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
        ),
        child: Text(
          'Bildirişlər bağlanıldı',
          style: context.title.copyWith(
            color: Colors.white,
            fontSize: 16,
          ),
        ),
      ),
      behavior: SnackBarBehavior.floating,
      action: SnackBarAction(
        onPressed: () {},
        label: 'Ləğv et',
        textColor: const Color(0xFFF0B1A8),
      ),
    ),
  );
}
