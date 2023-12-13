import 'package:flutter/material.dart';
import 'package:flutter_app_sample/feature/drop_down/models/item.dart';
import 'package:gap/gap.dart';

import '../sample_data.dart';

class DropdownTypePage extends StatelessWidget {
  const DropdownTypePage({super.key});

  static const path = 'dropdowntype';

  @override
  Widget build(BuildContext context) {
    final itemList = items.map(Item.fromJson).toList();
    return Scaffold(
      appBar: AppBar(
        title: const Text('ドロップダウンに関連するWidget'),
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              const Text(
                'DropdownButton',
              ),
              const Gap(10),
              DropdownButton(
                value: itemList[0],
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
              const Gap(30),
              const Text(
                'DropdownButtonFormField「required」のみ指定',
              ),
              const Gap(10),
              DropdownButtonFormField(
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
              const Gap(20),
            ],
          ),
        ),
      ),
    );
  }
}
