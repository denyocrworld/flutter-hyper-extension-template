/*
- di atur initialValue
- bisa diambil nilainya dari event onChanged, onSubmitted, onItemSelected
*/
import 'package:flutter/material.dart';

class QNumberField extends StatefulWidget {
  final String? value;
  final Function(String value)? onChanged;
  final Function(String value)? onSubmitted;
  final String? label;
  final String? helperText;

  const QNumberField({
    Key? key,
    this.value,
    this.onChanged,
    this.onSubmitted,
    this.label,
    this.helperText,
  }) : super(key: key);

  @override
  State<QNumberField> createState() => _QNumberFieldState();
}

class _QNumberFieldState extends State<QNumberField> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(12),
      margin: const EdgeInsets.only(),
      child: TextFormField(
        initialValue: widget.value,
        maxLength: 20,
        decoration: InputDecoration(
          labelText: widget.label,
          labelStyle: const TextStyle(
            color: Colors.blueGrey,
          ),
          enabledBorder: const UnderlineInputBorder(
            borderSide: BorderSide(
              color: Colors.blueGrey,
            ),
          ),
          helperText: widget.helperText,
        ),
        keyboardType: TextInputType.number,
        onChanged: (value) {
          if (widget.onChanged != null) widget.onChanged!(value);
        },
        onFieldSubmitted: (value) {
          if (widget.onSubmitted != null) widget.onSubmitted!(value);
        },
      ),
    );
  }
}
