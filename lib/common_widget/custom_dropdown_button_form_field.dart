import 'package:flutter/material.dart';
import 'package:flutter_app_sample/util/dropdown_item.dart';

class CustomDropdownButtonFormField<T> extends StatelessWidget {
  const CustomDropdownButtonFormField({
    super.key,
    required this.itemList,
    required this.onChanged,
    this.decoration,
    this.disabledHint,
    this.minWidth = 200,
    this.maxWidth = double.infinity,
  });

  final List<DropdownItem> itemList;
  final ValueChanged<T?> onChanged;
  final InputDecoration? decoration;
  final String? disabledHint;
  final double minWidth;

  /// 横幅を固定したい際は、minWidthと同じ値を入れる。
  final double maxWidth;

  @override
  Widget build(BuildContext context) {
    return IntrinsicWidth(
      child: ConstrainedBox(
        constraints: BoxConstraints(
          minWidth: minWidth,
          maxWidth: maxWidth,
        ),
        child: DropdownButtonFormField(
          decoration: decoration ??
              const InputDecoration(
                // デフォルトだと縦の余白が大きく感じる
                contentPadding: EdgeInsets.symmetric(horizontal: 10),
                border: OutlineInputBorder(),
              ),
          selectedItemBuilder: (context) {
            // 調整がシビア
            final selectedMaxWidth = MediaQuery.of(context).size.width - 70;
            return itemList
                .map(
                  (item) => ConstrainedBox(
                    constraints: BoxConstraints(
                      minWidth: minWidth,
                      maxWidth: selectedMaxWidth,
                    ),
                    child: Text(
                      item.dropDownLabel,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                )
                .toList();
          },
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
          disabledHint: disabledHint != null ? Text(disabledHint!) : null,
          onChanged: (value) {
            if (value != null) {
              final item = value.item as T;
              onChanged(item);
            }
          },
        ),
      ),
    );
  }
}
