import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:skeletonizer/skeletonizer.dart';
import 'package:websocket_assignment/blocs/symbols_and_close_price/symbols_and_close_price_bloc.dart';
import 'package:websocket_assignment/constants/data.dart';
import 'package:websocket_assignment/models/websocket_response.dart';
import 'package:websocket_assignment/resources/fonts_manager.dart';
import 'package:websocket_assignment/resources/strings_manager.dart';
import 'package:websocket_assignment/resources/values_manager.dart';
import 'package:websocket_assignment/widgets/error_dialog.dart';

class BuildSortAndMarketPriceSection extends StatelessWidget {
  const BuildSortAndMarketPriceSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        BlocBuilder<SymbolsAndClosePriceBloc, SymbolsAndClosePriceState>(
          builder: (_, state) {
            return Skeletonizer(
              enabled: state.status == SymbolsAndClosePriceStatus.loading,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Text(
                        AppStrings.sort,
                        style: TextStyle(
                          fontSize: FontSize.s15,
                        ),
                      ),
                      IconButton(
                        onPressed: () {},
                        icon: Icon(
                          MdiIcons.sortVariant,
                        ),
                      ),
                    ],
                  ),
                  Text(
                    AppStrings.marketPrice,
                    style: TextStyle(
                      fontSize: FontSize.s15,
                    ),
                  )
                ],
              ),
            );
          },
        ),
        SizedBox(height: AppHeight.h6),
        BlocConsumer<SymbolsAndClosePriceBloc, SymbolsAndClosePriceState>(
          listener: (context, state) {
            if (state.status == SymbolsAndClosePriceStatus.error) {
              errorDialog(context, state.customError.errorMessage);
            }
          },
          builder: (context, state) {
            return ListView.builder(
              itemCount: state.status == SymbolsAndClosePriceStatus.loading
                  ? websocketMockData.length
                  : state.websocketResponse.length,
              shrinkWrap: true,
              padding: EdgeInsets.zero,
              physics: const NeverScrollableScrollPhysics(),
              itemBuilder: (_, int index) {
                final WebsocketResponse websocketResponse;
                if (state.status == SymbolsAndClosePriceStatus.loading) {
                  websocketResponse = websocketMockData[index];
                } else {
                  websocketResponse = state.websocketResponse[index];
                }
                return Skeletonizer(
                  enabled: state.status == SymbolsAndClosePriceStatus.loading,
                  child: BuildSymbolAndClosePriceTable(
                    websocketResponse: websocketResponse,
                  ),
                );
              },
            );
          },
        ),
      ],
    );
  }
}

class BuildSymbolAndClosePriceTable extends StatelessWidget {
  const BuildSymbolAndClosePriceTable({
    super.key,
    required this.websocketResponse,
  });

  final WebsocketResponse websocketResponse;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: AppPadding.p12),
      child: Table(
        defaultVerticalAlignment: TableCellVerticalAlignment.middle,
        columnWidths: const {
          0: FlexColumnWidth(3),
          1: FlexColumnWidth(2),
          2: FlexColumnWidth(),
          3: FlexColumnWidth(4),
        },
        children: [
          TableRow(
            children: [
              Text(
                websocketResponse.symbol,
                style: TextStyle(
                  fontSize: FontSize.s14,
                  fontWeight: FontWeightManager.medium,
                ),
              ),
              Image.asset(
                'assets/images/graph.png',
                width: AppWidth.w40,
                height: AppWidth.w40,
                fit: BoxFit.contain,
              ),
              const SizedBox(),
              Text(
                '${websocketResponse.closePrice}',
                style: TextStyle(
                  fontSize: FontSize.s15,
                  fontWeight: FontWeightManager.medium,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
