import 'package:flutter/material.dart';

class FormTextField extends StatelessWidget {
  final String? labelText;
  final String? hintText;
  final TextEditingController? textController;
  final bool? obscureText;
  final TextInputType? inputType;
  final String? Function(String?)? inputValidator;
  final Icon? iconInput;
  final double? horizontalPadding;

  const FormTextField(
      {super.key,
      this.labelText,
      this.hintText,
      this.textController,
      this.obscureText,
      this.inputType,
      this.inputValidator,
      this.iconInput,
      this.horizontalPadding});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: horizontalPadding ?? MediaQuery.of(context).size.width * 0.35,
        vertical: 10,
      ),
      child: TextFormField(
        controller: textController,
        keyboardType: inputType,
        decoration: InputDecoration(
          prefixIcon: iconInput,
          labelText: labelText,
          hintText: hintText,
          border: const OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(10)),
          ),
        ),
        obscureText: obscureText ?? false,
        validator: inputValidator,
      ),
    );
  }
}
