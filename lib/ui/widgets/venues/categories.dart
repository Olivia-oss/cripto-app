import 'package:cripto_app/config/providers/categoria_provider.dart';
import 'package:cripto_app/config/providers/coinmap_provider.dart';
import 'package:cripto_app/config/utilis/screen_utils.dart';
import 'package:cripto_app/domain/models/ui/categories.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class Categories extends StatelessWidget {
  const Categories({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final Size sizeScreen = MediaQuery.of(context).size;
    return SizedBox(
      height: isScreenVertical(context) ? 170 : sizeScreen.height,
      width: isScreenVertical(context) ? sizeScreen.width : 200,
      child: ListView(
        scrollDirection:
            isScreenVertical(context) ? Axis.horizontal : Axis.vertical,
        children: categories
            .map((category) => _ItemCategory(
                  category: category,
                ))
            .toList(),
      ),
    );
  }
}

class _ItemCategory extends ConsumerWidget {
  final Category category;
  const _ItemCategory({required this.category});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    String categorySelect = ref.watch(categorySelectProvider);
    final colorScheme = Theme.of(context).colorScheme;
    final labelText = TextStyle(
        color: colorScheme.background,
        fontWeight: FontWeight.w700,
        fontSize: 16);
    return GestureDetector(
      onTap: () {
        ref.read(categorySelectProvider.notifier).changeCategory(category.name);

        ref.read(categoryListVenusProvider.notifier).categories(category.name);
      },
      child: Container(
        margin: const EdgeInsets.all(15),
        width: 170,
        height: 170,
        decoration: BoxDecoration(
            color: category.colorPrimary,
            borderRadius: BorderRadius.circular(20),
            boxShadow: [
              BoxShadow(
                  offset: const Offset(13, 10),
                  color: category.colorSecondary,
                  blurRadius: (categorySelect == category.name) ? 5 : 0)
            ]),
        child: Stack(
          children: [
            Positioned(
              top: 20,
              left: 23,
              child: Icon(
                category.icon,
                color: colorScheme.background,
                size: 30,
              ),
            ),
            Positioned(
                bottom: 40,
                left: 23,
                child: Text(
                  category.name.toUpperCase(),
                  style: labelText,
                ))
          ],
        ),
      ),
    );
  }
}
