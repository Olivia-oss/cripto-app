import 'package:cripto_app/config/colors/colors.dart';
import 'package:cripto_app/config/providers/coinmap_provider.dart';
import 'package:cripto_app/config/providers/theme_provider.dart';
import 'package:cripto_app/ui/screen/searh_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class AppbarCustomer extends ConsumerWidget {
  final String textSearh;
  const AppbarCustomer({super.key, this.textSearh = ''});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final bool isDark = ref.watch(isDarkProvider);
    return AppBar(
      title: Container(
        height: 70,
        padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
        child: TextFormField(
          initialValue: textSearh,
          onFieldSubmitted: (value) {
            if (value.isNotEmpty) {
              ref.read(placeListVenusProvider.notifier).byplace(value);
              context.pushNamed(SearhScreen.name,
                  pathParameters: {'address': value});
            }
          },
          decoration: InputDecoration(
              border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                  borderSide: BorderSide.none),
              fillColor: ColorsApp.colorGreen10,
              filled: true,
              hintText: 'Searh by adress',
              hintStyle: TextStyle(color: ColorsApp.colorGray),
              suffixIcon: Icon(
                Icons.search,
                color: ColorsApp.colorGreenPistac,
              )),
        ),
      ),
      actions: [
        Padding(
          padding: const EdgeInsets.only(right: 10),
          child: IconButton(
              onPressed: () {
                ref.read(isDarkProvider.notifier).state = !isDark;
              },
              icon: isDark
                  ? const Icon(
                      Icons.dark_mode_outlined,
                      color: Colors.white,
                    )
                  : const Icon(
                      Icons.light_mode_outlined,
                    )),
        )
      ],
    );
  }
}
