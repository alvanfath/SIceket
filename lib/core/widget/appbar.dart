import 'package:heroicons/heroicons.dart';
import 'package:cek_ongkir/core/widget/text.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class AppBarWidget extends StatelessWidget implements PreferredSizeWidget {
  final BuildContext context;
  final bool isLeading;
  final String? title;
  final Function()? leadingAction;
  final List<Widget>? actions;
  final Color? background;
  final PreferredSize? bottom;
  final double? elevation;

  const AppBarWidget({
    super.key,
    required this.context,
    required this.isLeading,
    this.title,
    this.leadingAction,
    this.actions,
    this.background,
    this.bottom,
    this.elevation,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      centerTitle: true,
      automaticallyImplyLeading: false,
      backgroundColor: background ?? Colors.white,
      surfaceTintColor: Colors.white,
      elevation: elevation ?? 0,
      scrolledUnderElevation: 0.0,
      shadowColor: const Color.fromARGB(50, 0, 0, 0),
      title: TextWidget(
        text: title ?? '',
        fontSize: 16,
        fontWeight: FontWeight.w500,
        align: TextAlign.center,
      ),
      leadingWidth: MediaQuery.of(context).size.width / 4,
      leading: isLeading
          ? Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                GestureDetector(
                  behavior: HitTestBehavior.opaque,
                  onTap: leadingAction ??
                      () {
                        context.pop();
                      },
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
                      HeroIcons.arrowLeft,
                      color: Color(0xff333333),
                      size: 16,
                    ),
                  ),
                ),
              ],
            )
          : null,
      actions: actions,
      bottom: bottom ??
          const PreferredSize(
            preferredSize: Size.fromHeight(0),
            child: SizedBox.shrink(),
          ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}

class AppBarTitleCustomWidget extends StatelessWidget
    implements PreferredSizeWidget {
  final BuildContext context;
  final bool isLeading;
  final Widget title;
  final Function()? leadingAction;
  final List<Widget>? actions;
  final Color? background;
  final PreferredSize? bottom;
  final double? elevation;

  const AppBarTitleCustomWidget({
    super.key,
    required this.context,
    required this.isLeading,
    required this.title,
    this.leadingAction,
    this.actions,
    this.background,
    this.bottom,
    this.elevation,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      centerTitle: true,
      automaticallyImplyLeading: false,
      backgroundColor: background ?? Colors.white,
      surfaceTintColor: Colors.white,
      elevation: elevation ?? 5,
      shadowColor: const Color.fromARGB(50, 0, 0, 0),
      scrolledUnderElevation: 0.0,
      title: title,
      leading: isLeading == true
          ? IconButton(
              icon: const Icon(
                Icons.arrow_back,
                color: Color(0xff333333),
              ),
              onPressed: leadingAction ??
                  () {
                    context.pop();
                  },
            )
          : null,
      actions: actions,
      bottom: bottom ??
          const PreferredSize(
            preferredSize: Size.fromHeight(0),
            child: SizedBox.shrink(),
          ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}

class MyAppBar {
  const MyAppBar();

  PreferredSize call() => PreferredSize(
        preferredSize: const Size.fromHeight(kToolbarHeight),
        child: AppBar(elevation: 0),
      );
}
