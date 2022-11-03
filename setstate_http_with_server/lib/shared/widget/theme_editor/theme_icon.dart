import 'package:example/shared/widget/theme_editor/theme_editor_ui.dart';
import 'package:flutter/material.dart';

class ThemeIcon extends StatelessWidget {
  const ThemeIcon({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const ThemeEditorUI()),
        );
      },
      icon: const Icon(
        Icons.palette,
        size: 24.0,
      ),
    );
  }
}
