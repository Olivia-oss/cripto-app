import 'package:cripto_app/domain/models/coinmap/coin.dart';
import 'package:cripto_app/domain/models/coinmap/venue.dart';
import 'package:cripto_app/domain/models/coinmap/venue_details.dart';

abstract class CoinmapGateway {
  Future<List<Venue>> getVenues();

  Future<List<Venue>> getCategoryVenues({required category});

  Future<List<Venue>> getPlaceVenues(double latitude, double longitud);

  Future<VenueDetails> getVenue(int id);

  Future<List<Coin>> getAllCoins();
}
