import 'package:flutter_app_sample/feature/drop_down/presentation/drop_down_type_page.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../feature/drop_down/presentation/drop_down_form_field_page.dart';
import '../feature/field_size/presentation/dropdown_button_size_sample.dart';
import '../feature/field_size/presentation/dropdown_menu_size_sample.dart';
import '../feature/field_size/presentation/text_field_size_sample.dart';
import '../feature/field_size/presentation/field_size_sample.dart';
import '../feature/voice_control/presentation/speech_result_view.dart';
import '../root.dart';

final goRouteProvider = Provider<GoRouter>(
  (ref) {
    return GoRouter(
      routes: [
        GoRoute(
          path: RootPage.path,
          builder: (context, state) => const RootPage(),
          routes: [
            GoRoute(
              path: DropdownFromFieldPage.path,
              builder: (context, state) => const DropdownFromFieldPage(),
            ),
            GoRoute(
              path: DropdownTypePage.path,
              builder: (context, state) => const DropdownTypePage(),
            ),
            GoRoute(
              path: TextFieldSizeSamplePage.path,
              builder: (context, state) => const TextFieldSizeSamplePage(),
            ),
            GoRoute(
              path: DorpdownButtonSamplePage.path,
              builder: (context, state) => const DorpdownButtonSamplePage(),
            ),
            GoRoute(
              path: DorpdownMenuSamplePage.path,
              builder: (context, state) => const DorpdownMenuSamplePage(),
            ),
            GoRoute(
              path: FieldSizeSamplePage.path,
              builder: (context, state) => const FieldSizeSamplePage(),
            ),
            GoRoute(
              path: SpeechResultView.path,
              builder: (context, state) => const SpeechResultView(),
            )
          ],
        ),
      ],
    );
  },
);
