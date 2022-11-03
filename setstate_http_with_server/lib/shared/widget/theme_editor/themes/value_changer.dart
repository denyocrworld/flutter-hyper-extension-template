import 'package:flutter/material.dart';

class TUIValueChanger extends StatefulWidget {
  final double min;
  final double max;
  final Function(double value) onChanged;
  const TUIValueChanger({
    Key? key,
    required this.min,
    required this.max,
    required this.onChanged,
  }) : super(key: key);

  @override
  State<TUIValueChanger> createState() => _TUIValueChangerState();
}

class _TUIValueChangerState extends State<TUIValueChanger> {
  double value = 0.1;

  @override
  Widget build(BuildContext context) {
    return Slider(
      value: value,
      onChanged: (newValue) {
        value = newValue;
        widget.onChanged(value);
        setState(() {});
      },
    );
  }
}
