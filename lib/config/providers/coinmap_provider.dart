import 'package:cripto_app/config/utilis/map_utils.dart';
import 'package:cripto_app/domain/models/coinmap/coin.dart';
import 'package:cripto_app/domain/models/coinmap/venue.dart';
import 'package:cripto_app/domain/models/coinmap/venue_details.dart';
import 'package:cripto_app/domain/use_case/coin_use_case.dart';
import 'package:cripto_app/domain/use_case/venue_use_case.dart';
import 'package:cripto_app/infraestructure/driven_adapters/api/coinmap/coinmap_api.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final categoryListVenusProvider =
    NotifierProvider<_VenueCategoriesNotifier, Future<List<Venue>>>(
        _VenueCategoriesNotifier.new);

final placeListVenusProvider =
    NotifierProvider<_VenuePlaceNotifier, Future<List<Venue>>>(
        _VenuePlaceNotifier.new);

final venusProvider =
    NotifierProvider<_VenueNotifier, Future<VenueDetails>>(_VenueNotifier.new);

final coinsProvider = StateProvider<Future<List<Coin>>>(
    (ref) => CoinUseCase(CoinmapApi()).getAllCoins());

VenueUseCase venueUseCase = VenueUseCase(CoinmapApi());

class _VenueCategoriesNotifier extends Notifier<Future<List<Venue>>> {
  @override
  Future<List<Venue>> build() {
    return venueUseCase.getCategoryVenue('trezor retailer');
  }

  void categories(String category) {
    state = venueUseCase.getCategoryVenue(category);
  }
}

class _VenuePlaceNotifier extends Notifier<Future<List<Venue>>> {
  @override
  Future<List<Venue>> build() {
    return Future(() => []);
  }

  void byplace(String address) async {
    state = Future(() => []);
    MapUtils.getAdressCoordinates(address).then((locations) {
      state = venueUseCase.getByPlace(locations.latitude, locations.longitude);
    }).onError((error, stackTrace) {
      state = Future(() => [
            Venue(
                id: 0,
                lat: 0,
                lon: 0,
                category: '',
                name: 'none',
                createdOn: 0,
                geolocationDegrees: '')
          ]);
    });
  }
}

class _VenueNotifier extends Notifier<Future<VenueDetails>> {
  final Future<List<Coin>> iconsLogos = CoinUseCase(CoinmapApi()).getAllCoins();

  @override
  Future<VenueDetails> build() {
    return venueUseCase.getVenue(123);
  }

  void byIdVenue(int id) async {
    state = Future(() => VenueDetails(
        lat: 0,
        postcode: '',
        email: '',
        lon: 0,
        state: '',
        phone: '',
        category: '',
        country: '',
        logo: '',
        name: '',
        website: '',
        logoUrl: '',
        facebook: '',
        description: '',
        id: 0,
        street: '',
        twitter: '',
        houseno: '',
        instagram: '',
        city: '',
        coins: []));
    VenueDetails venue = await venueUseCase.getVenue(id);

    getImgIcon(venue.coins).then((result) {
      venue.coins = result;

      state = Future(() => venue);
    });
  }

  Future<List<String>> getImgIcon(List<dynamic>? iconsVenues) async {
    List<String> iconsNew = [];

    if (iconsVenues != null) {
      for (var name in iconsVenues) {
        var iconsApi =
            await iconsLogos; // Espera a que se resuelva la operación asincrónica
        for (var icon in iconsApi) {
          if (icon.symbol == name) {
            iconsNew.add('https://coinmap.org${icon.logo}');
          }
        }
      }
    }

    return iconsNew;
  }
}
