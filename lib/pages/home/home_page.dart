import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:websocket_assignment/pages/home/widgets/build_edit_watchlist_and_add_stocks_section.dart';
import 'package:websocket_assignment/pages/home/widgets/build_market_indices_section.dart';
import 'package:websocket_assignment/pages/home/widgets/build_sort_and_market_price_section.dart';
import 'package:websocket_assignment/pages/home/widgets/build_watch_list_section.dart';
import 'package:websocket_assignment/resources/color_manager.dart';
import 'package:websocket_assignment/resources/strings_manager.dart';
import 'package:websocket_assignment/resources/values_manager.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Icon(
          Icons.adaptive.arrow_back,
          size: AppHeight.h24,
        ),
        title: const Text(AppStrings.watchlist),
        actions: [
          IconButton(
            onPressed: () {},
            icon: Stack(
              clipBehavior: Clip.none,
              children: [
                Icon(
                  MdiIcons.bellOutline,
                  color: ColorManager.primaryLight,
                ),
                Positioned(
                  top: 1,
                  left: 0,
                  right: -18,
                  child: Icon(
                    MdiIcons.circleMedium,
                    color: ColorManager.green,
                    size: AppHeight.h16,
                  ),
                ),
              ],
            ),
            iconSize: AppHeight.h28,
          ),
          IconButton(
            onPressed: () {},
            icon: Icon(MdiIcons.segment),
            iconSize: AppHeight.h28,
            color: ColorManager.primaryDark,
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(AppSize.s16),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const BuildMarketIndicesSection(),
              SizedBox(height: AppHeight.h15),
              const BuildWatchListSection(),
              SizedBox(height: AppHeight.h4),
              const BuildSortAndMarketPriceSection(),
              SizedBox(height: AppHeight.h4),
              const BuildEditWatchListAndAddStocksSection(),
              SizedBox(height: AppHeight.h24),
            ],
          ),
        ),
      ),
    );
  }
}
