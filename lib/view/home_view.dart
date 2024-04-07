import 'package:flutter/material.dart';
import 'package:technical_task/utils/asset_const.dart';
import 'package:technical_task/utils/extension.dart';
import 'package:technical_task/widget/profile_sheet.dart';

import '../widget/listview_item.dart';

final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  List<List<String>> users = [
    [
      'Sevinc Alieva, 23',
      'Yaxınlıqda',
      AssetsConst.image1,
      AssetsConst.verification,
    ],
    [
      'Gunel M-va, 24',
      '100 metr',
      AssetsConst.image2,
      AssetsConst.vip,
    ],
    [
      'Shefeg Memmedli, 30',
      '150 metr',
      AssetsConst.image3,
      '',
    ],
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      backgroundColor: context.scaffoldColor,
      body: SafeArea(
        child: CustomScrollView(
          physics: const BouncingScrollPhysics(),
          slivers: [
            SliverAppBar(
              toolbarHeight: context.dynamicHeight(0.15),
            ),
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Column(
                  children: [
                    const SizedBox(height: 16),
                    ...users.map(
                      (e) => ListviewItem(
                        onTap: () => context.bottomModalSheet(
                          const ProfileBottomSheet(),
                        ),
                        userName: e[0],
                        status: e[1],
                        image: e[2],
                        badge: e[3],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
