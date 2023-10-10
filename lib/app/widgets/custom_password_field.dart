import 'package:flutter/material.dart';

class CustomPasswordField extends StatefulWidget {
  const CustomPasswordField(
      {super.key, required this.controller, this.enableValidate = true});
  final TextEditingController controller;
  final bool enableValidate;

  @override
  State<CustomPasswordField> createState() => _CustomPasswordFieldState();
}

class _CustomPasswordFieldState extends State<CustomPasswordField> {
  bool _initialPasswordVisibilityState = true;

  String? checkPassword(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter a password';
    }
    const passwordPattern = r'^(?=.*[A-Z])(?=.*[a-z])(?=.*\d)[A-Za-z\d]{8,}$';

    if (!RegExp(passwordPattern).hasMatch(value)) {
      return 'Password: 8+ chars, Uppercase, Lowercase, Number';
    }

    return null;
  }

  String? validate(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter a password';
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    return Column(
      children: [
        TextFormField(
          controller: widget.controller,
          validator: widget.enableValidate ? checkPassword : validate,
          obscureText: _initialPasswordVisibilityState,
          decoration: InputDecoration(
            suffixIcon: GestureDetector(
              onTap: () {
                _initialPasswordVisibilityState =
                    !_initialPasswordVisibilityState;
                setState(() {});
              },
              child: Icon(!_initialPasswordVisibilityState
                  ? Icons.visibility_off_outlined
                  : Icons.visibility_outlined),
            ),
            errorMaxLines: 2,
            fillColor: Colors.transparent,
            enabledBorder: OutlineInputBorder(
                borderSide: const BorderSide(width: 0.5),
                borderRadius: BorderRadius.circular(10)),
            focusedBorder: OutlineInputBorder(
                borderSide: const BorderSide(width: 0.5),
                borderRadius: BorderRadius.circular(10)),
            labelText: 'Password',
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
