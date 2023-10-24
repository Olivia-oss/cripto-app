import 'package:cripto_app/config/colors/colors.dart';
import 'package:cripto_app/config/utilis/screen_utils.dart';
import 'package:cripto_app/domain/models/coinmap/venue_details.dart';
import 'package:cripto_app/domain/models/ui/categories.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class InfoVenues extends StatelessWidget {
  final VenueDetails venue;
  final String addressOptional;
  const InfoVenues(
      {super.key, required this.venue, required this.addressOptional});

  String getStreet() {
    String addressV = '';
    if (venue.street.toString().toLowerCase() != 'null') {
      addressV += '${venue.street.toString()}, ';
    }
    if (venue.postcode.toString().toLowerCase() != 'null') {
      addressV += '${venue.postcode.toString()}, ';
    }
    if (venue.city.toString().toLowerCase() != 'null') {
      addressV += '${venue.city.toString()}, ';
    }
    if (venue.country.toString().toLowerCase() != 'null') {
      addressV += venue.country.toString();
    }

    if (addressV.isEmpty) {
      return addressOptional.toUpperCase();
    } else {
      return addressV.toUpperCase();
    }
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    final colorShema = Theme.of(context).colorScheme;
    const BorderRadius borderRadiusContainerV = BorderRadius.only(
        topLeft: Radius.circular(50), topRight: Radius.circular(50));
    const BorderRadius borderRadiusContainerH = BorderRadius.only(
        topLeft: Radius.circular(50), bottomLeft: Radius.circular(50));
    const BorderRadius borderRadiusContainerHTitle = BorderRadius.only(
      topLeft: Radius.circular(50),
    );

    return Container(
      height: isScreenVertical(context)
          ? size.height - size.height * .55
          : size.height,
      width: isScreenVertical(context) ? size.width : size.width * .45,
      decoration: BoxDecoration(
        color: colorShema.background,
        borderRadius: isScreenVertical(context)
            ? borderRadiusContainerV
            : borderRadiusContainerH,
      ),
      child: Stack(children: [
        Positioned(
          top: 100,
          right: 10,
          child: Transform.rotate(
            angle: -.4,
            child: Icon(
              getCategoryIcon(),
              size: 200,
              color: ColorsApp.colorGray10,
            ),
          ),
        ),
        Container(
          width: size.width,
          height: 70,
          alignment: Alignment.center,
          decoration: BoxDecoration(
              borderRadius: isScreenVertical(context)
                  ? borderRadiusContainerV
                  : borderRadiusContainerHTitle,
              color: ColorsApp.colorGreenPistac),
          child: Text(
            venue.name.toString(),
            style: TextStyle(color: colorShema.background, fontSize: 25),
          ),
        ),
        Positioned(
          top: 70,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _ItemsDetails(
                  icon: Icons.category_outlined,
                  widget: Text(venue.category.toString().toUpperCase()),
                ),
                _ItemsDetails(
                  icon: Icons.signpost_outlined,
                  widget: Text(getStreet()),
                ),
                if (venue.description.toString().toUpperCase() != 'NULL')
                  _ItemsDetails(
                    icon: Icons.description_outlined,
                    widget: Text(venue.description.toString().toUpperCase()),
                  ),
                if (venue.website.toString().toUpperCase() != 'NULL')
                  _ItemsDetails(
                    icon: Icons.language_outlined,
                    widget:
                        SelectableText(venue.website.toString().toUpperCase()),
                  ),
                if (venue.email.toString().toUpperCase() != 'NULL')
                  _ItemsDetails(
                    icon: Icons.email_outlined,
                    widget:
                        SelectableText(venue.email.toString().toUpperCase()),
                  ),
                if (venue.phone.toString().toUpperCase() != 'NULL')
                  _ItemsDetails(
                    icon: Icons.phone_android_outlined,
                    widget:
                        SelectableText(venue.phone.toString().toUpperCase()),
                  ),
                if (venue.coins!.isNotEmpty)
                  _ItemsDetails(
                      icon: Icons.currency_bitcoin_outlined,
                      widget: SizedBox(
                        width: size.width,
                        height: 40,
                        child: ListView(
                          shrinkWrap: true,
                          scrollDirection: Axis.horizontal,
                          children: venue.coins!.map((img) {
                            if (img.toString().length > 10) {
                              return Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: SvgPicture.network(
                                  img,
                                  height: 20,
                                ),
                              );
                            } else {
                              return Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: SizedBox(
                                  height: 20,
                                  width: 20,
                                  child: CircularProgressIndicator(
                                    color: ColorsApp.colorGreenPistac,
                                  ),
                                ),
                              );
                            }
                          }).toList(),
                        ),
                      )),
              ],
            ),
          ),
        )
      ]),
    );
  }

  IconData? getCategoryIcon() {
    for (var category in categories) {
      if (category.name == venue.category) {
        return category.icon;
      }
    }

    return Icons.location_on_outlined;
  }
}

class _ItemsDetails extends StatelessWidget {
  final Widget widget;
  final IconData icon;
  const _ItemsDetails({required this.widget, required this.icon});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: Row(
        children: [
          Icon(
            icon,
            color: ColorsApp.colorGray,
          ),
          const SizedBox(
            width: 10,
          ),
          SizedBox(width: size.width - 50, child: widget)
        ],
      ),
    );
  }
}
