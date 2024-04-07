import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:technical_task/utils/asset_const.dart';
import 'package:technical_task/utils/extension.dart';
import 'package:technical_task/utils/text_const.dart';
import 'package:technical_task/view/home_view.dart';
import 'package:technical_task/widget/custom_sheet.dart';
import 'package:technical_task/widget/report_sheet.dart';
import 'package:technical_task/widget/snackbar.dart';

class CustomPopupMenuButton extends StatefulWidget {
  const CustomPopupMenuButton({super.key});

  @override
  State<CustomPopupMenuButton> createState() => _CustomPopupMenuButtonState();
}

class _CustomPopupMenuButtonState extends State<CustomPopupMenuButton> {
  late NavigatorState _navigator;
  @override
  void didChangeDependencies() {
    _navigator = Navigator.of(context);
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton<String>(
      surfaceTintColor: Colors.white,
      color: Colors.white,
      position: PopupMenuPosition.over,
      offset: const Offset(0, -164),
      constraints: const BoxConstraints(minWidth: 240, minHeight: 146),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8),
        side: const BorderSide(
          color: Color(0xFFF7F7F7),
        ),
      ),
      shadowColor: Colors.black38,
      elevation: 15,
      onSelected: (String result) {
        Navigator.pop(context);
        switch (result) {
          case 'disable_notifications':
            context.bottomModalSheet(
              CustomBottomSheet(
                buttonText: TextConst.closeNtfcButton,
                message: TextConst.closeNotification,
                confirm: () {
                  _navigator.pop();
                  showCustomSnack(scaffoldKey.currentContext!);
                },
              ),
            );
            break;
          case 'block':
            context.bottomModalSheet(
              CustomBottomSheet(
                buttonText: TextConst.blockButton,
                message: TextConst.blockMessage,
                confirm: () {
                  _navigator.pop();
                  showCustomSnack(scaffoldKey.currentContext!);
                },
              ),
            );
            break;
          case 'report':
            context.bottomModalSheet(const ReportBottomSheet());
            break;
        }
      },
      itemBuilder: (BuildContext context) => <PopupMenuEntry<String>>[
        PopupMenuItem<String>(
          value: 'disable_notifications',
          child: Row(
            children: <Widget>[
              SvgPicture.asset(AssetsConst.closeNotification),
              const SizedBox(width: 8),
              Text(
                'Bildirişləri bağla',
                style: context.title.copyWith(
                  fontSize: 16,
                ),
              ),
            ],
          ),
        ),
        PopupMenuItem<String>(
          value: 'block',
          child: Row(
            children: <Widget>[
              SvgPicture.asset(AssetsConst.block),
              const SizedBox(width: 8),
              Text(
                'Blokla',
                style: context.title.copyWith(
                  fontSize: 16,
                ),
              ),
            ],
          ),
        ),
        PopupMenuItem<String>(
          value: 'report',
          child: Row(
            children: <Widget>[
              const Icon(Icons.flag, color: Colors.red),
              const SizedBox(width: 8),
              Text(
                'Şikayət et',
                style: context.title.copyWith(
                  color: Colors.red,
                  fontSize: 16,
                ),
              ),
            ],
          ),
        ),
      ],
      child: Container(
        height: 48,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: Colors.white,
          border: Border.all(
            color: const Color(0xFFF7F7F7),
          ),
        ),
        child: SvgPicture.asset(
          AssetsConst.moreHoriz,
          fit: BoxFit.none,
        ),
      ),
    );
  }
}
