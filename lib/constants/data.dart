import 'package:websocket_assignment/models/market_data.dart';
import 'package:websocket_assignment/models/websocket_response.dart';

const marketIndicesData = [
  MarketData(
    title: 'NIFTY 50',
    price: 17689.55,
    average: 65.5,
    percentage: 0.37,
  ),
  MarketData(
    title: 'SENSEX',
    price: 60057.63,
    average: 211.12,
    percentage: 0.35,
  ),
  MarketData(
    title: 'BANK NIFTY',
    price: 41317.25,
    average: 482.6,
    percentage: 1.18,
  ),
];

const jsonWebsocketResponseData =
    '[{"s":"BTCUSDT","c":"6464647"},{"s":"ETHUSDT","c":"65463647"},{"s":"EOSBTC","c":"6464647"},{"s":"DASHETH","c":"65463647"},{"s":"BNBUSDT","c":"6464647"},{"s":"WAVESETH","c":"65463647"},{"s":"ZILETH","c":"6464647"},{"s":"XRPUSDT","c":"65463647"},{"s":"ZENBTC","c":"6464647"},{"s":"FETBTC","c":"65463647"},{"s":"HOTUSDT","c":"6464647"},{"s":"ALGOBTC","c":"65463647"},{"s":"TRXXRP","c":"6464647"},{"s":"XLMUSDT","c":"65463647"},{"s":"ATOMUSDT","c":"6464647"},{"s":"ENJUSDT","c":"65463647"},{"s":"THETAUSDT","c":"6464647"},{"s":"IOTAETH","c":"65463647"}]';

const websocketMockData = [
  WebsocketResponse(
    symbol: 'BTCUSDT',
    closePrice: 6464647,
  ),
  WebsocketResponse(
    symbol: 'BTCUSDT',
    closePrice: 6464647,
  ),
  WebsocketResponse(
    symbol: 'BTCUSDT',
    closePrice: 6464647,
  ),
  WebsocketResponse(
    symbol: 'BTCUSDT',
    closePrice: 6464647,
  ),
  WebsocketResponse(
    symbol: 'BTCUSDT',
    closePrice: 6464647,
  ),
  WebsocketResponse(
    symbol: 'BTCUSDT',
    closePrice: 6464647,
  ),
  WebsocketResponse(
    symbol: 'BTCUSDT',
    closePrice: 6464647,
  ),
];
