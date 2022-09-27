import 'package:flutter/material.dart';
import 'package:flutter_app_sample/enum/bottom_bar_page_type.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class RootPage extends ConsumerWidget {
  const RootPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final pageType = ref.watch(bottomBarPageTypeProvider);
    final pageTypeNotifier = ref.watch(bottomBarPageTypeProvider.notifier);
    return Scaffold(
      appBar: AppBar(
        title: Text(pageType.title),
        centerTitle: true,
      ),
      body: pageType.widget,
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        currentIndex: pageType.index,
        onTap: (index) =>
            pageTypeNotifier.update((state) => BottomBarPageType.values[index]),
        items:  <BottomNavigationBarItem>[
          for (final pageType in BottomBarPageType.values)
            BottomNavigationBarItem(
              icon: pageType.buttonIcon,
              label: pageType.title,
            )
        ],
      ),
    );
  }
}
