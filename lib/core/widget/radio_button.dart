import 'package:flutter/material.dart';
import 'package:cek_ongkir/core/core.dart';
import 'package:cek_ongkir/utils/utils.dart';

class RadioButton extends StatelessWidget {
  final dynamic currentValue;
  final List<dynamic> dataList;
  final String displayKey;
  final String idKey;
  final Function1<dynamic, void> onSelect;
  final Color primaryColor;
  const RadioButton({
    super.key,
    this.currentValue,
    required this.dataList,
    required this.displayKey,
    required this.idKey,
    required this.onSelect,
    required this.primaryColor,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: dataList.map((e) {
        final isSelected = e[idKey] == currentValue;
        return GestureDetector(
          onTap: () {
            onSelect(e[idKey]);
          },
          behavior: HitTestBehavior.opaque,
          child: Container(
            width: MediaQuery.of(context).size.width / 2.4,
            padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(4),
              border: Border.all(
                width: 1,
                color: const Color(0xffD8D8D8),
              ),
            ),
            child: SizedBox(
              width: 130,
              child: radioWidget(
                isSelected: isSelected,
                title: e[displayKey],
              ),
            ),
          ),
        );
      }).toList(),
    );
  }

  Widget radioWidget({
    required bool isSelected,
    required String title,
  }) {
    if (isSelected) {
      return Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.all(2),
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.white,
              border: Border.all(
                width: 2,
                color: primaryColor,
              ),
            ),
            child: Container(
              width: 8,
              height: 8,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: primaryColor,
              ),
            ),
          ),
          const SizedBox(width: 12),
          TextWidget(
            text: title,
            fontSize: 14,
            fontWeight: FontWeight.w400,
          ),
        ],
      );
    }
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Container(
          width: 16,
          height: 16,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: Colors.white,
            border: Border.all(
              width: 1,
              color: const Color(0xff9BA6AF),
            ),
          ),
        ),
        const SizedBox(width: 12),
        TextWidget(
          text: title,
          fontSize: 14,
          fontWeight: FontWeight.w400,
          color: const Color(0xff9BA6AF),
        ),
      ],
    );
  }
}

class RadioButtonCustom extends StatelessWidget {
  final Map<String, dynamic>? currentValue;
  final List<dynamic> dataList;
  final String displayKey;
  final String idKey;
  final Function1<Map<String, dynamic>, void> onSelect;
  final String primaryColor;
  final String bgColor;
  final String image;
  const RadioButtonCustom({
    super.key,
    this.currentValue,
    required this.dataList,
    required this.displayKey,
    required this.idKey,
    required this.onSelect,
    required this.primaryColor,
    required this.bgColor,
    required this.image,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: dataList.map((e) {
        final isSelected = e[idKey] == currentValue?[idKey];
        final pColor = Color(
          int.parse(e[primaryColor].toString().substring(2), radix: 16),
        );
        final bColor = Color(
          int.parse(e[bgColor].toString().substring(2), radix: 16),
        );
        return GestureDetector(
          onTap: () {
            onSelect(e);
          },
          behavior: HitTestBehavior.opaque,
          child: Container(
            width: MediaQuery.of(context).size.width / 2.4,
            decoration: BoxDecoration(
              color: bColor,
              borderRadius: BorderRadius.circular(8),
              border: Border.all(
                width: 1,
                color: isSelected ? pColor : Colors.transparent,
              ),
            ),
            child: Stack(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(
                    vertical: 16,
                    horizontal: 12,
                  ),
                  child: SizedBox(
                    width: 130,
                    child: radioWidget(
                      isSelected: isSelected,
                      title: e[displayKey],
                      pColor: pColor,
                    ),
                  ),
                ),
                Positioned(
                  bottom: 0,
                  right: 0,
                  child: ClipRRect(
                    borderRadius: const BorderRadius.only(
                      bottomRight: Radius.circular(8),
                    ),
                    child: Image.network(
                      e[image].toString(),
                      width: 39,
                      height: 43,
                      fit: BoxFit.fitWidth,
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      }).toList(),
    );
  }

  Widget radioWidget({
    required bool isSelected,
    required String title,
    required Color pColor,
  }) {
    if (isSelected) {
      return Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.all(2),
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.white,
              border: Border.all(
                width: 2,
                color: pColor,
              ),
            ),
            child: Container(
              width: 8,
              height: 8,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: pColor,
              ),
            ),
          ),
          const SizedBox(width: 12),
          TextWidget(
            text: title,
            fontSize: 14,
            fontWeight: FontWeight.w500,
          ),
        ],
      );
    }
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Container(
          width: 16,
          height: 16,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: Colors.transparent,
            border: Border.all(width: 1, color: pColor),
          ),
        ),
        const SizedBox(width: 12),
        TextWidget(
          text: title,
          fontSize: 14,
          fontWeight: FontWeight.w500,
        ),
      ],
    );
  }
}
