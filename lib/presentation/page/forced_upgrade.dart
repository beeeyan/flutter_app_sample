import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../enum/update_request_type.dart';
import '../../feature/update_info/notifier/update_request_provider.dart';
import '../common_widget/update_prompt_dialog.dart';


// アップデートがあった場合のキャンセルしたかどうかのフラグ
final notCanceledProvider = StateProvider.autoDispose<bool>((ref) => true);

class ForcedUpgradePage extends ConsumerWidget {
  const ForcedUpgradePage({super.key});

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

    return const Scaffold(
      body: Center(
        child: Text('強制アップデートの確認用画面'),
      ),// This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
