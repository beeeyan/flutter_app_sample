import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'util/go_router.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  runApp(
    const ProviderScope(
      child: MyApp(),
    ),
  );
}

class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return MaterialApp.router(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
          routeInformationParser:
              ref.watch(goRouteProvider).routeInformationParser,
          routeInformationProvider:
              ref.watch(goRouteProvider).routeInformationProvider,
          routerDelegate: ref.watch(goRouteProvider).routerDelegate,
    );
  }
}
