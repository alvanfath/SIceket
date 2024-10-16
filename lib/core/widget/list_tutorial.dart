import 'package:flutter/material.dart';
import 'package:siceket/core/core.dart';
import 'package:siceket/utils/service/constant/constants.dart';

class ListTutorial extends StatelessWidget {
  final List<String> listData;
  const ListTutorial({super.key, required this.listData});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: listData.map((e) {
        return Container(
          margin: const EdgeInsets.only(bottom: 8),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Column(
                children: [
                  SizedBox(height: 5),
                  Icon(
                    Icons.circle,
                    color: Color(0xff71808E),
                    size: 4,
                  ),
                ],
              ),
              const SizedBox(width: 8),
              Flexible(
                child: TextWidget(
                  text: e,
                  fontSize: Constants.get.sizeXs,
                  color: const Color(0xff71808E),
                ),
              )
            ],
          ),
        );
      }).toList(),
    );
  }
}
