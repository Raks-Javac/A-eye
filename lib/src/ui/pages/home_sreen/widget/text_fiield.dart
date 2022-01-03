import 'package:a_eye/src/core/utils/constants.dart';
import 'package:a_eye/src/core/utils/styles.dart';
import 'package:flutter/material.dart';

class TextFieldWidgetBlack extends StatelessWidget {
  final String? label;
  final Function(String)? onChanged;
  final TextEditingController? fieldController;
  final String? hintText;
  final Widget? prefix;
  final Color? labelColor;
  final Function(String?)? onSaved;
  final VoidCallback? onEditingComplete;
  final TextStyle? hintTextStyle;
  final String? Function(String?)? validator;
  final bool? shouldBeWhite;
  final double? letterspacing;
  final Widget? suffixWidget;
  final bool? obscure;
  final String obscureCharacter;
  final TextInputType? keyboardType;

  // ignore: prefer_const_constructors_in_immutables
  TextFieldWidgetBlack({
    Key? key,
    this.prefix,
    this.obscure,
    this.fieldController,
    this.letterspacing = 1.5,
    this.keyboardType,
    this.obscureCharacter = "●",
    this.onChanged,
    this.suffixWidget,
    this.hintText,
    this.onSaved,
    this.onEditingComplete,
    this.validator,
    this.shouldBeWhite,
    this.labelColor,
    this.hintTextStyle,
    @required this.label,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Theme(
          data: ThemeData(
            inputDecorationTheme: InputDecorationTheme(
              contentPadding:
                  EdgeInsets.only(left: screenAwareSize(10, context)),
              border: ColorsTexStyleStore.kTextFieldBlackStyling,
              focusedBorder: ColorsTexStyleStore.kYellowTextFieldStyling,
              enabledBorder: ColorsTexStyleStore.kTextFieldBlackStyling,
              errorBorder: ColorsTexStyleStore.kRedTextFieldStyling,
              focusedErrorBorder: ColorsTexStyleStore.kRedTextFieldStyling,
            ),
          ),
          child: TextFormField(
            scrollPadding: EdgeInsets.zero,
            obscuringCharacter: obscureCharacter,
            cursorWidth: 0.8,
            cursorColor: ColorsTexStyleStore.kTriviaBlack,
            cursorHeight: screenAwareSize(25, context),
            controller: fieldController,
            style: TextStyle(
              fontSize: screenAwareSize(18, context),
              fontWeight: FontWeight.w500,
              letterSpacing: letterspacing,
              fontFamily: "PR",
            ),
            keyboardType: keyboardType ?? TextInputType.number,
            onChanged: onChanged,
            autocorrect: false,
            validator: validator,
            obscureText: obscure ?? false,
            onEditingComplete: onEditingComplete,
            onSaved: onSaved,
            decoration: InputDecoration(
              fillColor: ColorsTexStyleStore.kTriviaLightGrey,
              filled: true,
              border: OutlineInputBorder(
                gapPadding: 1.0,
                borderRadius: BorderRadius.circular(1),
              ),
              suffixIcon: suffixWidget ?? const Text(""),
              prefixIcon: prefix ?? const Text(""),
              hintText: hintText,
              errorStyle: kTextStyle.copyWith(
                color: ColorsTexStyleStore.kTriviaRed,
                fontWeight: FontWeight.bold,
              ),
              hintStyle: hintTextStyle,
            ),
          ),
        ),
      ],
    );
  }
}
