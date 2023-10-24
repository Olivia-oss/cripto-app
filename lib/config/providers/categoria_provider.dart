import 'package:cripto_app/domain/models/ui/categories.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final categorySelectProvider =
    NotifierProvider<_CategoryNotifier, String>(_CategoryNotifier.new);

class _CategoryNotifier extends Notifier<String> {
  @override
  String build() {
    return categories.first.name;
  }

  void changeCategory(String name) => state = name;
}
