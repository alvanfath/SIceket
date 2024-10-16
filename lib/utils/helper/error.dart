import 'package:flutter/material.dart';
import 'package:siceket/core/core.dart';

void failureGenerator(
  BuildContext context,
  ServerFailure? left,
) {
  showErrorBottom(
    context: context,
    title: left?.titleMessage ?? '',
    image: left?.image ?? '',
    error: left?.message ?? '',
  );
}

void showErrorPopUp({
  required BuildContext context,
  String image = 'assets/images/icon/falied.svg',
  String title = 'Sepertinya terjadi kesalahan',
  required String error,
}) {
  showDialog(
    context: context,
    builder: (dialogContext) {
      return ModalPopUp(
        icon: image,
        title: title,
        message: error,
        actions: [
          Button(
            title: 'OK',
            paddingY: 12.5,
            fontSize: 12,
            onPressed: () {
              Navigator.pop(dialogContext);
            },
          )
        ],
      );
    },
  );
}

void showErrorBottom({
  required BuildContext context,
  String image = 'assets/images/icon/falied.svg',
  String title = 'Sepertinya terjadi kesalahan',
  required String error,
}) {
  showModalBottomSheet(
    context: context,
    builder: (dialogContext) {
      return ModaLBottomWidget(
        icon: image,
        title: title,
        subtitle: error,
        additionalContent: [
          Button(
            title: 'OK',
            paddingY: 12.5,
            fontSize: 12,
            onPressed: () {
              Navigator.pop(dialogContext);
            },
          )
        ],
      );
    },
  );
}
