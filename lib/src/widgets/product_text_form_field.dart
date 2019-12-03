import 'package:flutter/material.dart';
import 'package:store_it/src/theme/colors.dart';

class ProductTextFormField extends StatelessWidget {
  final String hintText;
  final String errorText;
  final Function onSaved;
  final String initialValue;
  final TextInputType keyboardType;

  ProductTextFormField({
    @required this.hintText,
    @required this.errorText,
    @required this.onSaved,
    this.initialValue = '',
    this.keyboardType = TextInputType.text,
    Key key,
  }):super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      keyboardType: keyboardType,
      initialValue: initialValue,
      style: Theme.of(context).textTheme.caption.copyWith(
            fontSize: 16.0,
            color: Theme.of(context).textTheme.title.color,
          ),
      decoration: InputDecoration(
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Theme.of(context).primaryColor),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Theme.of(context).accentColor),
        ),
        filled: true,
        fillColor: Theme.of(context).primaryColor,
        hintText: hintText,
        errorStyle: TextStyle(
          fontSize: 15.0,
          height: 0.9,
          color: Theme.of(context).errorColor,
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
