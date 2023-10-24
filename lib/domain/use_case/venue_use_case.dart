import 'package:cripto_app/domain/models/coinmap/gateway/coinmap_gateway.dart';
import 'package:cripto_app/domain/models/coinmap/venue.dart';
import 'package:cripto_app/domain/models/coinmap/venue_details.dart';

class VenueUseCase {
  final CoinmapGateway _coinGateway;

  VenueUseCase(this._coinGateway);

  Future<List<Venue>> getAllVenues() {
    return _coinGateway.getVenues();
  }

  Future<List<Venue>> getCategoryVenue(String category) {
    return _coinGateway.getCategoryVenues(category: category);
  }

  Future<VenueDetails> getVenue(int id) {
    return _coinGateway.getVenue(id);
  }

  Future<List<Venue>> getByPlace(double latitude, double longitude) {
    return _coinGateway.getPlaceVenues(latitude, longitude);
  }
}
