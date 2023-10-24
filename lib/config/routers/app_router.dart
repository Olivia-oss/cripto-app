import 'package:cripto_app/config/constants/route_path_constants.dart';
import 'package:cripto_app/ui/screen/home_screen.dart';
import 'package:cripto_app/ui/screen/searh_screen.dart';
import 'package:cripto_app/ui/screen/venues_details_screen.dart';
import 'package:go_router/go_router.dart';

final appRouter = GoRouter(initialLocation: '/', routerNeglect: true, routes: [
  GoRoute(
    path: RoutePathContans.home,
    builder: (context, state) => const HomeScreen(),
  ),
  GoRoute(
      path: RoutePathContans.searh,
      name: SearhScreen.name,
      builder: (context, state) =>
          SearhScreen(address: state.pathParameters['address'].toString())),
  GoRoute(
    path: RoutePathContans.venuesDetails,
    name: VenuesDetailsScreen.name,
    builder: (context, state) => VenuesDetailsScreen(
      id: int.parse(state.pathParameters['id'].toString()),
      address: state.pathParameters['address'].toString(),
    ),
  )
]);
