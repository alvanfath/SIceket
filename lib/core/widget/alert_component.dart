import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:heroicons/heroicons.dart';
import 'package:cek_ongkir/core/core.dart';

import '../../utils/service/services.dart';

class AlertHelperComponent extends StatelessWidget {
  final String message;
  final String buttonTitle;
  final HeroIcons icon;
  final String? imageIcon;
  final VoidCallback onTap;
  const AlertHelperComponent({
    super.key,
    required this.message,
    required this.buttonTitle,
    required this.onTap,
    required this.icon,
    this.imageIcon,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: const Color(0xffEAF3EC),
      ),
      padding: const EdgeInsets.all(12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TextWidget(
            text: message,
            color: Constants.get.textSecondary,
          ),
          const SizedBox(height: 8),
          IntrinsicWidth(
            child: InkWell(
              onTap: onTap,
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 6),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Constants.get.primaryColor,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    iconWidget(context),
                    const SizedBox(width: 4),
                    TextWidget(
                      text: buttonTitle,
                      color: Colors.white,
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget iconWidget(BuildContext context) {
    if (imageIcon != null) {
      return SvgPicture.asset(imageIcon!);
    }
    return HeroIcon(
      icon,
      color: Colors.white,
      size: 12,
    );
  }
}
