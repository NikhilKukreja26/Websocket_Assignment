import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart' show Equatable;
import 'package:websocket_assignment/constants/data.dart'
    show jsonWebsocketResponseData;
import 'package:websocket_assignment/models/custom_error.dart';
import 'package:websocket_assignment/models/websocket_response.dart';
import 'package:websocket_assignment/services/websocket_service.dart';

part 'symbols_and_close_price_event.dart';
part 'symbols_and_close_price_state.dart';

class SymbolsAndClosePriceBloc
    extends Bloc<SymbolsAndClosePriceEvent, SymbolsAndClosePriceState> {
  SymbolsAndClosePriceBloc() : super(SymbolsAndClosePriceState.initial()) {
    on<FetchSymbolsAndUpdateClosePriceEvent>(
      _onFetchSymbolsAndUpdateClosePrice,
    );
  }

  Future<void> _onFetchSymbolsAndUpdateClosePrice(
    FetchSymbolsAndUpdateClosePriceEvent event,
    Emitter<SymbolsAndClosePriceState> emit,
  ) async {
    emit(state.copyWith(status: SymbolsAndClosePriceStatus.loading));

    await Future.delayed(const Duration(milliseconds: 1500));

    final List<dynamic> jsonList =
        json.decode(jsonWebsocketResponseData) as List;

    final List<WebsocketResponse> websocketResponseList = jsonList
        .map((json) => WebsocketResponse.fromJson(json as Map<String, dynamic>))
        .toList();

    emit(
      state.copyWith(
        status: SymbolsAndClosePriceStatus.loaded,
        websocketResponse: websocketResponseList,
      ),
    );
    try {
      await for (final List<dynamic> jsonResponse
          in WebsocketService.instance().getWebSocketStream()) {
        final decodedResponse = jsonResponse
            .map(
              (json) =>
                  WebsocketResponse.fromJson(json as Map<String, dynamic>),
            )
            .toList();

        for (final WebsocketResponse websocketData in decodedResponse) {
          final String symbol = websocketData.symbol;
          final num closePrice = websocketData.closePrice;

          // To find the matching element if symbol matches and getting its index
          final index = websocketResponseList
              .indexWhere((element) => element.symbol == symbol);

          if (index != -1) {
            final updatedWebsocketResponse =
                List<WebsocketResponse>.from(state.websocketResponse);

            updatedWebsocketResponse[index] =
                websocketResponseList[index].copyWith(closePrice: closePrice);

            emit(state.copyWith(websocketResponse: updatedWebsocketResponse));
          }
        }
      }
    } on CustomError catch (e) {
      emit(
        state.copyWith(
          status: SymbolsAndClosePriceStatus.error,
          customError: e,
        ),
      );
    }
  }
}
