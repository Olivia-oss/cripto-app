import 'package:cripto_app/config/constants/enviroments.dart';
import 'package:cripto_app/infraestructure/driven_adapters/api/coinmap/errors/coinmap_api_error.dart';
import 'package:external_app_launcher/external_app_launcher.dart';
import 'package:google_geocoding_api/google_geocoding_api.dart';
import 'package:latlong2/latlong.dart';
import 'package:url_launcher/url_launcher.dart';

class MapUtils {
  MapUtils._();

  static Future<void> openMap(double lat, double lng) async {
    Uri url = Uri.parse('geo:$lat,$lng?q=$lat,$lng');

    // ignore: deprecated_member_use
    if (await canLaunch(url.toString())) {
      // ignore: deprecated_member_use
      await launch(url.toString());
    } else {
      await LaunchApp.openApp(
        androidPackageName: 'com.google.android.gms.maps',
        iosUrlScheme: 'maps://',
        openStore: true,
      );
    }
  }

  static Future<String> getAdressName(double lat, double lon) async {
    String googelApiKey = Enviroments.keyGoogle;
    const bool isDebugMode = true;
    final api = GoogleGeocodingApi(googelApiKey, isLogged: isDebugMode);
    final GoogleGeocodingResponse reversedSearchResults = await api.reverse(
      '$lat,$lon',
      language: 'en',
    );

    if (reversedSearchResults.status == "OK") {
      return reversedSearchResults.results.first.formattedAddress;
    } else {
      throw CoinmapApiError();
    }
  }

  static Future<LatLng> getAdressCoordinates(String address) async {
    String googelApiKey = Enviroments.keyGoogle;
    const bool isDebugMode = true;
    final api = GoogleGeocodingApi(googelApiKey, isLogged: isDebugMode);
    final searchResults = await api.search(
      address,
      language: 'en',
    );

    if (searchResults.status == "OK") {
      double lat = searchResults.results.first.geometry?.location.lat ?? 0;
      double lon = searchResults.results.first.geometry?.location.lng ?? 0;

      final coordinates = LatLng(lat, lon);
      return coordinates;
    } else {
      throw CoinmapApiError();
    }
  }
}
