import 'package:cripto_app/config/colors/colors.dart';
import 'package:cripto_app/domain/models/coinmap/venue.dart';
import 'package:cripto_app/ui/screen/venues_details_screen.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class ListVenues extends StatelessWidget {
  final List<Venue>? listVenue;
  final String keyWord;
  const ListVenues({super.key, required this.listVenue, this.keyWord = ''});

  @override
  Widget build(BuildContext context) {
    int colorIndex = -1;

    if (listVenue != null) {
      return ListView.builder(
        scrollDirection: Axis.vertical,
        shrinkWrap: true,
        itemCount: listVenue?.length,
        itemBuilder: (context, index) {
          if (colorIndex == 3) colorIndex = -1;
          colorIndex++;
          return _Card(
            color: colorPrimaries[colorIndex],
            venue: listVenue![index],
          );
        },
      );
    }
    return const SizedBox();
  }
}

class _Card extends StatelessWidget {
  final Venue venue;
  final Color color;
  const _Card({required this.color, required this.venue});

  @override
  Widget build(BuildContext context) {
    String address = '';
    final colorShema = Theme.of(context).colorScheme;
    return GestureDetector(
      onTap: () {
        if (address.isNotEmpty) {
          context.pushNamed(VenuesDetailsScreen.name,
              pathParameters: {'id': venue.id.toString(), 'address': address});
        }
      },
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 7),
        color: colorShema.background,
        child: ListTile(
          leading: Icon(Icons.location_on, color: color),
          title: Text(venue.name),
          subtitle: FutureBuilder(
            future: venue.getAdress,
            builder: (BuildContext context, AsyncSnapshot<String> snapshot) {
              if (snapshot.hasData) {
                address = snapshot.data ?? '';

                return Text(address);
              }
              return const Text('Searh address...');
            },
          ),
        ),
      ),
    );
  }
}
