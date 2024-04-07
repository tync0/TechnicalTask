import 'package:flutter/material.dart';
import 'package:technical_task/utils/extension.dart';
import 'package:technical_task/widget/buttom.dart';
import 'package:technical_task/widget/popupmenubutton.dart';

import '../utils/asset_const.dart';

class ProfileBottomSheet extends StatefulWidget {
  const ProfileBottomSheet({super.key});

  @override
  State<ProfileBottomSheet> createState() => _ProfileBottomSheetState();
}

class _ProfileBottomSheetState extends State<ProfileBottomSheet> {
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
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
      child: ListView(
        physics: const NeverScrollableScrollPhysics(),
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
                    'Profil',
                    style: context.title.copyWith(fontSize: 20),
                  ),
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
              Container(
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  image: DecorationImage(
                    image: AssetImage(AssetsConst.boss),
                  ),
                ),
                width: context.dynamicWidth(0.32),
                height: context.dynamicHeight(0.15),
              ),
              const SizedBox(height: 6),
              Text(
                'Tural Salimli, 27',
                style: context.title.copyWith(fontSize: 24),
              ),
              Text(
                'Yaxınlıqda',
                style: context.subtitle.copyWith(fontSize: 18),
              ),
              const SizedBox(height: 24),
              Container(
                height: 32,
                width: 78,
                decoration: BoxDecoration(
                  color: const Color(0xFfFDEAE8),
                  borderRadius: BorderRadius.circular(16),
                ),
                child: const Center(child: Text('♥ 782')),
              ),
            ],
          ),
          const SizedBox(height: 24),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Bio',
                style: context.subtitle,
              ),
              const SizedBox(height: 4),
              Text(
                'Cat-lover, Designer, Weekend fan and biologist',
                style: context.title,
              ),
              const SizedBox(height: 36),
              Row(
                children: [
                  Expanded(
                    flex: 7,
                    child: CustomButton(
                      text: 'Mesaj göndər',
                      color: context.mainRed,
                    ),
                  ),
                  const SizedBox(width: 12),
                  const Expanded(
                    child: CustomPopupMenuButton(),
                  ),
                ],
              )
            ],
          ),
        ],
      ),
    );
  }
}
