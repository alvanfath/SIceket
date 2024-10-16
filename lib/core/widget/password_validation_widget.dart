import 'package:flutter/material.dart';
import 'package:cek_ongkir/core/core.dart';
import 'package:cek_ongkir/utils/helper/helper.dart';
import 'package:cek_ongkir/utils/service/constant/constants.dart';

class PasswordValidate extends StatelessWidget {
  final String password;
  const PasswordValidate({super.key, required this.password});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Wrap(
        spacing: 4,
        runSpacing: 4,
        crossAxisAlignment: WrapCrossAlignment.start,
        alignment: WrapAlignment.start,
        runAlignment: WrapAlignment.start,
        children: [
          IntrinsicWidth(
            child: validateWidget(
              title: '8 karakter',
              isCheck: Validator.isValidLengthPassWord(password),
            ),
          ),
          IntrinsicWidth(
            child: validateWidget(
              title: 'angka',
              isCheck: Validator.isValidPasswordNumber(password),
            ),
          ),
          IntrinsicWidth(
            child: validateWidget(
              title: 'huruf kecil',
              isCheck: Validator.isValidLowerCase(password),
            ),
          ),
          IntrinsicWidth(
            child: validateWidget(
              title: 'kapital',
              isCheck: Validator.isValidUpperCase(password),
            ),
          ),
        ],
      ),
    );
  }

  Widget validateWidget({
    required String title,
    required bool isCheck,
  }) {
    if (isCheck) {
      return Container(
        padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 5),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          color: const Color(0xffEAF3EC),
        ),
        child: Row(
          children: [
            Icon(
              Icons.check,
              size: 12,
              color: Constants.get.primaryColor,
            ),
            const SizedBox(width: 4),
            TextWidget(
              text: title,
              color: Constants.get.primaryColor,
              fontSize: Constants.get.sizeXs,
            )
          ],
        ),
      );
    }
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 5),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: const Color(0xffFDEBE9),
      ),
      child: Row(
        children: [
          Icon(
            Icons.close,
            size: 12,
            color: Constants.get.errorColor,
          ),
          const SizedBox(width: 4),
          TextWidget(
            text: title,
            color: Constants.get.errorColor,
            fontSize: Constants.get.sizeXs,
          )
        ],
      ),
    );
  }
}
