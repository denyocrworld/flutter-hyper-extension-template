import 'package:example/core.dart';
import 'package:flutter/material.dart';

enum TextFieldType {
  normal,
  password,
}

Map<String, TextEditingController> textFieldController = {};

class ExTextField extends StatefulWidget {
  final String id;
  final String? label;
  final String? value;
  final String? type;
  final String hintText;
  final String symbol;
  final TextFieldType textFieldType;
  final TextInputType? keyboardType;
  final int? maxLines;
  final bool? enabled;

  final int? style;
  final double? size;

  final Function(String text)? onChanged;
  final Function(String text)? onSubmitted;

  const ExTextField({
    Key? key,
    required this.id,
    this.label,
    this.value = "",
    this.hintText = "",
    this.symbol = "",
    this.type = "",
    this.textFieldType = TextFieldType.normal,
    this.keyboardType,
    this.onChanged,
    this.onSubmitted,
    this.maxLines = 1,
    this.enabled = true,
    //-----------
    this.style,
    this.size,
  }) : super(key: key);

  @override
  _ExTextFieldState createState() => _ExTextFieldState();
}

class _ExTextFieldState extends State<ExTextField>
    implements InputControlState {
  TextEditingController controller = TextEditingController();

  @override
  void initState() {
    super.initState();
    controller.text = widget.value ?? "";
    textFieldController[widget.id] = controller;
    Input.set(widget.id, widget.value);
    Input.inputController[widget.id] = this;
  }

  @override
  setValue(value) {
    controller.text = value ?? "";
    Input.set(widget.id, value);
  }

  @override
  resetValue() {
    controller.text = "";
    Input.set(widget.id, "");
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      // height: height,
      padding: const EdgeInsets.all(10.0),
      decoration: const BoxDecoration(
          // color: Colors.white,
          ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          if (widget.label != null) ...[
            Padding(
              padding: const EdgeInsets.only(
                left: 4.0,
                right: 4.0,
                top: 4.0,
                bottom: 4.0,
              ),
              child: Text(
                widget.label!,
              ),
            ),
            const SizedBox(
              height: 4.0,
            ),
          ],
          Container(
            padding: const EdgeInsets.only(
              top: 12.0,
              bottom: 12.0,
              left: 12,
              right: 12.0,
            ),
            decoration: BoxDecoration(
              border: Border.all(
                width: 1.0,
                color: Colors.grey[300]!,
              ),
              borderRadius: const BorderRadius.all(Radius.circular(8.0)),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                if (widget.symbol.isNotEmpty)
                  const Text(
                    "\$",
                    style: TextStyle(
                      fontSize: 12.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                Expanded(
                  child: TextField(
                    controller: controller,
                    maxLines: widget.maxLines ?? 1,
                    keyboardType: widget.keyboardType,
                    obscureText: widget.textFieldType == TextFieldType.password
                        ? true
                        : false,
                    readOnly: widget.enabled! ? false : true,
                    decoration: InputDecoration.collapsed(
                      hintText: widget.hintText,
                      hintStyle: const TextStyle(
                        fontSize: 10.0,
                      ),
                    ),
                    onChanged: (text) {
                      Input.set(widget.id, text);
                      if (widget.onChanged != null) widget.onChanged!(text);
                    },
                    onSubmitted: (text) {
                      Input.set(widget.id, text);
                      if (widget.onSubmitted != null) widget.onSubmitted!(text);
                    },
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
