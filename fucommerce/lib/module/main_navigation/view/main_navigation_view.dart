import 'package:fhe_template/core.dart';
import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class MainNavigationView extends StatefulWidget {
  const MainNavigationView({Key? key}) : super(key: key);

  @override
  State<MainNavigationView> createState() => _MainNavigationViewState();
}

class _MainNavigationViewState extends State<MainNavigationView> {
  int selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 5,
      initialIndex: selectedIndex,
      child: Scaffold(
        body: IndexedStack(
          index: selectedIndex,
          children: [
            const DashboardView(),
            const CartView(),
            const OrderListView(),
            Container(
              color: Colors.purple[100],
            ),
            const ProfileView(),
          ],
        ),
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: selectedIndex,
          selectedItemColor: Colors.grey[700],
          unselectedItemColor: Colors.grey[500],
          onTap: (index) {
            selectedIndex = index;
            setState(() {});
          },
          items: const [
            BottomNavigationBarItem(
              label: "Home",
              icon: Icon(
                MdiIcons.homeCircle,
              ),
            ),
            BottomNavigationBarItem(
              label: "Cart",
              icon: Icon(
                MdiIcons.shopping,
              ),
            ),
            BottomNavigationBarItem(
              label: "Order",
              icon: Icon(
                MdiIcons.viewList,
              ),
            ),
            BottomNavigationBarItem(
              label: "Favorite",
              icon: Icon(
                MdiIcons.star,
              ),
            ),
            BottomNavigationBarItem(
              label: "Me",
              icon: Icon(
                MdiIcons.account,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
