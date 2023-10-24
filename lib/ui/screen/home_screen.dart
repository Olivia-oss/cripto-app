import 'package:cripto_app/config/colors/colors.dart';
import 'package:cripto_app/config/providers/categoria_provider.dart';
import 'package:cripto_app/config/providers/coinmap_provider.dart';
import 'package:cripto_app/config/utilis/page_external.dart';
import 'package:cripto_app/config/utilis/screen_utils.dart';
import 'package:cripto_app/domain/models/coinmap/venue.dart';
import 'package:cripto_app/domain/models/ui/credit.dart';
import 'package:cripto_app/ui/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final categorySelect = ref.watch(categorySelectProvider);

    final Future<List<Venue>> venuesByCategory =
        ref.watch(categoryListVenusProvider);

    return Scaffold(
      appBar: const PreferredSize(
          preferredSize: Size.fromHeight(50), child: AppbarCustomer()),
      body: isScreenVertical(context)
          ? Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Categories(),
                _TitleMedium(category: categorySelect),
                _FutureCategories(
                    venuesByCategory: venuesByCategory,
                    category: categorySelect)
              ],
            )
          : Row(
              children: [
                const Categories(),
                Column(
                  children: [
                    _TitleMedium(category: categorySelect),
                    _FutureCategories(
                        venuesByCategory: venuesByCategory,
                        category: categorySelect)
                  ],
                )
              ],
            ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          dialogCredits(context);
        },
        backgroundColor: ColorsApp.colorGreenPistac10,
        child: const Icon(
          Icons.menu_book_outlined,
          color: Colors.white,
        ),
      ),
    );
  }

  void dialogCredits(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => Dialog(
        backgroundColor: Colors.white,
        child: Container(
          width: 200,
          height: 300,
          alignment: Alignment.center,
          decoration: BoxDecoration(
              color: Colors.white, borderRadius: BorderRadius.circular(20)),
          child: ListView(shrinkWrap: true, children: [
            const SizedBox(
              height: 10,
            ),
            Text(
              'CREDITS',
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                  color: ColorsApp.colorGray),
            ),
            ...listCredit
                .map((credit) => Padding(
                      padding: const EdgeInsets.only(
                        top: 10,
                      ),
                      child: GestureDetector(
                        onTap: () {
                          openURL(credit.url);
                        },
                        child: ListTile(
                          leading: Image.asset('assets/imgs/${credit.img}',
                              height: 30, width: 30, fit: BoxFit.cover),
                          title: Text(credit.name),
                        ),
                      ),
                    ))
                .toList(),
          ]),
        ),
      ),
    );
  }
}

class _FutureCategories extends StatelessWidget {
  const _FutureCategories({
    required this.venuesByCategory,
    required this.category,
  });

  final Future<List<Venue>> venuesByCategory;
  final String category;

  @override
  Widget build(BuildContext context) {
    final Size sizeScreen = MediaQuery.of(context).size;
    return FutureBuilder<List<Venue>>(
        future: venuesByCategory,
        builder: (BuildContext context, AsyncSnapshot<List<Venue>> snapshot) {
          if (snapshot.hasData) {
            if (snapshot.data!.first.category == category) {
              return Expanded(
                  child: SizedBox(
                      width: isScreenVertical(context)
                          ? sizeScreen.width
                          : sizeScreen.width - 200,
                      child: ListVenues(listVenue: snapshot.data)));
            }
          }
          return Padding(
            padding: const EdgeInsets.only(top: 50),
            child: Center(
              child: CircularProgressIndicator(
                color: ColorsApp.colorGreenPistac10,
              ),
            ),
          );
        });
  }
}

class _TitleMedium extends StatelessWidget {
  const _TitleMedium({
    required this.category,
  });

  final String category;

  @override
  Widget build(BuildContext context) {
    final styleTitle =
        TextStyle(color: ColorsApp.colorGray, fontWeight: FontWeight.w500);
    return Padding(
      padding: const EdgeInsets.only(left: 20, top: 20),
      child: Text(
        'CATEGORY ${category.toUpperCase()}',
        style: styleTitle,
      ),
    );
  }
}
