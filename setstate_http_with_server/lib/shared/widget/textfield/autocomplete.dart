import 'package:flutter/material.dart';

class ExAutoComplete extends StatefulWidget {
  final String value;
  final Function(dynamic value) onChanged;
  final String? label;
  final Function(String search) future;
  final String valueField;
  final String displayField;
  final String? photoField;

  const ExAutoComplete({
    Key? key,
    required this.value,
    required this.onChanged,
    required this.future,
    required this.valueField,
    required this.displayField,
    this.photoField,
    this.label,
  }) : super(key: key);

  @override
  State<ExAutoComplete> createState() => ExAutoCompleteState();
}

class ExAutoCompleteState extends State<ExAutoComplete> {
  List<Map> items = <Map>[];
  bool loading = false;

  loadData({
    String search = "",
  }) async {
    loading = true;
    setState(() {});

    var responseItems = await widget.future(search);
    items.clear();

    for (var i = 0; i < responseItems.length; i++) {
      var item = responseItems[i];
      items.add(item);
    }
    // items.addAll((responseItems as List<Map>));

    print("Done! ${items.length}");
    loading = false;
    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    // loadData();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(12),
      margin: const EdgeInsets.only(),
      child: LayoutBuilder(builder: (context, constraints) {
        return Stack(
          children: [
            Autocomplete<Map>(
              fieldViewBuilder: (context, textEditingController, focusNode,
                  onFieldSubmitted) {
                return TextField(
                  controller: textEditingController,
                  focusNode: focusNode,
                  readOnly: loading,
                  onChanged: (text) async {
                    items.clear();
                    setState(() {});
                  },
                  onSubmitted: (text) async {
                    await loadData(search: text);
                    setState(() {});
                    onFieldSubmitted();
                    focusNode.requestFocus();
                  },
                  decoration: InputDecoration(
                    labelText: 'Search',
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
                    helperText: loading
                        ? "Fetching data..."
                        : "Let's start with some characters",
                  ),
                );
              },
              // initialValue: TextEditingValue(
              //   text: items.first[widget.displayField],
              // ),
              onSelected: (Map value) {
                widget.onChanged(value[widget.valueField]);
              },
              optionsBuilder: (TextEditingValue textEditingValue) {
                if (textEditingValue.text == '') {
                  return const Iterable<Map>.empty();
                }
                return items.where((Map option) {
                  return option[widget.displayField]
                      .toString()
                      .toLowerCase()
                      .contains(textEditingValue.text.toLowerCase());
                });
              },
              displayStringForOption: (option) {
                return option[widget.displayField];
              },
              optionsViewBuilder: (context, onSelected, options) => Align(
                alignment: Alignment.topLeft,
                child: Material(
                  color: Colors.transparent,
                  shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.vertical(
                      bottom: Radius.circular(4.0),
                    ),
                  ),
                  child: Container(
                    width: constraints.biggest.width,
                    margin: const EdgeInsets.only(top: 10.0),
                    child: Wrap(
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            color: Colors.grey[100],
                            borderRadius: const BorderRadius.all(
                              Radius.circular(12.0),
                            ),
                            border: Border.all(
                              width: 1.0,
                              color: Colors.grey[300]!,
                            ),
                          ),
                          child: ListView.builder(
                            padding: EdgeInsets.zero,
                            itemCount: options.length,
                            shrinkWrap: true,
                            itemBuilder: (BuildContext context, int index) {
                              bool selected =
                                  AutocompleteHighlightedOption.of(context) ==
                                      index;
                              Map option = options.elementAt(index);

                              return InkWell(
                                onTap: () => onSelected(option),
                                child: Container(
                                  decoration: BoxDecoration(
                                    color: selected
                                        ? Theme.of(context).focusColor
                                        : null,
                                    borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(
                                        index == 0 ? 12 : 0,
                                      ),
                                      topRight: Radius.circular(
                                        index == 0 ? 12 : 0,
                                      ),
                                      bottomLeft: Radius.circular(
                                        index == options.length - 1 ? 12 : 0.0,
                                      ),
                                      bottomRight: Radius.circular(
                                        index == options.length - 1 ? 12 : 0.0,
                                      ),
                                    ),
                                  ),
                                  child: ListTile(
                                    leading: widget.photoField == null
                                        ? null
                                        : CircleAvatar(
                                            backgroundImage: NetworkImage(
                                              option[widget.photoField],
                                            ),
                                          ),
                                    title:
                                        Text("${option[widget.displayField]}"),
                                    subtitle:
                                        Text("${option[widget.displayField]}"),
                                  ),
                                ),
                              );
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        );
      }),
    );
  }
}
