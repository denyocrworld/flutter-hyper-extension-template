import 'package:fhe_template/shared/theme/denyo_theme.dart';
import 'package:fhe_template/shared/widget/textfield/textarea.dart';
import 'package:fhe_template/shared/widget/textfield/textfield.dart';
import 'package:flutter/material.dart';
import '../controller/demo_controller.dart';

class DemoView extends StatefulWidget {
  const DemoView({Key? key}) : super(key: key);

  Widget build(context, DemoController controller) {
    controller.view = this;

    return Theme(
      data: getUiKitTheme(),
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Dashboard"),
          actions: const [],
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              children: [
                const CircleAvatar(
                  radius: 60.0,
                  backgroundImage: NetworkImage(
                    "https://i.ibb.co/PGv8ZzG/me.jpg",
                  ),
                ),
                const QTextField(
                  label: "First name",
                  helperText: "Your first name",
                ),
                const QTextField(
                  label: "Age",
                  helperText: "Your age",
                ),
                const QTextArea(
                  label: "Bio",
                  helperText: "Your bio ...",
                ),
                Container(
                  width: MediaQuery.of(context).size.width / 3,
                  height: 42.0,
                  padding: const EdgeInsets.all(10.0),
                  child: ElevatedButton.icon(
                    icon: const Icon(Icons.add),
                    label: const Text("Add"),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blueGrey,
                      shape: ContinuousRectangleBorder(
                        borderRadius: BorderRadius.circular(64.0),
                      ),
                    ),
                    onPressed: () {},
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  @override
  State<DemoView> createState() => DemoController();
}
