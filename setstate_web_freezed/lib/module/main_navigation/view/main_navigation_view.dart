import 'package:fhe_template/router/route_util.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../model/navigation_item.dart';

class MainNavigationView extends StatefulWidget {
  final Widget child;
  const MainNavigationView({
    super.key,
    required this.child,
  });

  @override
  State<MainNavigationView> createState() => _MainNavigationViewState();
}

class _MainNavigationViewState extends State<MainNavigationView> {
  int selectedIndex = 0;
  double groupAligment = -1.0;

  List routes = [
    "/dashboard",
    "/products",
    "/customers",
    "/orders",
    "/reports",
    "/settings",
    "/profile",
  ];

  List navigationItems = [
    NavigationItem(
      icon: Icons.dashboard,
      label: "Dashboard",
    ),
    NavigationItem(
      icon: Icons.shop,
      label: "Products",
    ),
    NavigationItem(
      icon: Icons.people,
      label: "Customers",
    ),
    NavigationItem(
      icon: Icons.list,
      label: "Orders",
    ),
    NavigationItem(
      icon: Icons.report,
      label: "Reports",
    ),
    NavigationItem(
      icon: Icons.tune,
      label: "Settings",
    ),
    NavigationItem(
      icon: Icons.person,
      label: "Profile",
    ),
  ];

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var currentEndpoint = GoRouter.of(context).location;
    selectedIndex = !routes.contains(currentEndpoint)
        ? selectedIndex
        : routes.indexOf(currentEndpoint);

    return Scaffold(
      body: Row(
        children: <Widget>[
          NavigationRail(
            backgroundColor: Colors.white,
            selectedIndex: selectedIndex,
            groupAlignment: groupAligment,
            onDestinationSelected: (int index) {
              selectedIndex = index;
              setState(() {});
              var routeName = routes[index];
              go(routeName);
            },
            labelType: NavigationRailLabelType.all,
            destinations: List.generate(navigationItems.length, (index) {
              var item = navigationItems[index];
              return NavigationRailDestination(
                icon: Icon(item.icon),
                label: Text(
                  item.label,
                  style: const TextStyle(
                    fontSize: 12.0,
                  ),
                ),
              );
            }),
          ),
          const VerticalDivider(thickness: 1, width: 1),
          Expanded(
            child: widget.child,
          ),
        ],
      ),
    );
  }
}
