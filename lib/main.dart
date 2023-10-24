import 'package:cripto_app/config/providers/theme_provider.dart';
import 'package:cripto_app/config/routers/app_router.dart';
import 'package:cripto_app/config/themes/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

Future main() async {
  await dotenv.load(fileName: '.env');
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final bool isDark = ref.watch(isDarkProvider);
    return MaterialApp.router(
      routerConfig: appRouter,
      theme: AppTheme(isDark: isDark).getThemeData(),
      debugShowCheckedModeBanner: false,
      title: 'Material App',
    );
  }
}
