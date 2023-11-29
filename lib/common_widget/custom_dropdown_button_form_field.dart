import 'package:flutter/material.dart';
import 'package:flutter_app_sample/util/dropdown_item.dart';

class CustomDropdownButtonFormField extends StatelessWidget {
  const CustomDropdownButtonFormField({
    super.key,
    required this.itemList,
    required this.onChanged,
    this.decoration,
  });

  final List<DropdownItem> itemList;
  final void Function(DropdownItem? value) onChanged;
  final InputDecoration? decoration;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
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
                  item.dropDownLabel,
                ),
              ),
            )
            .toList(),
        onChanged: onChanged,
      ),
    );
  }
}
