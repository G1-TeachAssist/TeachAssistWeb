import 'package:flutter/material.dart';

class DropdownFormField extends StatelessWidget {
  final String? labelText;
  final List<DropdownMenuItem<Object>>? items;
  final void Function(Object?)? onChanged;
  final String? Function(Object?)? validator;

  const DropdownFormField({
    super.key,
    this.labelText,
    this.items,
    this.onChanged,
    this.validator,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: DropdownButtonFormField(
        focusColor: Colors.white,
        decoration: InputDecoration(
          labelText: labelText,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ),
        items: items,
        onChanged: onChanged,
        validator: validator,
      ),
    );
  }
}
