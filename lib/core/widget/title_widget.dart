import 'package:flutter/widgets.dart';
import 'package:siceket/core/core.dart';
import 'package:siceket/utils/utils.dart';

class TitleWidget extends StatelessWidget {
  final String title;
  final String subtitle;
  const TitleWidget({super.key, required this.title, required this.subtitle});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TextWidget(
          text: title,
          fontSize: Constants.get.size2Xl,
          fontWeight: FontWeight.w600,
        ),
        const SizedBox(height: 12),
        TextWidget(
          text: subtitle,
          fontSize: Constants.get.sizeMd,
          color: const Color(0xff71808E),
        ),
      ],
    );
  }
}
