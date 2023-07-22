import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:skeletonizer/skeletonizer.dart';
import 'package:websocket_assignment/blocs/symbols_and_close_price/symbols_and_close_price_bloc.dart';
import 'package:websocket_assignment/resources/strings_manager.dart';
import 'package:websocket_assignment/widgets/buttons/build_custom_outlined_button.dart';
import 'package:websocket_assignment/widgets/buttons/build_custom_outlined_icon_button.dart';

class BuildEditWatchListAndAddStocksSection extends StatelessWidget {
  const BuildEditWatchListAndAddStocksSection({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SymbolsAndClosePriceBloc, SymbolsAndClosePriceState>(
      builder: (_, state) {
        return Skeletonizer(
          enabled: state.status == SymbolsAndClosePriceStatus.loading,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              BuildCustomOutlinedButton(
                onPressed: () {},
                text: AppStrings.editWatchlist,
              ),
              BuildCustomOutlinedIconButton(
                onPressed: () {},
                text: AppStrings.addStocks,
              ),
            ],
          ),
        );
      },
    );
  }
}
