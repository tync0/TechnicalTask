import 'package:flutter/material.dart';
import 'package:technical_task/utils/extension.dart';
import 'package:technical_task/utils/text_const.dart';
import 'package:technical_task/widget/buttom.dart';

import '../utils/asset_const.dart';

class ReportBottomSheet extends StatefulWidget {
  const ReportBottomSheet({super.key});

  @override
  State<ReportBottomSheet> createState() => _ReportBottomSheetState();
}

class _ReportBottomSheetState extends State<ReportBottomSheet> {
  String? _selectedReason;
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
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Container(
                  width: 36,
                  height: 5,
                  color: const Color(0xFF3D3D3D),
                ),
              ),
              const SizedBox(height: 6),
              InkWell(
                onTap: () => Navigator.pop(context),
                child: Container(
                  width: 36,
                  height: 36,
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    color: Color(0xFfF7F7F7),
                  ),
                  child: Image.asset(AssetsConst.xIcon),
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),
          Text(
            'Səbəb seçin',
            style: context.subtitle.copyWith(
              fontSize: 18,
            ),
          ),
          const SizedBox(height: 12),
          ...TextConst.reasons.map(
            (String reason) {
              return Container(
                margin: const EdgeInsets.only(bottom: 10),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    SizedBox(
                      width: 22,
                      height: 22,
                      child: Radio<String>(
                        value: reason,
                        groupValue: _selectedReason,
                        onChanged: (String? value) {
                          setState(() {
                            _selectedReason = value;
                          });
                        },
                      ),
                    ),
                    const SizedBox(width: 10),
                    Expanded(
                      child: Text(
                        reason,
                        style: context.title.copyWith(
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
          const SizedBox(height: 24),
          CustomButton(
            color: const Color(0xFFEE2828),
            text: 'Göndər',
            onTap: () {
              Navigator.pop(context);
              context.bottomModalSheet(const EndingReport());
            },
          ),
        ],
      ),
    );
  }
}

class EndingReport extends StatelessWidget {
  const EndingReport({super.key});

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
          Column(
            children: [
              Container(
                width: 36,
                height: 5,
                color: const Color(0xFF3D3D3D),
              ),
              const SizedBox(height: 6),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Şikayət et',
                    style: context.title.copyWith(fontSize: 20),
                  ),
                  InkWell(
                    onTap: () => Navigator.pop(context),
                    child: Container(
                      width: 36,
                      height: 36,
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        color: Color(0xFFF7F7F7),
                      ),
                      child: Image.asset(AssetsConst.xIcon),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 16),
              Container(
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: context.mainRed,
                ),
                width: 106,
                height: 106,
              ),
              const SizedBox(height: 27),
              Text(
                'Şikayətin göndərildi',
                style: context.title.copyWith(
                  fontSize: 24,
                ),
              ),
              const SizedBox(height: 24),
              CustomButton(
                color: Colors.white,
                text: 'Bağla',
                onTap: () => Navigator.pop(context),
              ),
            ],
          )
        ],
      ),
    );
  }
}
