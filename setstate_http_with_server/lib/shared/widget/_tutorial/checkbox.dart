import 'package:flutter/material.dart';

/*
String "Coding,Hiking,Hacking" XXX
List ["Coding","Hiking","Hacking"]
List [1,2,3,4,5]
List [{
  "label": nnn,
  "value": nnn,
}]
*/
class QCheckBox extends StatefulWidget {
  final List? value;
  final List<Map<String, dynamic>>? items;
  final Function(List value) onChanged;
  final String label;

  const QCheckBox({
    Key? key,
    this.value,
    required this.onChanged,
    required this.label,
    this.items,
  }) : super(key: key);

  @override
  State<QCheckBox> createState() => _QCheckBoxState();
}

class _QCheckBoxState extends State<QCheckBox> {
  List<Map<String, dynamic>> items = [];

  @override
  void initState() {
    super.initState();
    for (var i = 0; i < widget.items!.length; i++) {
      var item = widget.items![i];

      items.add({
        "label": item["label"],
        "value": item["value"],
        "checked": widget.value?.contains(item["value"]),
      });
    }
  }

  setValue() {
    List currentValue = [];
    var checkedValues = items.where((i) => i["checked"] == true).toList();
    for (var item in checkedValues) {
      currentValue.add({
        "label": item["label"],
        "value": item["value"],
      });
    }
    widget.onChanged(currentValue);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            widget.label,
            style: const TextStyle(
              fontSize: 12.0,
            ),
          ),
        ),
        ...List.generate(
          items.length,
          (index) {
            var item = items[index];
            return Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 12,
                vertical: 6.0,
              ),
              child: Row(
                children: [
                  Expanded(
                    child: Text("${item["label"]}"),
                  ),
                  Checkbox(
                    value: item["checked"],
                    onChanged: (value) {
                      item["checked"] = value;
                      setState(() {});
                      setValue();
                    },
                  ),
                ],
              ),
            );
          },
        ),
      ],
    );
  }
}
