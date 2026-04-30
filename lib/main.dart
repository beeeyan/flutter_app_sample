import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'util/go_router.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // debugPaintSizeEnabled = true;
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
      // セマンティックの実装状況を確認する
      // showSemanticsDebugger: true,
      theme: ThemeData(
        fontFamily: 'NotoSansJP',
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
