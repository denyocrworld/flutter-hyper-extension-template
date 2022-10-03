import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import '../controller/welcome_controller.dart';

class WelcomeView extends StatefulWidget {
  const WelcomeView({Key? key}) : super(key: key);

  Widget build(context, WelcomeController controller) {
    controller.view = this;

    return Scaffold(
      body: Stack(
        children: [
          Container(
            height: MediaQuery.of(context).size.height,
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: NetworkImage(
                  "https://images.unsplash.com/photo-1523359346063-d879354c0ea5?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MTh8fHdvbWFuJTIwZmFzaGlvbnxlbnwwfHwwfHw%3D&auto=format&fit=crop&w=500&q=60",
                ),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Container(
            color: Colors.black.withOpacity(0.3),
          ),
          Container(
            width: MediaQuery.of(context).size.width,
            padding: const EdgeInsets.all(20.0),
            child: SafeArea(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                // crossAxisAlignment: CrossAxisAlignment.end,
                // mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  const Text(
                    "Welcome to",
                    style: TextStyle(
                      fontSize: 16.0,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  const Text(
                    "Fucommerce",
                    style: TextStyle(
                      fontSize: 30.0,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.all(30.0),
                    color: Colors.white,
                    child: SizedBox(
                      height: 100,
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Container(
                            height: 100,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(13),
                              boxShadow: const [
                                BoxShadow(
                                  color: Color(0x19000000),
                                  blurRadius: 24,
                                  offset: Offset(0, 11),
                                ),
                              ],
                              color: Colors.white,
                            ),
                            padding: const EdgeInsets.only(
                              left: 10,
                              right: 14,
                            ),
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                SizedBox(
                                  width: 80,
                                  height: 80,
                                  child: Stack(
                                    children: [
                                      Container(
                                        width: 80,
                                        height: 80,
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(10),
                                          color: const Color(0xff666666),
                                        ),
                                      ),
                                      const Positioned.fill(
                                        child: Align(
                                          alignment: Alignment.bottomLeft,
                                          child: SizedBox(
                                            width: 140,
                                            height: 197,
                                            child: FlutterLogo(size: 140),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Card(
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
                                const SizedBox(width: 34),
                                SizedBox(
                                  width: 102,
                                  height: 78,
                                  child: Stack(
                                    children: [
                                      Positioned(
                                        left: 56,
                                        top: 224,
                                        child: Container(
                                          width: 9,
                                          height: 9,
                                          decoration: BoxDecoration(
                                            shape: BoxShape.circle,
                                            border: Border.all(
                                              color: const Color(0xffcccccc),
                                              width: 1,
                                            ),
                                          ),
                                        ),
                                      ),
                                      const Text(
                                        "Roller Rabbit \nVado Odelle Dress\nQuality: 1\nSize: L\nColor: ",
                                      ),
                                    ],
                                  ),
                                ),
                                const SizedBox(width: 34),
                                const Text(
                                  "\$198.00",
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 14,
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
                    height: 30.0,
                  ),
                  Container(
                    color: Colors.white,
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.end,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          "User Name",
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 16,
                          ),
                        ),
                        const Text(
                          "Hasan Mahmud",
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 14,
                          ),
                        ),
                        Container(
                          width: 13,
                          height: 13,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            color: Colors.black,
                          ),
                        ),
                        const SizedBox(
                          width: 325,
                          height: 1,
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 30.0,
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width,
                    height: 48,
                    constraints: const BoxConstraints(
                      maxWidth: 240.0,
                    ),
                    child: ElevatedButton.icon(
                      icon: const Icon(MdiIcons.google),
                      label: const Text("Login by Google"),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.red[900],
                        shape: ContinuousRectangleBorder(
                          borderRadius: BorderRadius.circular(64.0),
                        ),
                      ),
                      onPressed: () => controller.doLogin(),
                    ),
                  ),
                  const SizedBox(
                    height: 20.0,
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width,
                    height: 48,
                    constraints: const BoxConstraints(
                      maxWidth: 240.0,
                    ),
                    child: ElevatedButton.icon(
                      icon: const Icon(MdiIcons.facebook),
                      label: const Text("Login by Facebook"),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.blue[900],
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
        ],
      ),
    );
  }

  @override
  State<WelcomeView> createState() => WelcomeController();
}
