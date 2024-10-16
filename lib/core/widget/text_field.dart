import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:siceket/utils/service/constant/constants.dart';
import 'package:siceket/utils/service/services.dart';
import 'text.dart';

class TextF extends StatefulWidget {
  const TextF({
    super.key,
    this.curFocusNode,
    this.nextFocusNode,
    this.hint,
    this.validator,
    this.onChanged,
    this.keyboardType,
    this.textInputAction,
    this.obscureText,
    this.suffixIcon,
    this.controller,
    this.onTap,
    this.textAlign,
    this.enable,
    this.inputFormatter,
    this.minLine,
    this.maxLine,
    this.prefixIcon,
    this.isHintVisible = true,
    this.prefixText,
    this.hintText,
    this.autofillHints,
    this.semantic,
    this.onSubmit,
    this.hintColor,
    this.autoValidate,
  });

  final FocusNode? curFocusNode;
  final FocusNode? nextFocusNode;
  final String? hint;
  final Function(String)? validator;
  final Function(String)? onChanged;
  final Function? onTap;
  final TextInputType? keyboardType;
  final TextInputAction? textInputAction;
  final TextEditingController? controller;
  final bool? obscureText;
  final int? minLine;
  final int? maxLine;
  final Widget? suffixIcon;
  final TextAlign? textAlign;
  final bool? enable;
  final List<TextInputFormatter>? inputFormatter;
  final bool isHintVisible;
  final String? prefixText;
  final String? hintText;
  final Iterable<String>? autofillHints;
  final String? semantic;
  final Function1<String?, void>? onSubmit;
  final Color? hintColor;
  final Widget? prefixIcon;
  final AutovalidateMode? autoValidate;

  @override
  _TextFState createState() => _TextFState();
}

class _TextFState extends State<TextF> {
  bool isFocus = false;
  String currentVal = "";

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      // margin: EdgeInsets.symmetric(vertical: Dimens.space8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Visibility(
            visible: widget.isHintVisible,
            child: TextWidget(
              text: widget.hint ?? '',
              fontSize: 14,
              fontWeight: FontWeight.w500,
              color: widget.hintColor ?? const Color(0xff2D3338),
            ),
          ),
          const SizedBox(height: 8),
          Semantics(
            label: widget.semantic,
            child: TextFormField(
              key: widget.key,
              autovalidateMode:
                  widget.autoValidate ?? AutovalidateMode.onUserInteraction,
              autofillHints: widget.autofillHints,
              enabled: widget.enable,
              obscureText: widget.obscureText ?? false,
              focusNode: widget.curFocusNode,
              keyboardType: widget.keyboardType,
              controller: widget.controller,
              textInputAction: widget.textInputAction,
              textAlign: widget.textAlign ?? TextAlign.start,
              minLines: widget.minLine ?? 1,
              maxLines: widget.maxLine ?? 1,
              inputFormatters: widget.inputFormatter,
              textAlignVertical: TextAlignVertical.center,
              style: const TextStyle(
                fontSize: 14,
                color: Color(0xff2D3338),
                fontWeight: FontWeight.w400,
                fontFamily: 'Poppins',
              ),
              cursorColor: const Color(0xff333333),
              decoration: InputDecoration(
                prefix: widget.prefixIcon ??
                    const Padding(
                      padding: EdgeInsets.only(left: 16.0),
                    ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
                prefixText: widget.prefixText,
                alignLabelWithHint: true,
                isDense: true,
                hintText: widget.hintText,
                hintStyle: const TextStyle(
                  fontFamily: 'Poppins',
                  color: Color(0xff9BA6AF),
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                ),
                suffixIcon: widget.suffixIcon,
                contentPadding: const EdgeInsets.symmetric(
                  vertical: 12,
                  // horizontal: Dimens.space16,
                ),
                enabledBorder: OutlineInputBorder(
                  borderSide: const BorderSide(
                    color: Color(0xffDDDDDD),
                    width: 1.0,
                  ),
                  borderRadius: BorderRadius.circular(8),
                ),
                errorBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Constants.get.errorColor,
                    width: 1.0,
                  ),
                  borderRadius: BorderRadius.circular(8),
                ),
                errorStyle: TextStyle(
                  fontFamily: 'Poppins',
                  fontSize: 12,
                  fontWeight: FontWeight.w400,
                  color: Constants.get.errorColor,
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: const BorderSide(
                    color: Color(0xff288C50),
                    width: 1.0,
                  ),
                  borderRadius: BorderRadius.circular(8),
                ),
                fillColor: Colors.grey,
                focusedErrorBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Constants.get.errorColor,
                  ),
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
              validator: widget.validator as String? Function(String?)?,
              onChanged: widget.onChanged,
              onTap: widget.onTap as void Function()?,
              onFieldSubmitted: widget.onSubmit ?? onSubmitDefault,
            ),
          ),
        ],
      ),
    );
  }

  void onSubmitDefault(String? value) {
    setState(() {
      fieldFocusChange(
        context,
        widget.curFocusNode ?? FocusNode(),
        widget.nextFocusNode,
      );
    });
  }

  void fieldFocusChange(
    BuildContext context,
    FocusNode currentFocus,
    FocusNode? nextFocus,
  ) {
    currentFocus.unfocus();
    FocusScope.of(context).requestFocus(nextFocus);
  }
}

class TextFormDisable extends StatelessWidget {
  final String title;
  final String value;
  final bool isTitleVisible;
  final bool isDropdown;
  const TextFormDisable({
    super.key,
    required this.title,
    required this.value,
    this.isDropdown = false,
    this.isTitleVisible = true,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Visibility(
          visible: title != '',
          child: Column(
            children: [
              TextWidget(
                text: title,
                fontSize: 14,
                fontWeight: FontWeight.w500,
                color: const Color(0xff2D3338),
              ),
              const SizedBox(height: 8),
            ],
          ),
        ),
        Container(
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            border: Border.all(color: const Color(0xffDDDDDD)),
            color: const Color(0xffF5F6F7),
          ),
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              TextWidget(
                text: value,
                fontSize: 14,
                fontWeight: FontWeight.w400,
                color: Constants.get.textPrimary,
              ),
              if (isDropdown)
                const Icon(
                  Icons.keyboard_arrow_down_outlined,
                  size: 16,
                  color: Color(0xff999999),
                )
            ],
          ),
        )
      ],
    );
  }
}
