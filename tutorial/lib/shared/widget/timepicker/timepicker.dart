/*
- di atur initialValue
- bisa diambil nilainya dari event onChanged, onSubmitted, onItemSelected
*/
import 'package:flutter/material.dart';

class QTimePicker extends StatefulWidget {
  final TimeOfDay? value;
  final Function(TimeOfDay value)? onSubmitted;
  final String? label;
  final String? helperText;

  const QTimePicker({
    Key? key,
    required this.value,
    this.onSubmitted,
    this.label,
    this.helperText,
  }) : super(key: key);

  @override
  State<QTimePicker> createState() => _QTimePickerState();
}

class _QTimePickerState extends State<QTimePicker> {
  late TextEditingController controller;

  @override
  void initState() {
    super.initState();
    String value = "";
    if (widget.value != null) {
      value = "${widget.value!.hour.twoDigit}:${widget.value!.minute.twoDigit}";
    } else {
      var now = TimeOfDay.now();
      value = "${now.hour.twoDigit}:${now.minute.twoDigit}";
    }
    controller = TextEditingController(
      text: value,
    );
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () async {
        TimeOfDay? pickedTime = await showTimePicker(
          initialTime: TimeOfDay.now(),
          context: context,
          builder: (context, child) {
            return MediaQuery(
              data:
                  MediaQuery.of(context).copyWith(alwaysUse24HourFormat: true),
              child: child ?? Container(),
            );
          },
        );
        print("pickedTime: $pickedTime");
        if (pickedTime != null) {
          String value =
              "${pickedTime.hour.twoDigit}:${pickedTime.minute.twoDigit}";
          controller.text = value;
          if (widget.onSubmitted != null) widget.onSubmitted!(pickedTime);
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
            suffixIcon: const Icon(Icons.punch_clock_rounded),
          ),
        ),
      ),
    );
  }
}

extension MyTimePickerIntExtension on int {
  get twoDigit {
    var value = this;
    return value.toString().padLeft(2, "0");
  }
}
