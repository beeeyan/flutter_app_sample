import 'package:flutter/material.dart';
import 'package:flutter_app_sample/feature/drop_down/models/item.dart';
import 'package:gap/gap.dart';

import '../sample_data.dart';

class DropdownTypePage extends StatefulWidget {
  const DropdownTypePage({super.key});

  static const path = 'dropdowntype';

  @override
  State<DropdownTypePage> createState() => _DropdownTypePageState();
}

class _DropdownTypePageState extends State<DropdownTypePage> {
  final itemList = items.map(Item.fromJson).toList();
  Item? dropdownValue;
  Item? dropdownMenuValue;
  Item? dropdownformfieldValue;

  @override
  Widget build(BuildContext context) {
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
                value: dropdownValue,
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
                onChanged: (value) {
                  setState(() {
                    dropdownValue = value;
                  });
                },
              ),
              const Gap(30),
              DropdownMenu<Item>(
                label: const Text(
                  'DropdownMenu',
                ),
                onSelected: (value) {
                  setState(() {
                    dropdownMenuValue = value;
                  });
                },
                dropdownMenuEntries: itemList
                    .map(
                      (item) => DropdownMenuEntry(
                        value: item,
                        label: item.name,
                      ),
                    )
                    .toList(),
              ),
              const Gap(30),
              const Text(
                'DropdownButtonFormField「required」のみ指定',
              ),
              const Gap(10),
              DropdownButtonFormField(
                value: dropdownformfieldValue,
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
                onChanged: (value) {
                  setState(() {
                    dropdownformfieldValue = value;
                  });
                },
              ),
              const Gap(20),
            ],
          ),
        ),
      ),
    );
  }
}
