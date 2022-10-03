/*
- di atur initialValue
- bisa diambil nilainya dari event onChanged, onSubmitted, onItemSelected
*/
import 'package:fhe_template/shared/util/input.dart';
import 'package:flutter/material.dart';

class QAutoComplete extends StatefulWidget {
  final String? id;
  final String? value;
  final Function(String value)? onItemSelected;
  final String? label;
  final String? helperText;
  final List<String> items;

  const QAutoComplete({
    Key? key,
    required this.id,
    required this.items,
    this.value,
    this.onItemSelected,
    this.label,
    this.helperText,
  }) : super(key: key);

  @override
  State<QAutoComplete> createState() => _QAutoCompleteState();
}

class _QAutoCompleteState extends State<QAutoComplete>
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
      child: LayoutBuilder(builder: (context, constraints) {
        return Autocomplete<String>(
          fieldViewBuilder:
              (context, textEditingController, focusNode, onFieldSubmitted) {
            return TextField(
              controller: textEditingController,
              focusNode: focusNode,
              onSubmitted: (text) => onFieldSubmitted(),
              decoration: InputDecoration(
                labelText: widget.label,
                labelStyle: const TextStyle(
                  color: Colors.blueGrey,
                ),
                suffixIcon: const Icon(
                  Icons.search,
                ),
                enabledBorder: const UnderlineInputBorder(
                  borderSide: BorderSide(
                    color: Colors.blueGrey,
                  ),
                ),
                helperText: widget.helperText,
              ),
            );
          },
          initialValue: TextEditingValue(
            text: widget.value ?? "",
          ),
          onSelected: (String value) {
            //selected value
            debugPrint("value: $value");
            if (widget.onItemSelected != null) {
              widget.onItemSelected!(value);
            }
            inputValue = value;
          },
          optionsBuilder: (TextEditingValue textEditingValue) {
            if (textEditingValue.text == '') {
              return const Iterable<String>.empty();
            }
            return widget.items.where((String option) {
              return option.contains(textEditingValue.text.toLowerCase());
            });
          },
        );
      }),
    );
  }
}
