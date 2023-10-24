import 'package:cripto_app/domain/models/coinmap/coin.dart';
import 'package:cripto_app/domain/models/coinmap/gateway/coinmap_gateway.dart';
import 'package:cripto_app/domain/models/coinmap/venue.dart';
import 'package:cripto_app/domain/models/coinmap/venue_details.dart';
import 'package:cripto_app/infraestructure/driven_adapters/api/coinmap/errors/coinmap_api_error.dart';
import 'package:dio/dio.dart';

class CoinmapApi extends CoinmapGateway {
  final dio = Dio(BaseOptions(
    baseUrl: 'https://coinmap.org/api/v1',
  ));

  @override
  Future<List<Venue>> getVenues() async {
    final response = await dio.get('/venues', queryParameters: {'limit': 10});

    if (response.statusCode == 200) {
      return venueFromJson(response.data['venues']);
    } else {
      throw CoinmapApiError();
    }
  }

  @override
  Future<VenueDetails> getVenue(int id) async {
    final response = await dio.get(
      '/venues/$id',
    );
    if (response.statusCode == 200) {
      return VenueDetails.fromJson(response.data['venue']);
    } else {
      throw CoinmapApiError();
    }
  }

  @override
  Future<List<Venue>> getCategoryVenues({required category}) async {
    final response =
        await dio.get('/venues', queryParameters: {'category': category});

    if (response.statusCode == 200) {
      return venueFromJson(response.data['venues']);
    } else {
      throw CoinmapApiError();
    }
  }

  @override
  Future<List<Venue>> getPlaceVenues(double latitude, double longitud) async {
    final response = await dio.get('/venues', queryParameters: {
      'lat1': latitude - .3,
      'lat2': latitude + .3,
      'lon1': longitud - .3,
      'lon2': longitud + .3
    });

    if (response.statusCode == 200) {
      return venueFromJson(response.data['venues']);
    } else {
      throw CoinmapApiError();
    }
  }

  @override
  Future<List<Coin>> getAllCoins() async {
    final response = await dio.get('/coins');

    if (response.statusCode == 200) {
      return coinFromJson(response.data['coins']);
    } else {
      throw CoinmapApiError();
    }
  }
}
