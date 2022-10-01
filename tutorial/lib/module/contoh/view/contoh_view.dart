import 'package:flutter/material.dart';
import '../controller/contoh_controller.dart';

class ContohView extends StatefulWidget {
  const ContohView({Key? key}) : super(key: key);

  Widget build(context, ContohController controller) {
    controller.view = this;

    var message = "Hello, anjay banget lo";
    message = message.replaceAll("anjay", "*****");

    return Scaffold(
        appBar: AppBar(
          title: const Text("Dashboard"),
          actions: const [],
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(message),
                SizedBox(
                  height: 140.0,
                  child: ListView.builder(
                    itemCount: 10,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) {
                      return Container(
                        width: 140,
                        margin: const EdgeInsets.only(right: 10.0),
                        decoration: BoxDecoration(
                          image: const DecorationImage(
                            image: NetworkImage(
                              "https://images.unsplash.com/photo-1482049016688-2d3e1b311543?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=710&q=80",
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
                            Positioned(
                              bottom: 0,
                              left: 0,
                              right: 0,
                              child: Container(
                                padding: const EdgeInsets.all(12.0),
                                decoration: const BoxDecoration(
                                  color: Colors.black38,
                                  borderRadius: BorderRadius.only(
                                    bottomLeft: Radius.circular(16.0),
                                    bottomRight: Radius.circular(16.0),
                                  ),
                                ),
                                child: const Text(
                                  "Avocado and Eeg Toast",
                                  overflow: TextOverflow.ellipsis,
                                  style: TextStyle(
                                    fontSize: 11.0,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                ),
                const SizedBox(
                  height: 20.0,
                ),
                Card(
                  elevation: 2.4,
                  shape: ContinuousRectangleBorder(
                    borderRadius: BorderRadius.circular(64.0),
                  ),
                  child: ListTile(
                    leading: CircleAvatar(
                      backgroundColor: Colors.grey[200],
                      backgroundImage: const NetworkImage(
                        "https://i.ibb.co/QrTHd59/woman.jpg",
                      ),
                    ),
                    title: const Text("Jessica Doe"),
                    subtitle: const Text("Programmer"),
                  ),
                ),
                const SizedBox(
                  height: 30.0,
                ),
                Container(
                  height: 100.0,
                  decoration: BoxDecoration(
                    color: Colors.grey[100],
                    borderRadius: const BorderRadius.all(
                      Radius.circular(
                        16.0,
                      ),
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.2),
                        spreadRadius: 4,
                        blurRadius: 5,
                        offset: const Offset(0, 7),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 30.0,
                ),
                ElevatedButton.icon(
                  icon: const Icon(Icons.add),
                  label: const Text("Add"),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blueGrey,
                    shape: const StadiumBorder(),
                  ),
                  onPressed: () {},
                ),
                const SizedBox(
                  height: 30.0,
                ),
                const CircleAvatar(
                  backgroundImage: NetworkImage(
                    "https://i.ibb.co/PGv8ZzG/me.jpg",
                  ),
                ),
                const SizedBox(
                  height: 20.0,
                ),
                Container(
                  height: 100.0,
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                      image: NetworkImage(
                        "https://i.ibb.co/3pPYd14/freeban.jpg",
                      ),
                      fit: BoxFit.cover,
                    ),
                    borderRadius: BorderRadius.all(
                      Radius.circular(
                        16.0,
                      ),
                    ),
                  ),
                ),
                ListView.builder(
                  itemCount: controller.items.length,
                  shrinkWrap: true,
                  itemBuilder: (context, index) {
                    var item = controller.items[index];
                    return Column(
                      children: [
                        Card(
                          child: ListTile(
                            title: Text("${item["product_name"]}"),
                            subtitle: Text("${item["price"]}"),
                          ),
                        ),
                      ],
                    );
                  },
                ),
              ],
            ),
          ),
        ));
  }

  @override
  State<ContohView> createState() => ContohController();
}
