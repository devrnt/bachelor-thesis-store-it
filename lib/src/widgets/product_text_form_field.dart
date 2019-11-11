import 'package:flutter/material.dart';
import 'package:store_it/src/theme/colors.dart';

class ProductTextFormField extends StatelessWidget {
  final String hintText;
  final String errorText;
  final Function onSaved;
  final String initialValue;

  ProductTextFormField({
    @required this.hintText,
    @required this.errorText,
    @required this.onSaved,
    this.initialValue,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      initialValue: initialValue,
      style: Theme.of(context).textTheme.caption.copyWith(
            fontSize: 16.0,
            color: Theme.of(context).textTheme.title.color,
          ),
      decoration: InputDecoration(
        border: OutlineInputBorder(),
        filled: true,
        fillColor: Colors.white,
        hintText: hintText,
        errorStyle: TextStyle(
          fontSize: 15.0,
          height: 0.9,
        ),
        hintStyle: TextStyle(color: kPrimaryLight),
      ),
      validator: (value) {
        if (value.isEmpty || value.trim().isEmpty) {
          return errorText;
        }
        return null;
      },
      onSaved: onSaved,
    );
  }
}
