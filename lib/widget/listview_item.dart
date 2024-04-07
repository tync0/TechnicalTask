import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:technical_task/utils/asset_const.dart';
import 'package:technical_task/utils/extension.dart';

class ListviewItem extends StatelessWidget {
  final void Function()? onTap;
  final String image, userName, status, badge;
  const ListviewItem({
    super.key,
    this.onTap,
    required this.image,
    required this.status,
    required this.userName,
    required this.badge,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(8),
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.only(bottom: 8),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(8),
        ),
        child: Row(
          children: [
            Padding(
              padding: const EdgeInsets.all(10),
              child: Stack(
                children: [
                  Image.asset(
                    image,
                  ),
                  Positioned(
                    right: 0,
                    bottom: 0,
                    child: Container(
                      width: 15,
                      height: 15,
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.white,
                      ),
                      padding: const EdgeInsets.symmetric(
                        horizontal: 2,
                        vertical: 2,
                      ),
                      child: Container(
                        decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.green,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Row(
                    children: [
                      Text(
                        userName,
                        style: context.title,
                      ),
                      badge.isNotEmpty
                          ? SvgPicture.asset(badge)
                          : const SizedBox(),
                    ],
                  ),
                  Text(
                    status,
                    style: context.subtitle,
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(21),
              child: Image.asset(
                AssetsConst.message,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
