import 'package:example/core.dart';
import 'package:flutter/material.dart';

class ThemeEditorUI extends StatelessWidget {
  const ThemeEditorUI({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Theme Editor UI"),
        actions: const [],
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              Wrap(
                spacing: 10,
                runSpacing: 10,
                children: [
                  ElevatedButton.icon(
                    icon: const Icon(Icons.palette),
                    label: const Text("Default"),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blueGrey,
                    ),
                    onPressed: () async {
                      ThemeEditor.change(0);
                    },
                  ),
                  ElevatedButton.icon(
                    icon: const Icon(Icons.palette),
                    label: const Text("Dark"),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blueGrey,
                    ),
                    onPressed: () async {
                      ThemeEditor.change(1);
                    },
                  ),
                  ElevatedButton.icon(
                    icon: const Icon(Icons.palette),
                    label: const Text("Elegant"),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blueGrey,
                    ),
                    onPressed: () async {
                      ThemeEditor.change(2);
                    },
                  ),
                  ElevatedButton.icon(
                    icon: const Icon(Icons.palette),
                    label: const Text("Orange"),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blueGrey,
                    ),
                    onPressed: () async {
                      ThemeEditor.change(3);
                    },
                  ),
                ],
              ),
              const Divider(),
              const TUIFontChanger(),
              const Divider(),
              Card(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      const ExTextField(
                        id: "first_name",
                        label: "First Name",
                        value: null,
                      ),
                      const ExCombo(
                        id: "gender",
                        label: "Gender",
                        items: [
                          {
                            "label": "Male",
                            "value": "Male",
                          },
                          {
                            "label": "Female",
                            "value": "Female",
                          }
                        ],
                        value: "Female",
                      ),
                      const ExLocationPicker(
                        id: "location",
                        label: "Location",
                        latitude: -6.218481065235333,
                        longitude: 106.80254435779423,
                      ),
                      ElevatedButton.icon(
                        icon: const Icon(Icons.add),
                        label: const Text("Add"),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.blueGrey,
                        ),
                        onPressed: () {},
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: "Dashboard",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.list),
            label: "Order",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite),
            label: "Favorite",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: "Profile",
          ),
        ],
      ),
    );
  }
}
