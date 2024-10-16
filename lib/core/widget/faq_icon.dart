import 'package:flutter/material.dart';
import 'package:heroicons/heroicons.dart';

class FaqIcon extends StatelessWidget {
  const FaqIcon({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        GestureDetector(
          behavior: HitTestBehavior.opaque,
          onTap: () {},
          child: Container(
            margin: const EdgeInsets.only(left: 24),
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: Colors.white,
              shape: BoxShape.circle,
              border: Border.all(
                color: const Color(0xffDFE4EA),
              ),
            ),
            child: const HeroIcon(
              HeroIcons.questionMarkCircle,
              size: 16,
              color: Color(0xff71808E),
            ),
          ),
        ),
        const SizedBox(width: 24),
      ],
    );
  }
}
