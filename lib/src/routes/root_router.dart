import 'package:go_router/go_router.dart';
import 'package:test_drive/src/routes/router_name.dart';
import 'package:test_drive/src/screen/dashboard/dashboard.dart';
import 'package:test_drive/src/screen/login/login.dart';

class RootRouter {
  static GoRouter router = GoRouter(routes: <RouteBase>[
    GoRoute(
      path: RouterName.listName['home']['path'],
      builder: (context, state) => const Login(title: 'Login'),
    ),
    GoRoute(
      path: RouterName.listName['dashboard']['path'],
      builder: (context, state) => const Dashboard(),
    )
  ]);
}
