/*
- di atur initialValue
- bisa diambil nilainya dari event onChanged, onSubmitted, onItemSelected
*/
import 'package:fhe_template/shared/util/input.dart';
import 'package:flutter/material.dart';

class QTimePicker extends StatefulWidget {
  final String? id;
  final TimeOfDay? value;
  final Function(TimeOfDay value)? onChanged;
  final String? label;
  final String? helperText;

  const QTimePicker({
    Key? key,
    required this.id,
    this.value,
    this.onChanged,
    this.label,
    this.helperText,
  }) : super(key: key);

  @override
  State<QTimePicker> createState() => _QTimePickerState();
}

class _QTimePickerState extends State<QTimePicker>
    implements InputControllerState {
  late TextEditingController controller;
  TimeOfDay? inputValue;

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
    inputValue = widget.value;
    inputControllers[widget.id!] = this;
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
        debugPrint("pickedTime: $pickedTime");
        if (pickedTime != null) {
          String value =
              "${pickedTime.hour.twoDigit}:${pickedTime.minute.twoDigit}";
          controller.text = value;
          if (widget.onChanged != null) widget.onChanged!(pickedTime);
          inputValue = pickedTime;
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
