import 'package:flutter/material.dart';

class TUIColorChanger extends StatefulWidget {
  final Function(Color color) onChanged;
  const TUIColorChanger({
    Key? key,
    required this.onChanged,
  }) : super(key: key);

  @override
  State<TUIColorChanger> createState() => _TUIColorChangerState();
}

class _TUIColorChangerState extends State<TUIColorChanger> {
  List colorList = [
    Colors.blue,
    Colors.red,
    Colors.brown,
    Colors.green,
    Colors.yellow,
  ];

  @override
  Widget build(BuildContext context) {
    return Wrap(
      runSpacing: 6.0,
      spacing: 6.0,
      children: List.generate(
        colorList.length,
        (index) {
          var color = colorList[index];

          return InkWell(
            onTap: () {
              widget.onChanged(color);
              setState(() {});
              // debugPrint("it works");
              // MainNavigationViewState.instance.expanded = false;
              // MainNavigationViewState.instance.update();

              // primaryColor = color;
              // MainNavigationViewState.instance.update();

              // MainNavigationViewState.instance.expanded = true;
              // MainNavigationViewState.instance.update();
            },
            child: Container(
              height: 30.0,
              width: 30.0,
              decoration: BoxDecoration(
                color: color,
                borderRadius: const BorderRadius.all(
                  Radius.circular(
                    4.0,
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
