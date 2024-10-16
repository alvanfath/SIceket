import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:siceket/core/core.dart';
import 'package:siceket/utils/utils.dart';

class ModalPopUp extends StatelessWidget {
  const ModalPopUp({
    required this.icon,
    required this.title,
    required this.message,
    this.bgColor,
    this.actions = const [],
    super.key,
  });

  final String icon;
  final String title;
  final String message;
  final Color? bgColor;
  final List<Widget> actions;

  @override
  Widget build(BuildContext context) {
    return Dialog(
      elevation: 0,
      alignment: Alignment.center,
      backgroundColor: Colors.transparent,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15.0),
      ),
      child: Center(
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: Colors.white,
          ),
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  InkWell(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: const Icon(
                      Icons.close,
                      size: 16,
                      color: Colors.grey,
                    ),
                  ),
                ],
              ),
              SvgPicture.asset(
                icon,
                width: 40,
                height: 40,
              ),
              const SizedBox(height: 16),
              TextWidget(
                text: title,
                align: TextAlign.center,
                fontWeight: FontWeight.w600,
                fontSize: Constants.get.sizeLg,
              ),
              const SizedBox(height: 8),
              TextWidget(
                text: message,
                align: TextAlign.center,
                fontSize: Constants.get.sizeMd,
                color: const Color(0xff71808E),
              ),
              getAction(context)
            ],
          ),
        ),
      ),
    );
  }

  Widget getAction(BuildContext context) {
    if (actions.length < 1) {
      return const SizedBox.shrink();
    } else {
      return Container(
        margin: const EdgeInsets.only(top: 16),
        child: Column(
          children: actions.map((e) => e).toList(),
        ),
      );
    }
  }
}

class ModalPopUpNoClose extends StatelessWidget {
  const ModalPopUpNoClose({
    required this.icon,
    required this.title,
    required this.message,
    this.dialogKey,
    this.bgColor,
    this.actions = const [],
    super.key,
  });

  final String icon;
  final String title;
  final String message;
  final GlobalKey<State>? dialogKey;
  final Color? bgColor;
  final List<Widget> actions;

  @override
  Widget build(BuildContext context) {
    return Dialog(
      elevation: 0,
      key: dialogKey,
      alignment: Alignment.center,
      backgroundColor: Colors.transparent,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15.0),
      ),
      child: Center(
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: Colors.white,
          ),
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(),
                  Container(
                    padding: const EdgeInsets.only(top: 14),
                    child: SvgPicture.asset(icon),
                  ),
                  Container()
                ],
              ),
              const SizedBox(height: 16),
              TextWidget(
                text: title,
                align: TextAlign.center,
                fontWeight: FontWeight.w600,
                fontSize: Constants.get.sizeMd,
              ),
              const SizedBox(height: 8),
              TextWidget(
                text: message,
                align: TextAlign.center,
                fontSize: Constants.get.sizeSm,
                color: const Color(0xff71808E),
              ),
              getAction()
            ],
          ),
        ),
      ),
    );
  }

  Widget getAction() {
    if (actions.isEmpty) {
      return const SizedBox.shrink();
    } else {
      return Container(
        margin: const EdgeInsets.only(top: 16),
        child: Column(
          children: actions.map((e) => e).toList(),
        ),
      );
    }
  }
}
