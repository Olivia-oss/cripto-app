import 'package:cripto_app/config/colors/colors.dart';
import 'package:cripto_app/config/providers/coinmap_provider.dart';
import 'package:cripto_app/domain/models/coinmap/venue.dart';
import 'package:cripto_app/ui/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SearhScreen extends ConsumerWidget {
  final String address;
  const SearhScreen({super.key, required this.address});

  static String name = 'searh_screen';

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    Future<List<Venue>> listVenues = ref.watch(placeListVenusProvider);

    return Scaffold(
      appBar: PreferredSize(
          preferredSize: const Size.fromHeight(70),
          child: AppbarCustomer(
            textSearh: address,
          )),
      body: SizedBox(
        child: FutureBuilder(
          future: listVenues,
          builder: (BuildContext context, AsyncSnapshot<List<Venue>> snapshot) {
            if (snapshot.hasData) {
              if (snapshot.data!.isNotEmpty) {
                if (snapshot.data!.first.name != 'none') {
                  return ListVenues(listVenue: snapshot.data);
                }
                return Center(
                    child: SvgPicture.asset(
                  'assets/svgs/no_found.svg',
                  height: 200,
                ));
              }
            }

            return Center(
              child: CircularProgressIndicator(
                color: ColorsApp.colorGreenPistac,
              ),
            );
          },
        ),
      ),
    );
  }
}
