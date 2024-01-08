import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:widgets_app/config/menu/menu_items.dart';

class DrawerWidget extends StatefulWidget {

  final GlobalKey<ScaffoldState> scaffoldKey;

  const DrawerWidget({
    super.key,
    required this.scaffoldKey,
  });

  @override
  State<DrawerWidget> createState() => _DrawerWidgetState();
}

class _DrawerWidgetState extends State<DrawerWidget> {
  int drawerIndex = 0;

  @override
  Widget build(BuildContext context) {
    final hasNotch = MediaQuery.of(context).viewPadding.top > 35;

    return NavigationDrawer(
      selectedIndex: drawerIndex,
      onDestinationSelected: (value) {
        setState(() {
          drawerIndex = value;
        });

        final menuItem = appMenuItems[value];
        context.push(menuItem.route);
        widget.scaffoldKey.currentState?.closeDrawer();
      },
      children: [
        Padding(
            padding: EdgeInsets.fromLTRB(25, hasNotch ? 5 : 20, 20, 20),
            child: const Text('Main')
        ),
        ...appMenuItems
            .sublist(0, 3)
            .map((e) => NavigationDrawerDestination(
                  icon: Icon(e.icon),
                  label: Text(e.title),
                ))
            .toList(),
        const Padding(
            padding: EdgeInsets.fromLTRB(25, 20, 20, 20), child: Divider()),
        const Padding(
            padding: EdgeInsets.fromLTRB(25, 10, 20, 20),
            child: Text('Others')),
        ...appMenuItems
            .sublist(3)
            .map((e) => NavigationDrawerDestination(
                  icon: Icon(e.icon),
                  label: Text(e.title),
                ))
            .toList(),
      ],
    );
  }
}
