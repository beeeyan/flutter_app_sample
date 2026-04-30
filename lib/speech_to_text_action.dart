import 'package:flutter/material.dart';
import 'package:flutter_app_sample/feature/voice_control/presentation/speech_result_view.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:speech_to_text/speech_to_text.dart';

class SpeechToTextAction extends HookWidget {
  const SpeechToTextAction({super.key});

  @override
  Widget build(BuildContext context) {
    // インスタンスを効率的に再利用するためuseMemoizedでラップ
    final speechToText = useMemoized(
      SpeechToText.new,
    );
    final isSpeechAvailable = useState(false);
    final isListening = useState(false);
    // 二重実行を防ぐためのフラグ
    // 値が変わった際に再ビルドは必要ないのでuseRefで保持
    final hasNavigatedBySpeech = useRef(false);
    final recognizedText = useState('ここに音声認識結果が表示されます');
    final statusText = useState('待機中');

    Future<void> startListening() async {
      if (!isSpeechAvailable.value) {
        final available = await speechToText.initialize(
          onStatus: (status) {
            statusText.value = 'status: $status';
            if (status == 'done' || status == 'notListening') {
              isListening.value = false;
            }
          },
          onError: (errorNotification) {
            statusText.value = 'error: ${errorNotification.errorMsg}';
            isListening.value = false;
          },
        );

        isSpeechAvailable.value = available;

        if (!available) {
          statusText.value = '音声認識が利用できません';
          return;
        }
      }

      hasNavigatedBySpeech.value = false;
      await speechToText.listen(
        localeId: 'ja_JP',
        onResult: (result) {
          final words = result.recognizedWords;
          recognizedText.value = words.isEmpty ? '認識できませんでした' : words;

          // 今回はうまく「'画面遷移して」で漢字変換され認識できている。
          // 文言によっては表記揺れを補えるようパターンを複数用意する必要があるかも。
          if (!hasNavigatedBySpeech.value && words.contains('画面遷移して')) {
            hasNavigatedBySpeech.value = true;
            context.go('/${SpeechResultView.path}');
          }
        },
      );

      isListening.value = true;
      statusText.value = '音声入力中...';
    }

    Future<void> stopListening() async {
      await speechToText.stop();
      isListening.value = false;
      statusText.value = '停止しました';
    }

    useEffect(
      () {
        return speechToText.cancel;
      },
      [speechToText],
    );

    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text('音声入力', style: TextStyle(fontWeight: FontWeight.bold)),
          const Gap(8),
          ElevatedButton.icon(
            onPressed: isListening.value ? stopListening : startListening,
            icon: Icon(isListening.value ? Icons.stop : Icons.mic),
            label: Text(isListening.value ? '音声入力を停止' : '音声入力を開始'),
          ),
          const Gap(8),
          ElevatedButton(
            onPressed: () => context.go('/${SpeechResultView.path}'),
            child: const Text('画面遷移ボタン'),
          ),
          const Gap(12),
          Text(
            '入力結果: ${recognizedText.value}',
            textAlign: TextAlign.center,
          ),
          const Gap(4),
          Text(
            '状態: ${statusText.value}',
            style: const TextStyle(fontSize: 12, color: Colors.black54),
          ),
        ],
      ),
    );
  }
}
