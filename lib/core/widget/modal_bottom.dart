import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:cek_ongkir/core/core.dart';
import 'package:cek_ongkir/utils/service/constant/constants.dart';

class ModaLBottomTemplate extends StatelessWidget {
  final double padding;
  final Widget child;
  final bool isDashed;
  const ModaLBottomTemplate({
    super.key,
    this.padding = 16,
    this.isDashed = false,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(16),
          topRight: Radius.circular(16),
        ),
      ),
      padding: EdgeInsets.all(padding),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          if (isDashed)
            Column(
              children: [
                Center(
                  child: Container(
                    width: 42,
                    height: 4,
                    decoration: BoxDecoration(
                      color: const Color(0xffDDDDDD),
                      borderRadius: BorderRadius.circular(2),
                    ),
                  ),
                ),
                const SizedBox(height: 24),
              ],
            ),
          child,
        ],
      ),
    );
  }
}

class ModaLBottomWidget extends StatelessWidget {
  final double padding;
  final String icon;
  final String title;
  final String subtitle;
  final List<Widget> additionalContent;
  final bool isCloseButton;
  final bool isDashed;
  const ModaLBottomWidget({
    super.key,
    this.padding = 24,
    this.isDashed = false,
    required this.icon,
    required this.title,
    required this.subtitle,
    required this.additionalContent,
    this.isCloseButton = false,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(16),
          topRight: Radius.circular(16),
        ),
      ),
      padding: EdgeInsets.all(padding),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          topContent(context),
          const SizedBox(height: 16),
          TextWidget(
            text: title,
            align: TextAlign.center,
            fontWeight: FontWeight.w600,
            fontSize: Constants.get.sizeLg,
          ),
          const SizedBox(height: 8),
          TextWidget(
            text: subtitle,
            align: TextAlign.center,
            fontSize: Constants.get.sizeMd,
            color: Constants.get.textSecondary,
          ),
          getAction(context),
        ],
      ),
    );
  }

  Widget getAction(BuildContext context) {
    if (additionalContent.isEmpty) {
      return const SizedBox.shrink();
    } else {
      return Container(
        margin: const EdgeInsets.only(top: 24),
        child: Column(
          children: additionalContent.map((e) => e).toList(),
        ),
      );
    }
  }

  Widget topContent(BuildContext context) {
    if (isCloseButton) {
      return Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(width: 32),
          SvgPicture.asset(icon),
          InkWell(
            onTap: () {
              Navigator.pop(context);
            },
            child: Icon(
              Icons.close,
              size: 24,
              color: Constants.get.textSecondary,
            ),
          )
        ],
      );
    }
    return SvgPicture.asset(icon);
  }
}

class ModalBottomTitle extends StatelessWidget {
  final double paddingX;
  final double paddingY;
  final Widget child;
  final String title;
  const ModalBottomTitle({
    super.key,
    this.paddingX = 16,
    this.paddingY = 16,
    required this.title,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(16),
          topRight: Radius.circular(16),
        ),
      ),
      padding: EdgeInsets.symmetric(vertical: paddingY, horizontal: paddingX),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  TextWidget(
                    text: title,
                    fontSize: Constants.get.sizeLg,
                    fontWeight: FontWeight.w600,
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: const Icon(
                      Icons.close,
                      color: Color(0xff71808E),
                      size: 24,
                    ),
                  )
                ],
              ),
              const SizedBox(height: 16),
            ],
          ),
          child,
        ],
      ),
    );
  }
}
