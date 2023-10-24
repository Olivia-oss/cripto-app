import 'package:cripto_app/domain/models/coinmap/coin.dart';
import 'package:cripto_app/domain/models/coinmap/gateway/coinmap_gateway.dart';

class CoinUseCase {
  final CoinmapGateway _coinGateway;

  CoinUseCase(this._coinGateway);

  Future<List<Coin>> getAllCoins() {
    return _coinGateway.getAllCoins();
  }
}
