import 'package:flutter/material.dart';
import 'package:flutter_app_sample/feature/drop_down/presentation/drop_down_form_field_page.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';

import 'feature/drop_down/presentation/drop_down_type_page.dart';

class SampleListPage extends StatelessWidget {
  const SampleListPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            const Gap(20),
            FilledButton(
              onPressed: () => context.go('/${DropdownTypePage.path}'),
              child: const Text('ドロップダウンに関連するWidget'),
            ),
            const Gap(20),
            FilledButton(
              onPressed: () => context.go('/${DropdownFromFieldPage.path}'),
              child: const Text('ドロップダウンサンプル'),
            )
          ],
        ),
      ),
    );
  }
}
