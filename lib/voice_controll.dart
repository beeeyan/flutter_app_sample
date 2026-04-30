import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class VoiceControl extends StatelessWidget {
  const VoiceControl({super.key});

  void _showDialog(BuildContext context, String label) {
    showDialog<void>(
      context: context,
      builder: (_) => AlertDialog(
        title: const Text('タップされました'),
        content: Text('「$label」がタップされました'),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child: const Text('閉じる'),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Gap(24),
            // ✅ 良い例: テキスト付きボタン（音声コントロールでラベルが認識される）
            const Text('✅ 良い例', style: TextStyle(fontWeight: FontWeight.bold)),
            const Gap(8),
            ElevatedButton(
              onPressed: () => _showDialog(context, '送信ボタン'),
              child: const Text('送信'),
            ),
            const Gap(8),
            TextButton(
              onPressed: () => _showDialog(context, 'キャンセルボタン'),
              child: const Text('キャンセル'),
            ),
            const Gap(8),
            // ✅ 良い例: tooltip あり IconButton（音声コントロールでラベルが認識される）
            IconButton(
              tooltip: 'お気に入りに追加',
              icon: const Icon(Icons.favorite_border),
              onPressed: () => _showDialog(context, 'お気に入りに追加'),
            ),
            const Gap(8),
            // ✅ 良い例: Semantics でラベルを付与した GestureDetector
            Semantics(
              label: 'カスタムタップエリア',
              button: true,
              child: GestureDetector(
                onTap: () => _showDialog(context, 'カスタムタップエリア'),
                child: Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                  decoration: BoxDecoration(
                    color: Colors.blue.shade100,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: const Text('カスタムタップエリア（Semantics あり）'),
                ),
              ),
            ),
            const Gap(32),
            // ❌ 悪い例
            const Text(
              '❌ 悪い例（音声コントロールで操作しにくい）',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            const Gap(8),
            // ❌ 悪い例: tooltip なし IconButton（音声コントロールでラベルなし）
            IconButton(
              icon: const Icon(Icons.delete),
              onPressed: () => _showDialog(context, '削除ボタン（tooltipなし）'),
              // tooltip なし → 音声コントロールでボタン番号しか表示されない
            ),
            const Gap(8),
            // ❌ 悪い例: Semantics なし GestureDetector（音声コントロールで認識されない）
            GestureDetector(
              onTap: () => _showDialog(context, 'ラベルなしタップエリア'),
              child: Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                decoration: BoxDecoration(
                  color: Colors.red.shade100,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: const Text('タップエリア（Semantics なし）'),
              ),
            ),
            const Gap(8),
            // ❌ 悪い例: ラベルなし画像ボタン
            GestureDetector(
              onTap: () => _showDialog(context, '画像ボタン（altなし）'),
              child: const Icon(Icons.image, size: 48, color: Colors.grey),
              // Semantics なし → 音声コントロールで識別不可
            ),
            const Gap(32),
            // ❌ 悪い例: ラベルなし画像ボタン
            const Text(
              '✅ 改善(「画像タップ」)というと動作する。',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            GestureDetector(
              onTap: () => _showDialog(context, '改善の画像'),
              child: const Icon(
                Icons.image,
                size: 48,
                color: Colors.grey,
                semanticLabel: '画像',
              ),
              // Semantics あり → 音声コントロールで識別可能
            ),
          ],
        ),
      ),
    );
  }
}
