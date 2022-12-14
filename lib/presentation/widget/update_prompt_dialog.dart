import 'package:app_review/app_review.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app_sample/enum/update_request_type.dart';
import 'package:flutter_app_sample/presentation/page/my_home.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class UpdatePromptDialog extends ConsumerWidget {
  const UpdatePromptDialog({
    super.key,
    required this.updateRequestType,
  });

  final UpdateRequestType? updateRequestType;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final notCanceledNotifier = ref.watch(notCanceledProvider.notifier);
    return WillPopScope(
      // AndroidのBackボタンで閉じられないようにする
      onWillPop: () async => false,
      child: AlertDialog(
        title: const Text('最新の更新があります。\nアップデートをお願いします。'),
        actions: [
          if (updateRequestType == UpdateRequestType.cancelable)
            TextButton(
              onPressed: () {
                notCanceledNotifier.update((state) => false);
                Navigator.pop(context);
              },
              child: const Text('キャンセル'),
            ),
          TextButton(
            onPressed: () {
              AppReview.storeListing;
            },
            child: const Text('アップデート'),
          ),
        ],
      ),
    );
  }
}
