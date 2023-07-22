import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:skeletonizer/skeletonizer.dart';
import 'package:websocket_assignment/blocs/add_watch_list/add_watch_list_bloc.dart';
import 'package:websocket_assignment/blocs/symbols_and_close_price/symbols_and_close_price_bloc.dart';
import 'package:websocket_assignment/pages/home/widgets/build_add_watch_list_bottom_sheet.dart';
import 'package:websocket_assignment/resources/strings_manager.dart';
import 'package:websocket_assignment/resources/values_manager.dart';
import 'package:websocket_assignment/widgets/bottom_sheet/build_show_custom_bottom_sheet.dart';
import 'package:websocket_assignment/widgets/buttons/build_custom_outlined_button.dart';
import 'package:websocket_assignment/widgets/buttons/build_custom_outlined_icon_button.dart';

class BuildWatchListSection extends StatelessWidget {
  const BuildWatchListSection({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SymbolsAndClosePriceBloc, SymbolsAndClosePriceState>(
      builder: (_, state) {
        return Skeletonizer(
          enabled: state.status == SymbolsAndClosePriceStatus.loading,
          child: SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: [
                BlocBuilder<AddWatchListBloc, AddWatchListState>(
                  builder: (_, state) {
                    return Wrap(
                      spacing: AppWidth.w8,
                      children: state.watchLists
                          .map(
                            (String title) => BuildCustomOutlinedButton(
                              onPressed: () {},
                              text: title,
                            ),
                          )
                          .toList(),
                    );
                  },
                ),
                SizedBox(width: AppWidth.w8),
                BuildCustomOutlinedIconButton(
                  onPressed: () {
                    showCustomBottomSheet(
                      context: context,
                      child: const BuildAddWatchListBottomSheet(),
                    );
                  },
                  text: AppStrings.watchlist,
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
