/*
- di atur initialValue
- bisa diambil nilainya dari event onChanged, onSubmitted, onItemSelected
*/
import 'package:flutter/material.dart';

class QTextArea extends StatefulWidget {
  final String? value;
  final Function(String value)? onChanged;
  final Function(String value)? onSubmitted;
  final String? label;
  final String? helperText;

  const QTextArea({
    Key? key,
    this.value,
    this.onChanged,
    this.onSubmitted,
    this.label,
    this.helperText,
  }) : super(key: key);

  @override
  State<QTextArea> createState() => _QTextAreaState();
}

class _QTextAreaState extends State<QTextArea> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(12),
      margin: const EdgeInsets.only(),
      child: TextFormField(
        initialValue: widget.value,
        maxLength: 200,
        maxLines: 6,
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
