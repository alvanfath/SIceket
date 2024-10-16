import 'package:flutter/material.dart';

class IndicatorCarousel extends StatelessWidget {
  final List<dynamic> data;
  final int currentIndex;
  const IndicatorCarousel({
    super.key,
    required this.data,
    required this.currentIndex,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: data.asMap().entries.map((entry) {
        int index = entry.key;
        bool isCheck = index == currentIndex;
        return Container(
          width: isCheck ? 16 : 6,
          height: 6,
          margin: const EdgeInsets.only(right: 4),
          decoration: BoxDecoration(
            shape: BoxShape.rectangle,
            borderRadius: BorderRadius.circular(20),
            color: isCheck ? const Color(0xffF7B417) : const Color(0xffD9D9D9),
          ),
        );
      }).toList(),
    );
  }
}
