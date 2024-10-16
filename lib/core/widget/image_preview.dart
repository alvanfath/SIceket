import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:heroicons/heroicons.dart';
import 'package:cek_ongkir/core/core.dart';
import 'package:cek_ongkir/utils/service/constant/constants.dart';

class ImagePreview extends StatefulWidget {
  final String? linkImage;
  final VoidCallback onTap;
  final VoidCallback onRetake;
  final String placeHolder;
  final String label;
  const ImagePreview({
    super.key,
    this.linkImage,
    required this.onTap,
    required this.onRetake,
    required this.placeHolder,
    required this.label,
  });

  @override
  State<ImagePreview> createState() => _ImagePreviewState();
}

class _ImagePreviewState extends State<ImagePreview> {
  @override
  Widget build(BuildContext context) {
    if (widget.linkImage != null) {
      return Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              TextWidget(
                text: widget.label,
                fontWeight: FontWeight.w500,
                fontSize: Constants.get.sizeMd,
              ),
              GestureDetector(
                behavior: HitTestBehavior.opaque,
                onTap: widget.onRetake,
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: const Color(0xffEAF3EC),
                  ),
                  padding: const EdgeInsets.symmetric(
                    vertical: 4,
                    horizontal: 8,
                  ),
                  child: Row(
                    children: [
                      HeroIcon(
                        HeroIcons.arrowPath,
                        color: Constants.get.primaryColor,
                        size: 16,
                        style: HeroIconStyle.solid,
                      ),
                      const SizedBox(width: 4),
                      TextWidget(
                        text: 'Ulangi',
                        color: Constants.get.primaryColor,
                        fontSize: Constants.get.sizeMd,
                        fontWeight: FontWeight.w500,
                      )
                    ],
                  ),
                ),
              )
            ],
          ),
          const SizedBox(height: 8),
          SizedBox(
            width: MediaQuery.of(context).size.width,
            height: 160,
            child: AspectRatio(
              aspectRatio: 16 / 9,
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  image: DecorationImage(
                    fit: BoxFit.fitWidth,
                    alignment: FractionalOffset.center,
                    image: NetworkImage(widget.linkImage!),
                  ),
                ),
              ),
            ),
          ),
        ],
      );
    }
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TextWidget(
          text: widget.label,
          fontWeight: FontWeight.w500,
          fontSize: Constants.get.sizeMd,
        ),
        const SizedBox(height: 8),
        GestureDetector(
          onTap: widget.onTap,
          behavior: HitTestBehavior.opaque,
          child: DottedBorder(
            color: Colors.green,
            strokeWidth: 2,
            borderType: BorderType.RRect,
            radius: const Radius.circular(8),
            dashPattern: const [15, 9],
            child: Container(
              alignment: Alignment.center,
              width: MediaQuery.of(context).size.width,
              height: 160,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                color: const Color(0xffEAF3EC),
              ),
              padding: const EdgeInsets.all(16.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  SvgPicture.asset(
                    'Images.get.icCamera',
                  ),
                  const SizedBox(height: 8),
                  TextWidget(
                    text: widget.placeHolder,
                    fontSize: Constants.get.sizeSm,
                    color: Constants.get.primaryColor,
                    fontWeight: FontWeight.w500,
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
