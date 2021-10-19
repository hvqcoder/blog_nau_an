import 'package:flutter/material.dart';
import 'package:pilot_app/Helper/app_color.dart';
import 'package:pilot_app/Helper/app_text_style.dart';
import 'package:rxdart/rxdart.dart';
class ChipFilterWidget extends StatefulWidget {
  final int length;
  final BehaviorSubject<int> subject;
  final List<String> listData;
  final Function changeSelectedItem;
  final bool isShowIcon;

  const ChipFilterWidget({Key? key, required this.length,
    required this.subject,
    required this.listData,
    required this.changeSelectedItem,
    required this.isShowIcon}) : super(key: key);

  @override
  _ChipFilterWidgetState createState() => _ChipFilterWidgetState();
}

class _ChipFilterWidgetState extends State<ChipFilterWidget> {
  @override
  Widget build(BuildContext context) {
    return Wrap(
      children: List<Widget>.generate(
        widget.length,
            (int index) {
          return StreamBuilder<int>(
              stream: widget.subject,
              builder: (context, snapshot) {
                return Container(
                  margin: const EdgeInsets.symmetric(horizontal: 3),
                  child: ChoiceChip(
                    avatar: widget.subject.value == index && widget.isShowIcon == true
                        ? const SizedBox(width: 16, child: Icon(Icons.done))
                        : null,
                    label: Text(
                      widget.listData[index],
                      style: widget.subject.value == index
                          ? AppTextStyle.textChipSelected
                          : AppTextStyle.textChipUnSelected,
                    ),

                    selected: widget.subject.value == index,
                    onSelected: (bool selected) => widget.changeSelectedItem(index),
                    selectedColor: AppColor.chipSelected,
                    backgroundColor: AppColor.chipUnSelected,
                  ),
                );
              });
        },
      ).toList(),
    );
  }
}
