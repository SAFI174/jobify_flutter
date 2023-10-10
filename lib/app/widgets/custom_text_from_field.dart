import 'package:flutter/material.dart';
import 'package:flutter_multi_formatter/formatters/phone_input_formatter.dart';

class CustomTextFormField extends StatelessWidget {
  const CustomTextFormField(
      {super.key,
      this.maxLength,
      required this.controller,
      required this.label,
      this.obscureText = false,
      this.textAlign});
  final TextAlign? textAlign;
  final TextEditingController controller;
  final bool obscureText;
  final String label;
  final int? maxLength;
  String? validateEmail(String? email) {
    final emailRegex = RegExp(r'^[\w-]+(\.[\w-]+)*@([\w-]+\.)+[a-zA-Z]{2,7}$');
    final isValid = emailRegex.hasMatch(email ?? '');
    return isValid ? null : 'Please enter a valid Email';
  }

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    return Column(
      children: <Widget>[
        TextFormField(
          maxLength: maxLength,
          controller: controller,
          validator: (value) {
            if (label == 'Phone Number') {
              if (isPhoneValid(controller.text)) {
                return null;
              }
              return 'Please enter a valid Phone Numbe, ex: +963 922121245';
            }
            if (label == "Code") {
              if (controller.text.length == 5) {
                return null;
              } else {
                return 'Enter a valid code';
              }
            }
            if (label == "Email") {
              return validateEmail(value);
            }
            if (value == null || value.isEmpty) {
              return 'This field cannot be empty';
            }
            return null;
          },
          keyboardType: label == 'Phone Number' ? TextInputType.phone : null,
          inputFormatters:
              label == 'Phone Number' ? [PhoneInputFormatter()] : null,
          textAlign: textAlign ?? TextAlign.start,
          obscureText: obscureText,
          decoration: InputDecoration(
            errorMaxLines: 2,
            fillColor: Colors.transparent,
            enabledBorder: OutlineInputBorder(
                borderSide: const BorderSide(width: 0.5),
                borderRadius: BorderRadius.circular(10)),
            focusedBorder: OutlineInputBorder(
                borderSide: const BorderSide(width: 0.5),
                borderRadius: BorderRadius.circular(10)),
            labelText: label,
            alignLabelWithHint: false,
            labelStyle:
                theme.textTheme.labelLarge!.copyWith(color: theme.hintColor),
          ),
        ),
        const SizedBox(
          height: 15,
        ),
      ],
    );
  }
}
