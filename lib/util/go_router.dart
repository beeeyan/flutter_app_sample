import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../feature/drop_down/presentation/drop_down_page.dart';
import '../root.dart';

final goRouteProvider = Provider<GoRouter>((ref) {
  return GoRouter(
    routes: [
      GoRoute(
        path: RootPage.path,
        builder: (context, state) => const RootPage(),
        routes: [
          GoRoute(
            path: DropdownPage.path,
            builder: (context, state) => const DropdownPage(),
          ),
        ],
      ),
    ],
  );
} 

);