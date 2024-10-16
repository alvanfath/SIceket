import 'package:flutter/material.dart';
import 'package:heroicons/heroicons.dart';
import 'package:siceket/utils/utils.dart';

class ErrorIcon extends StatelessWidget {
  final bool isError;
  const ErrorIcon({super.key, required this.isError});

  @override
  Widget build(BuildContext context) {
    if (isError) {
      return HeroIcon(
        HeroIcons.exclamationTriangle,
        color: Constants.get.errorColor,
      );
    }
    return const SizedBox.shrink();
  }
}
