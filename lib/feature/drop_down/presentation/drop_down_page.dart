import 'package:flutter/material.dart';
import 'package:flutter_app_sample/feature/drop_down/models/item.dart';
import 'package:gap/gap.dart';

class DropdownPage extends StatelessWidget {
  const DropdownPage({super.key});

  @override
  Widget build(BuildContext context) {
    final itemList = items.map(Item.fromJson).toList();
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'プルダウン',
            ),
            const Gap(20),
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
            const Gap(10),
          ],
        ),
      ),
    );
  }
}

final items = <Map<String, dynamic>>[
  {'id': 1, 'name': '椅子', 'description': '座るためのもの'},
  {'id': 2, 'name': 'テーブル', 'description': '食事を置くためのもの'},
  {'id': 3, 'name': 'ベッド', 'description': '寝るためのもの'},
];
