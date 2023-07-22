import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:skeletonizer/skeletonizer.dart';
import 'package:websocket_assignment/blocs/symbols_and_close_price/symbols_and_close_price_bloc.dart';
import 'package:websocket_assignment/constants/data.dart';
import 'package:websocket_assignment/resources/color_manager.dart';
import 'package:websocket_assignment/resources/fonts_manager.dart';
import 'package:websocket_assignment/resources/strings_manager.dart';
import 'package:websocket_assignment/resources/values_manager.dart';
import 'package:websocket_assignment/utils/get_height_card.dart';

class BuildMarketIndicesSection extends StatelessWidget {
  const BuildMarketIndicesSection({super.key});

  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.sizeOf(context).width;
    final Orientation orientation = MediaQuery.orientationOf(context);

    return BlocBuilder<SymbolsAndClosePriceBloc, SymbolsAndClosePriceState>(
      builder: (_, state) {
        return Skeletonizer(
          enabled: state.status == SymbolsAndClosePriceStatus.loading,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.only(left: AppPadding.p34),
                child: Text(
                  AppStrings.marketIndices,
                  style: TextStyle(
                    fontSize: FontSize.s15,
                    color: ColorManager.primary,
                  ),
                ),
              ),
              SizedBox(
                height: getCardHeight(orientation: orientation, width: width),
                width: double.infinity,
                child: Card(
                  elevation: AppSize.s1_5,
                  surfaceTintColor: ColorManager.white,
                  child: ListView.separated(
                    itemCount: marketIndicesData.length,
                    padding: EdgeInsets.zero,
                    separatorBuilder: (context, index) {
                      return const VerticalDivider(
                        endIndent: AppSize.s10,
                        color: ColorManager.divider,
                        indent: AppSize.s10,
                        thickness: AppSize.s1_2,
                      );
                    },
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (BuildContext context, int index) {
                      return BuildCardWidget(index: index);
                    },
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}

class BuildCardWidget extends StatelessWidget {
  const BuildCardWidget({
    super.key,
    required this.index,
  });

  final int index;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: index == 0 || index == 2 ? AppWidth.w105 : AppWidth.w100,
      padding: EdgeInsets.symmetric(
        horizontal: index == 0
            ? AppHeight.h10
            : index == 2
                ? AppHeight.h6
                : AppHeight.h4,
        vertical: AppWidth.w12,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        // mainAxisSize: MainAxisSize.min,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                marketIndicesData[index].title,
                style: TextStyle(
                  fontSize: FontSize.s12,
                  fontWeight: FontWeightManager.bold,
                ),
              ),
              Text('\u20B9 ${marketIndicesData[index].price}'),
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    '${marketIndicesData[index].average}',
                  ),
                  SizedBox(width: AppWidth.w2),
                  Text(
                    '(${marketIndicesData[index].percentage}%)',
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
