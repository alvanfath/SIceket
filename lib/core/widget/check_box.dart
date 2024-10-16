import 'package:flutter/material.dart';
import 'package:cek_ongkir/utils/service/constant/constants.dart';

class CheckBoxWidget extends StatelessWidget {
  final bool isCheck;
  final Widget title;
  final VoidCallback onTap;
  const CheckBoxWidget({
    super.key,
    required this.isCheck,
    required this.title,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: onTap,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          checkWidget(isCheck),
          const SizedBox(width: 8),
          Flexible(child: title),
        ],
      ),
    );
  }

  Widget checkWidget(bool check) {
    if (check == true) {
      return Container(
        width: 16,
        height: 16,
        decoration: ShapeDecoration(
          color: Constants.get.primaryColor,
          shape: RoundedRectangleBorder(
            side: const BorderSide(width: 1, color: Color(0xffE9F6EB)),
            borderRadius: BorderRadius.circular(2),
          ),
        ),
        alignment: Alignment.center,
        child: const Icon(
          Icons.check,
          color: Colors.white,
          size: 12,
        ),
      );
    } else {
      return Container(
        width: 16,
        height: 16,
        decoration: ShapeDecoration(
          color: Colors.white,
          shape: RoundedRectangleBorder(
            side: const BorderSide(width: 1, color: Color(0xFFDDDDDD)),
            borderRadius: BorderRadius.circular(2),
          ),
        ),
      );
    }
  }
}
