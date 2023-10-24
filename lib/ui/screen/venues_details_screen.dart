import 'package:cripto_app/config/colors/colors.dart';
import 'package:cripto_app/config/providers/coinmap_provider.dart';
import 'package:cripto_app/config/utilis/map_utils.dart';
import 'package:cripto_app/config/utilis/screen_utils.dart';
import 'package:cripto_app/domain/models/coinmap/venue_details.dart';
import 'package:cripto_app/ui/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class VenuesDetailsScreen extends ConsumerStatefulWidget {
  final int id;
  final String address;
  const VenuesDetailsScreen(
      {super.key, required this.id, required this.address});

  static String name = 'venues_details_screen';

  @override
  VenuesDetailsScreenState createState() => VenuesDetailsScreenState();
}

class VenuesDetailsScreenState extends ConsumerState<VenuesDetailsScreen> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      ref.read(venusProvider.notifier).byIdVenue(widget.id);
    });
  }

  @override
  Widget build(BuildContext context) {
    Future<VenueDetails> venue = ref.watch(venusProvider);
    final colorShema = Theme.of(context).colorScheme;
    final Size sizeScreen = MediaQuery.of(context).size;

    return Scaffold(
      body: SizedBox(
        height: double.infinity,
        child: FutureBuilder(
          future: venue,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              if (snapshot.data != null) {
                final VenueDetails venue = snapshot.data ??
                    VenueDetails(
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
                        coins: []);

                if (venue.id != 0) {
                  return SizedBox(
                    width: double.infinity,
                    height: double.infinity,
                    child: Stack(
                      children: [
                        SizedBox(
                            height: isScreenVertical(context)
                                ? sizeScreen.height * .75
                                : sizeScreen.height,
                            width: isScreenVertical(context)
                                ? sizeScreen.width
                                : sizeScreen.width * .75,
                            child: MappingAddress(
                                latitude: venue.lat, longitude: venue.lon)),
                        isScreenVertical(context)
                            ? Positioned(
                                bottom: 0,
                                child: InfoVenues(
                                  venue: venue,
                                  addressOptional: widget.address,
                                ),
                              )
                            : Positioned(
                                right: 0,
                                child: InfoVenues(
                                  venue: venue,
                                  addressOptional: widget.address,
                                ))
                      ],
                    ),
                  );
                }
              }
            }
            return Center(
              child: CircularProgressIndicator(
                color: ColorsApp.colorGreenPistac10,
              ),
            );
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: ColorsApp.colorGreenPistac,
        onPressed: () {
          venue.then((value) => MapUtils.openMap(value.lat, value.lon));
        },
        child: Icon(
          Icons.location_searching,
          color: colorShema.background,
        ),
      ),
    );
  }
}
