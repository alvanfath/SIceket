import 'package:flutter/material.dart';
import 'package:siceket/core/core.dart';
import 'package:siceket/utils/utils.dart';

class KeyValVertical extends StatelessWidget {
  final String title;
  final String subtitle;
  const KeyValVertical({
    super.key,
    required this.title,
    required this.subtitle,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TextWidget(
          text: title,
          fontWeight: FontWeight.w500,
          color: Constants.get.textSecondary,
        ),
        const SizedBox(height: 4),
        TextWidget(
          text: subtitle,
          fontSize: Constants.get.sizeMd,
        ),
      ],
    );
  }
}

class KeyValV extends StatelessWidget {
  final String title;
  final double sizeTitle;
  final FontWeight weightTitle;
  final Color colorTitle;
  final String subtitle;
  final double sizeSubtitle;
  final FontWeight weightSubtitle;
  final Color colorSubtitle;
  const KeyValV({
    super.key,
    required this.title,
    required this.subtitle,
    this.sizeTitle = 11,
    this.weightTitle = FontWeight.w400,
    this.colorTitle = const Color(0xff71808E),
    this.sizeSubtitle = 12,
    this.weightSubtitle = FontWeight.w500,
    this.colorSubtitle = const Color(0xff2D3338),
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TextWidget(
          text: title,
          fontWeight: weightTitle,
          fontSize: sizeTitle,
          color: colorTitle,
        ),
        const SizedBox(height: 4),
        TextWidget(
          text: subtitle,
          fontSize: sizeSubtitle,
          fontWeight: weightSubtitle,
          color: colorSubtitle,
        ),
      ],
    );
  }
}

class KeyValH extends StatelessWidget {
  final String title;
  final double sizeTitle;
  final FontWeight weightTitle;
  final Color colorTitle;
  final String subtitle;
  final double sizeSubtitle;
  final FontWeight weightSubtitle;
  final Color colorSubtitle;
  const KeyValH({
    super.key,
    required this.title,
    required this.subtitle,
    this.sizeTitle = 11,
    this.weightTitle = FontWeight.w400,
    this.colorTitle = const Color(0xff71808E),
    this.sizeSubtitle = 12,
    this.weightSubtitle = FontWeight.w500,
    this.colorSubtitle = const Color(0xff2D3338),
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TextWidget(
          text: title,
          fontWeight: weightTitle,
          fontSize: sizeTitle,
          color: colorTitle,
        ),
        TextWidget(
          text: subtitle,
          fontSize: sizeSubtitle,
          fontWeight: weightSubtitle,
          color: colorSubtitle,
        ),
      ],
    );
  }
}
