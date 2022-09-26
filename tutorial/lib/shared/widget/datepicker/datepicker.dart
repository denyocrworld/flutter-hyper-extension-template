/*
- di atur initialValue
- bisa diambil nilainya dari event onChanged, onSubmitted, onItemSelected
*/
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class QDatePicker extends StatefulWidget {
  final DateTime? value;
  final Function(DateTime value)? onSubmitted;
  final String? label;
  final String? helperText;

  const QDatePicker({
    Key? key,
    required this.value,
    this.onSubmitted,
    this.label,
    this.helperText,
  }) : super(key: key);

  @override
  State<QDatePicker> createState() => _QDatePickerState();
}

class _QDatePickerState extends State<QDatePicker> {
  late TextEditingController controller;

  @override
  void initState() {
    super.initState();
    controller = TextEditingController(
      text: DateFormat("d MMM y").format(widget.value ?? DateTime.now()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () async {
        DateTime? pickedDate = await showDatePicker(
          context: context,
          initialDate: DateTime.now(),
          firstDate: DateTime(2000),
          lastDate: DateTime(2100),
        );
        print("pickedDate: $pickedDate");
        if (pickedDate != null) {
          controller.text = DateFormat("d MMM y").format(pickedDate);
          if (widget.onSubmitted != null) widget.onSubmitted!(pickedDate);
        }
      },
      child: Container(
        padding: const EdgeInsets.all(12),
        margin: const EdgeInsets.only(),
        child: TextFormField(
          controller: controller,
          readOnly: true,
          enabled: false,
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
            suffixIcon: const Icon(Icons.calendar_month),
          ),
        ),
      ),
    );
  }
}
