part of 'symbols_and_close_price_bloc.dart';

enum SymbolsAndClosePriceStatus {
  initial,
  loading,
  loaded,
  error,
}

class SymbolsAndClosePriceState extends Equatable {
  final SymbolsAndClosePriceStatus status;
  final List<WebsocketResponse> websocketResponse;
  final CustomError customError;

  const SymbolsAndClosePriceState({
    required this.status,
    required this.websocketResponse,
    required this.customError,
  });

  factory SymbolsAndClosePriceState.initial() {
    return const SymbolsAndClosePriceState(
      status: SymbolsAndClosePriceStatus.initial,
      websocketResponse: [],
      customError: CustomError(),
    );
  }

  SymbolsAndClosePriceState copyWith({
    SymbolsAndClosePriceStatus? status,
    List<WebsocketResponse>? websocketResponse,
    CustomError? customError,
  }) {
    return SymbolsAndClosePriceState(
      status: status ?? this.status,
      websocketResponse: websocketResponse ?? this.websocketResponse,
      customError: customError ?? this.customError,
    );
  }

  @override
  String toString() =>
      'SymbolsAndClosePriceState(status: $status, websocketResponse: $websocketResponse, customError: $customError)';

  @override
  List<Object> get props => [status, websocketResponse, customError];
}
