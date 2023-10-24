import 'package:flutter_dotenv/flutter_dotenv.dart';

class Enviroments {
  static String apiMapbox = dotenv.env['KEY_MAPBOX'] ?? '';
  static String keyGoogle = dotenv.env['KEY_GOOGLE'] ?? '';
}
