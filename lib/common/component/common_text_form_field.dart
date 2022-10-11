import 'package:flutter/material.dart';
import 'package:flutteractual/common/const/colors.dart';

class CommonTextFormField extends StatelessWidget {
  final String? hintText;
  final String? errorText;
  final bool obscureText;
  final bool autoFocused;
  final ValueChanged<String>? onChanged;

  const CommonTextFormField({
    required this.onChanged,
    this.obscureText = false,
    this.autoFocused = false,
    this.hintText,
    this.errorText,
    Key? key
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final baseBorder = OutlineInputBorder(
      borderSide: BorderSide(
        color: INPUT_BORDER_COLOR,
        width: 1.0
      )
    );

    return TextFormField(
      cursorColor: PRIMARY_COLOR,
      obscureText: obscureText,
      autofocus: autoFocused,
      onChanged: onChanged,
      decoration: InputDecoration(
        contentPadding: EdgeInsets.all(10),
        hintText: hintText,
        errorText: errorText,
        hintStyle: TextStyle(
          color: BODY_TEXT_COLOR,
          fontSize: 14.0
        ),
        fillColor: INPUT_BG_COLOR,
        filled: true,  // Boolean 값에 따라 색 채우기
        border: baseBorder,
        enabledBorder: baseBorder,
        focusedBorder: baseBorder.copyWith(
          borderSide: baseBorder.borderSide.copyWith(
            color: PRIMARY_COLOR
          )
        )
      ),
    );   // EditText?
  }
}
