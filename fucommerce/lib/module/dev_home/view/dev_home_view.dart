import 'package:fhe_template/shared/util/input.dart';
import 'package:fhe_template/shared/widget/datepicker/datepicker.dart';
import 'package:fhe_template/shared/widget/image_picker/image_picker.dart';
import 'package:fhe_template/shared/widget/textfield/numberfield.dart';
import 'package:fhe_template/shared/widget/textfield/textarea.dart';
import 'package:fhe_template/shared/widget/textfield/textfield.dart';
import 'package:fhe_template/shared/widget/timepicker/timepicker.dart';
import 'package:flutter/material.dart';
import '../controller/dev_home_controller.dart';

class DevHomeView extends StatefulWidget {
  const DevHomeView({Key? key}) : super(key: key);

  Widget build(context, DevHomeController controller) {
    controller.view = this;

    return Scaffold(
      appBar: AppBar(
        title: const Text("Dev Home"),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.bug_report,
              size: 24.0,
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              //body
              QImagePicker(
                id: "photo",
                label: "Photo",
                value: null,
                onChanged: (value) {
                  debugPrint("your photo url is $value");
                },
              ),
              QTextField(
                id: "product_name",
                label: "Product Name",
                onChanged: (value) {},
              ),
              QNumberField(
                id: "price",
                label: "Price",
                onChanged: (value) {},
              ),
              QTextArea(
                id: "description",
                label: "Description",
                onChanged: (value) {},
              ),
              QDatePicker(
                id: "birth_date",
                label: "Birth Date",
                onChanged: (value) {},
              ),
              QTimePicker(
                id: "working_hour",
                label: "Working Hours",
                onChanged: (value) {},
              ),
              ElevatedButton.icon(
                icon: const Icon(Icons.add),
                label: const Text("Add"),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blueGrey,
                ),
                onPressed: () {
                  var photo = Input.get("photo");
                  var productName = Input.get("product_name");
                  var price = Input.get("price");
                  var birthDate = Input.get("birth_date");
                  var workingHour = Input.get("working_hour");

                  debugPrint("photo: $photo");
                  debugPrint("productName: $productName");
                  debugPrint("price: $price");
                  debugPrint("birth_date: $birthDate");
                  debugPrint("working_hour: $workingHour");
                },
              ),
              /*
              var photo = Input.get("photo");
              */
            ],
          ),
        ),
      ),
    );
  }

  @override
  State<DevHomeView> createState() => DevHomeController();
}
