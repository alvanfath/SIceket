import 'package:flutter/material.dart';

class Toast extends StatelessWidget {
  final IconData? icon;
  final Color? bgColor;
  final Color? textColor;
  final String? message;

  const Toast({
    super.key,
    this.icon,
    this.bgColor,
    this.message,
    this.textColor,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Container(
          width: MediaQuery.of(context).size.width - 64,
          decoration: BoxDecoration(
            color: bgColor,
            borderRadius: BorderRadius.circular(8),
          ),
          padding: const EdgeInsets.all(16),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                constraints: const BoxConstraints(maxWidth: 250),
                child: Text(
                  message!,
                  style: const TextStyle(
                    fontWeight: FontWeight.w400,
                    fontSize: 12,
                    color: Colors.white,
                  ),
                  textAlign: TextAlign.start,
                  maxLines: 5,
                  softWrap: true,
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 100),
      ],
    );
  }
}
