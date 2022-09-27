import 'package:flutter/material.dart';
import 'package:flutter_app_sample/enum/update_request_type.dart';
import 'package:flutter_app_sample/feature/update_info/notifier/update_request_provider.dart';
import 'package:flutter_app_sample/presentation/widget/update_prompt_dialog.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

// アップデートがあった場合のキャンセルしたかどうかのフラグ
final notCanceledProvider = StateProvider.autoDispose<bool>((ref) => true);
final counterProvider = StateProvider((ref) => 0);

class MyHomePage extends ConsumerWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {

    // updateの確認
    // 記述箇所はアプリに応じて、考える必要があるかと思う
    final updateRequestType = ref.watch(updateRequesterProvider).value;
    final notCanceled = ref.watch(notCanceledProvider);

    // ビルド後にダイアログを表示させるための記法
    WidgetsBinding.instance.addPostFrameCallback((_) {
      // アップデートがあった場合
      if ((updateRequestType == UpdateRequestType.cancelable ||
              updateRequestType == UpdateRequestType.forcibly) &&
          notCanceled) {
        // 新しいバージョンがある場合はダイアログを表示する
        // barrierDismissible はダイアログ表示時の背景をタップしたときにダイアログを閉じてよいかどうか
        // updateの案内を勝手に閉じて欲しくないのでbarrierDismissibleはfalse
        showDialog<void>(
          context: context,
          barrierDismissible: false,
          builder: (context) {
            return UpdatePromptDialog(
              updateRequestType: updateRequestType,
            );
          },
        );
      }
    });

    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '${ref.watch(counterProvider)}',
              style: Theme.of(context).textTheme.headline4,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () =>
            ref.watch(counterProvider.notifier).update((state) => ++state),
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
