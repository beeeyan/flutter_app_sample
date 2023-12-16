import 'package:flutter/material.dart';
import 'package:flutter_app_sample/common_widget/custom_dropdown_button_form_field.dart';
import 'package:flutter_app_sample/feature/drop_down/models/item.dart';
import 'package:gap/gap.dart';

import '../../../util/dropdown_item.dart';
import '../sample_data.dart';

class DropdownFromFieldPage extends StatelessWidget {
  const DropdownFromFieldPage({super.key});

  static const path = 'dropdownformfield';

  @override
  Widget build(BuildContext context) {
    final itemList = items.map(Item.fromJson).toList();
    final nameList = names.map(Item.fromJson).toList();
    final itemList2 = items.map(
      (itemMap) {
        final item = Item.fromJson(itemMap);
        return DropdownItem(item, item.name);
      },
    ).toList();
    return Scaffold(
      appBar: AppBar(
        title: const Text('ドロップダウンサンプル'),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                const Text(
                  'ドロップダウン横幅',
                ),
                const Gap(10),
                IntrinsicWidth(
                  child: ConstrainedBox(
                    constraints: const BoxConstraints(
                      minWidth: 200,
                    ),
                    child: DropdownButtonFormField(
                      items: itemList
                          .map(
                            (item) => DropdownMenuItem(
                              value: item,
                              child: Text(
                                item.name,
                              ),
                            ),
                          )
                          .toList(),
                      onChanged: (value) => print(value),
                    ),
                  ),
                ),
                const Gap(20),
                const Text(
                  'ドロップダウン枠',
                ),
                const Gap(10),
                IntrinsicWidth(
                  child: ConstrainedBox(
                    constraints: const BoxConstraints(
                      minWidth: 200,
                    ),
                    child: DropdownButtonFormField(
                      decoration: const InputDecoration(
                        // デフォルトだと縦の余白が大きく感じる
                        contentPadding: EdgeInsets.symmetric(horizontal: 10),
                        border: OutlineInputBorder(),
                      ),
                      items: itemList
                          .map(
                            (item) => DropdownMenuItem(
                              value: item,
                              child: Text(
                                item.name,
                              ),
                            ),
                          )
                          .toList(),
                      onChanged: (value) => print(value),
                    ),
                  ),
                ),
                const Gap(20),
                const Text(
                  '長いアイテム',
                ),
                const Gap(10),
                IntrinsicWidth(
                  child: ConstrainedBox(
                    constraints: const BoxConstraints(
                      minWidth: 200,
                    ),
                    child: DropdownButtonFormField(
                      decoration: const InputDecoration(
                        // デフォルトだと縦の余白が大きく感じる
                        contentPadding: EdgeInsets.symmetric(horizontal: 10),
                        border: OutlineInputBorder(),
                      ),
                      selectedItemBuilder: (context) {
                        // 調整がシビア
                        final maxWidth = MediaQuery.sizeOf(context).width - 70;
                        return nameList.map((item) {
                          return ConstrainedBox(
                            constraints: BoxConstraints(
                              minWidth: 200,
                              maxWidth: maxWidth,
                            ),
                            child: Text(
                              item.name,
                              overflow: TextOverflow.ellipsis,
                            ),
                          );
                        }).toList();
                      },
                      items: nameList
                          .map(
                            (item) => DropdownMenuItem(
                              value: item,
                              child: Text(
                                // 文字数を18文字に制限
                                item.name,
                              ),
                            ),
                          )
                          .toList(),
                      onChanged: (value) => print(value),
                    ),
                  ),
                ),
                const Gap(20),
                const Text(
                  'itemsに値がない',
                ),
                const Gap(20),
                IntrinsicWidth(
                  child: ConstrainedBox(
                    constraints: const BoxConstraints(
                      minWidth: 200,
                    ),
                    child: DropdownButtonFormField(
                      decoration: const InputDecoration(
                        // デフォルトだと縦の余白が大きく感じる
                        contentPadding: EdgeInsets.symmetric(horizontal: 10),
                        border: OutlineInputBorder(),
                      ),
                      disabledHint: const Text('選択できません'),
                      items: null,
                      onChanged: (value) => print(value),
                    ),
                  ),
                ),
                const Gap(20),
                const Text(
                  'ドロップダウン、共通化の検討',
                ),
                const Gap(10),
                CustomDropdownButtonFormField<Item>(
                  itemList: itemList2,
                  onChanged: (value) {
                    if (value != null) {
                      print(value.name);
                    }
                  },
                ),
                const Gap(10),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
