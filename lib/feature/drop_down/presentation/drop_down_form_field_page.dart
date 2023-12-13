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
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              const Text(
                'プルダウン1',
              ),
              const Gap(10),
              SizedBox(
                width: 200,
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
              const Gap(20),
              const Text(
                'プルダウン2',
              ),
              const Gap(10),
              CustomDropdownButtonFormField(
                itemList: itemList2,
                onChanged: (value) {
                  if (value != null) {
                    final a = value.item as Item;
                    print(a.description);
                  }
                },
              ),
              const Gap(10),
            ],
          ),
        ),
      ),
    );
  }
}
