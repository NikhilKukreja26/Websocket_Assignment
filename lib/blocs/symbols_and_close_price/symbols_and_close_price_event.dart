part of 'symbols_and_close_price_bloc.dart';

abstract class SymbolsAndClosePriceEvent extends Equatable {
  const SymbolsAndClosePriceEvent();

  @override
  List<Object> get props => [];
}

class FetchSymbolsAndUpdateClosePriceEvent extends SymbolsAndClosePriceEvent {
  const FetchSymbolsAndUpdateClosePriceEvent();
}
