/*
- di atur initialValue
- bisa diambil nilainya dari event onChanged, onSubmitted, onItemSelected
*/
import 'package:fhe_template/shared/util/input.dart';
import 'package:flutter/material.dart';

class QTextField extends StatefulWidget {
  final String? id;
  final String? value;
  final Function(String value)? onChanged;
  final Function(String value)? onSubmitted;
  final String? label;
  final String? helperText;

  const QTextField({
    Key? key,
    required this.id,
    this.value,
    this.onChanged,
    this.onSubmitted,
    this.label,
    this.helperText,
  }) : super(key: key);

  @override
  State<QTextField> createState() => _QTextFieldState();
}

class _QTextFieldState extends State<QTextField>
    implements InputControllerState {
  String? inputValue;

  @override
  setValue(value) {
    inputValue = value;
    setState(() {});
  }

  @override
  getValue() {
    return inputValue;
  }

  @override
  void initState() {
    super.initState();
    inputValue = widget.value;
    inputControllers[widget.id!] = this;
  }

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
        onChanged: (value) {
          if (widget.onChanged != null) widget.onChanged!(value);
          inputValue = value;
        },
        onFieldSubmitted: (value) {
          if (widget.onSubmitted != null) widget.onSubmitted!(value);
          inputValue = value;
        },
      ),
    );
  }
}
