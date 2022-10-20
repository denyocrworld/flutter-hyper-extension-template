import 'package:example/core.dart';
import 'package:flutter/material.dart';

class DashboardView extends StatefulWidget {
  const DashboardView({Key? key}) : super(key: key);

  Widget build(context, DashboardController controller) {
    controller.view = this;

    return Theme(
      data: ThemeService.mainTheme,
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
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    /*
                    Kekurangan bikin Widget
                    pakai Extension Method
                    1. Agak sulit kalau mau di custom dengan UI yang berubah ubah
                    2. Readability menurun
                    3. Kehilangan fitur untuk lifecycle widget-nya
                        -> initState
                        -> dispose

                    Kelebihannya
                    1. Bisa memotong tab indentation

                    Best Practices
                    1. Pakai utk widget2 sederhana aja
                    2. Jangan pakai utk complex widget, takut-nya
                    Malah susah modif
                    */
                    "Form".h1,
                    "Form".h2,
                    "Form".h3,
                    "Form".h4,
                    "Form".h5,
                    "Form".h6,
                    const ExImagePicker(
                      id: "photo",
                      label: "Photo",
                      // value: "https://i.ibb.co/PGv8ZzG/me.jpg",
                    ),
                    const ExTextField(
                      id: "first_name",
                      label: "First Name",
                      value: null,
                    ),
                    const ExLocationPicker(
                      id: "location",
                      label: "Location",
                      latitude: -6.218481065235333,
                      longitude: 106.80254435779423,
                    ),
                  ],
                ).p20.card,
                const SizedBox(
                  height: 2.0,
                ),
                Row(
                  children: [
                    Expanded(
                      child: ElevatedButton.icon(
                        icon: const Icon(Icons.add),
                        label: const Text("Default"),
                        style: ElevatedButton.styleFrom(),
                        onPressed: () => controller.changeThemeTo(0),
                      ),
                    ),
                    const SizedBox(
                      width: 12.0,
                    ),
                    Expanded(
                      child: ElevatedButton.icon(
                        icon: const Icon(Icons.add),
                        label: const Text("Dark"),
                        style: ElevatedButton.styleFrom(),
                        onPressed: () => controller.changeThemeTo(1),
                      ),
                    ),
                    const SizedBox(
                      width: 12.0,
                    ),
                    Expanded(
                      child: ElevatedButton.icon(
                        icon: const Icon(Icons.add),
                        label: const Text("Orange"),
                        style: ElevatedButton.styleFrom(),
                        onPressed: () => controller.changeThemeTo(2),
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 12.0,
                ),
                //body
                Card(
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      children: [
                        Container(
                          height: 160.0,
                          decoration: const BoxDecoration(
                            image: DecorationImage(
                              image: NetworkImage(
                                "https://i.ibb.co/gTyNNf5/photo-1477959858617-67f85cf4f1df-crop-entropy-cs-tinysrgb-fit-max-fm-jpg-ixid-Mnwy-ODA4-ODh8-MHwxf-H.jpg",
                              ),
                              fit: BoxFit.cover,
                            ),
                            borderRadius: BorderRadius.all(
                              Radius.circular(
                                16.0,
                              ),
                            ),
                          ),
                          child: Stack(
                            children: [
                              Container(
                                decoration: const BoxDecoration(
                                  color: Colors.black26,
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(
                                      16.0,
                                    ),
                                  ),
                                ),
                              ),
                              Positioned(
                                left: 20.0,
                                top: 0.0,
                                bottom: 0.0,
                                child: SizedBox(
                                  width: 100.0,
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        "30%",
                                        style: GoogleFonts.oswald(
                                          fontSize: 30.0,
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      Text(
                                        "Discount Only Valid for Today",
                                        style: GoogleFonts.oswald(
                                          fontSize: 16.0,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.white,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(
                          height: 2.0,
                        ),
                        Padding(
                          padding: const EdgeInsets.all(12.0),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                width: 90,
                                height: 90,
                                margin: const EdgeInsets.only(right: 10.0),
                                decoration: BoxDecoration(
                                  image: const DecorationImage(
                                    image: NetworkImage(
                                      "https://images.unsplash.com/photo-1528735602780-2552fd46c7af?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1173&q=80",
                                    ),
                                    fit: BoxFit.cover,
                                  ),
                                  borderRadius: const BorderRadius.all(
                                    Radius.circular(16.0),
                                  ),
                                  color: Colors.blue[400],
                                ),
                                child: Stack(
                                  children: [
                                    Container(
                                      padding: const EdgeInsets.all(6.0),
                                      margin: const EdgeInsets.all(8.0),
                                      decoration: BoxDecoration(
                                        color: Colors.green[800],
                                        borderRadius: const BorderRadius.all(
                                          Radius.circular(
                                            12.0,
                                          ),
                                        ),
                                      ),
                                      child: const Text(
                                        "PROMO",
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 8.0,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    const Text(
                                      "Roti bakar Cimanggis",
                                      style: TextStyle(
                                        fontSize: 14.0,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    const SizedBox(
                                      height: 6.0,
                                    ),
                                    Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        const Text(
                                          "8.1 km",
                                          style: TextStyle(
                                            fontSize: 10.0,
                                          ),
                                        ),
                                        const SizedBox(
                                          width: 4.0,
                                        ),
                                        const Icon(
                                          Icons.circle,
                                          size: 4.0,
                                        ),
                                        const SizedBox(
                                          width: 4.0,
                                        ),
                                        Icon(
                                          Icons.star,
                                          color: Colors.orange[400],
                                          size: 16.0,
                                        ),
                                        const Text(
                                          "4.8",
                                          style: TextStyle(
                                            fontSize: 10.0,
                                          ),
                                        ),
                                      ],
                                    ),
                                    const SizedBox(
                                      height: 6.0,
                                    ),
                                    const Text(
                                      "Bakery & Cake . Breakfast . Snack",
                                      style: TextStyle(
                                        fontSize: 10.0,
                                      ),
                                    ),
                                    const SizedBox(
                                      height: 6.0,
                                    ),
                                    const Text(
                                      "€24",
                                      style: TextStyle(
                                        fontSize: 14.0,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(
                  height: 2.0,
                ),
                Card(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      children: [
                        Row(
                          children: [
                            ElevatedButton.icon(
                              icon: const Icon(Icons.save),
                              label: const Text("Save"),
                              style: ElevatedButton.styleFrom(),
                              onPressed: () {},
                            ),
                            const SizedBox(
                              width: 6.0,
                            ),
                            OutlinedButton.icon(
                              icon: const Icon(Icons.add),
                              label: const Text("Add"),
                              style: OutlinedButton.styleFrom(),
                              onPressed: () {},
                            ),
                            const SizedBox(
                              width: 6.0,
                            ),
                            ElevatedButton.icon(
                              icon: const Icon(Icons.add),
                              label: const Text("Add"),
                              style: ElevatedButton.styleFrom(
                                shape: const StadiumBorder(),
                              ),
                              onPressed: () {},
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 12.0,
                        ),
                        Row(
                          children: const [
                            CircleAvatar(
                              radius: 12.0,
                              child: Icon(
                                Icons.add,
                                size: 12.0,
                              ),
                            ),
                            SizedBox(
                              width: 4.0,
                            ),
                            CircleAvatar(
                              radius: 16.0,
                              child: Icon(
                                Icons.add,
                                size: 16.0,
                              ),
                            ),
                            SizedBox(
                              width: 4.0,
                            ),
                            CircleAvatar(
                              child: Icon(Icons.add),
                            ),
                            SizedBox(
                              width: 4.0,
                            ),
                            CircleAvatar(
                              radius: 28.0,
                              child: Icon(
                                Icons.add,
                                size: 28.0,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 21.0,
                        ),
                        Row(
                          children: const [
                            CircleAvatar(
                              radius: 12.0,
                              backgroundImage: NetworkImage(
                                "https://i.ibb.co/PGv8ZzG/me.jpg",
                              ),
                            ),
                            SizedBox(
                              width: 4.0,
                            ),
                            CircleAvatar(
                              radius: 16.0,
                              backgroundImage: NetworkImage(
                                "https://i.ibb.co/PGv8ZzG/me.jpg",
                              ),
                            ),
                            SizedBox(
                              width: 4.0,
                            ),
                            CircleAvatar(
                              backgroundImage: NetworkImage(
                                "https://i.ibb.co/PGv8ZzG/me.jpg",
                              ),
                            ),
                            SizedBox(
                              width: 4.0,
                            ),
                            CircleAvatar(
                              radius: 28.0,
                              backgroundImage: NetworkImage(
                                "https://i.ibb.co/PGv8ZzG/me.jpg",
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 12.0,
                        ),
                        const ExTextField(
                          id: "first_name",
                          label: "First Name",
                          value: null,
                        ),
                        const ExTextField(
                          id: "last_name",
                          label: "Last Name",
                          value: null,
                        ),
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
                        const ExSwitch(
                          id: "gender",
                          label: "Gender",
                          value: true,
                        ),
                        const ExImagePicker(
                          id: "photo",
                          label: "Photo",
                          // value: "https://i.ibb.co/PGv8ZzG/me.jpg",
                        ),
                        const ExLocationPicker(
                          id: "location",
                          label: "Location",
                          latitude: -6.218481065235333,
                          longitude: 106.80254435779423,
                        ),
                      ],
                    ),
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
  State<DashboardView> createState() => DashboardController();
}
