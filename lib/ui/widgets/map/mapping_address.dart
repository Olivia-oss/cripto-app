import 'package:cripto_app/config/colors/colors.dart';
import 'package:cripto_app/config/constants/enviroments.dart';
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';

class MappingAddress extends StatefulWidget {
  final double latitude;
  final double longitude;
  const MappingAddress({
    super.key,
    required this.latitude,
    required this.longitude,
  });

  @override
  State<MappingAddress> createState() => _MappingAddressState();
}

class _MappingAddressState extends State<MappingAddress> {
  late MapController mapController;

  late List<Marker> markers = [];

  double zoom = 14;
  late LatLng positionVenue;
  @override
  void initState() {
    super.initState();

    mapController = MapController();

    positionVenue = LatLng(widget.latitude, widget.longitude);
  }

  @override
  void dispose() {
    mapController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return FlutterMap(
      mapController: mapController,
      options: MapOptions(
        initialCenter: positionVenue,
        initialZoom: zoom,
        onMapReady: () {
          markers.add(Marker(
            point: positionVenue,
            child: Icon(Icons.location_on, size: 40, color: ColorsApp.colorRed),
          ));
          setState(() {
            markers;
          });
        },
      ),
      children: [
        TileLayer(
          urlTemplate:
              'https://api.mapbox.com/styles/v1/mapbox/streets-v11/tiles/{z}/{x}/{y}?access_token={access_token}',
          additionalOptions: {'access_token': Enviroments.apiMapbox},
        ),
        MarkerLayer(
          markers: markers,
        ),
      ],
    );
  }
}
