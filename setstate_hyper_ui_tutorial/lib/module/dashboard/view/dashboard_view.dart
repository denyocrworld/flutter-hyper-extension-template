import 'package:example/core.dart';
import 'package:example/shared/widget/demo/q_textfield.dart';
import 'package:flutter/material.dart';

class DashboardView extends StatefulWidget {
  DashboardView({Key? key}) : super(key: key);

  final TextEditingController firstNameTextEditingController =
      TextEditingController(
    text: "Deny",
  );
  final TextEditingController lastNameTextEditingController =
      TextEditingController(
    text: "Ocr",
  );

  Widget build(context, DashboardController controller) {
    controller.view = this;

    //Reuseable Widget
    /*
    - Reuseable Widget di level Module
    - Reuseable Widget di leve Global
    */
    return Scaffold(
      appBar: AppBar(
        title: const Text("Dashboard"),
        actions: const [],
      ),
      body: SingleChildScrollView(
        controller: ScrollController(),
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              ExAutoComplete(
                value: "",
                future: (search) async {
                  var response = await Dio().get(
                    "https://dummyjson.com/products/search?q=search",
                    options: Options(
                      headers: {
                        "Content-Type": "application/json",
                      },
                    ),
                  );
                  Map obj = response.data;
                  return obj["products"]; //List
                },
                valueField: "id",
                displayField: "title",
                photoField: "thumbnail",
                onChanged: (value) {
                  print("Your value is $value");
                },
              ),
              const ExImagePicker(
                id: "photo",
                label: "Photo",
                // value: "https://i.ibb.co/PGv8ZzG/me.jpg",
              ),
              const ExRating(
                id: "rating",
                label: "Rating",
                value: null,
              ),
              const ExSwitch(
                id: "gender",
                label: "Gender",
                value: true,
              ),
              const ExRadio(
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
              const ExCheckBox(
                id: "my_hobby",
                label: "My Hobby",
                items: [
                  {
                    "label": "Coding",
                    "value": "Coding",
                  },
                  {
                    "label": "Afk",
                    "value": "Afk",
                  },
                  {
                    "label": "E-Sport",
                    "value": "E-Sport",
                  }
                ],
                value: [
                  "Coding",
                ],
              ),
              const ExTextArea(
                id: "memo",
                label: "Memo",
                value: null,
              ),
              QTextField(
                value: "xxx@gmail.com",
                label: "email1",
                onChanged: (value) {},
              ),
              QTextField(
                value: "yyyy@gmail.com",
                label: "email2",
                onChanged: (value) {},
              ),
              QTextField(
                value: "zzz@gmail.com",
                label: "email3",
                onChanged: (value) {},
              ),
              ElevatedButton.icon(
                icon: const Icon(Icons.save),
                label: const Text("Save"),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blueGrey,
                ),
                onPressed: () {},
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  State<DashboardView> createState() => DashboardController();
}
