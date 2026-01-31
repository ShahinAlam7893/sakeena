import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:sakeena/widgets/custom_bottom_navbar.dart';
import 'package:sakeena/features/guest/guest_menu_drawer.dart';
import 'go_route.dart';

class GuestShell extends StatefulWidget {
  final Widget child;

  const GuestShell({super.key, required this.child});

  @override
  State<GuestShell> createState() => _GuestShellState();
}

class _GuestShellState extends State<GuestShell> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  int _currentIndex = 0;

  void _onTap(int index) {
    if (index == 4) {
      // Menu button - open drawer
      _scaffoldKey.currentState?.openEndDrawer();
      return;
    }

    setState(() => _currentIndex = index);

    switch (index) {
      case 0:
        context.go(AppRoutes.guestHome);
        break;
      case 1:
        context.go(AppRoutes.coursesScreen);
        break;
      case 2:
        context.go(AppRoutes.teachersScreen);
        break;
      case 3:
        context.go(AppRoutes.aboutScreen);
        break;
    }
  }

  String _getCurrentRoute() {
    return GoRouterState.of(context).uri.toString();
  }

  @override
  Widget build(BuildContext context) {
    final location = _getCurrentRoute();

    // Update current index based on current location
    if (location.startsWith(AppRoutes.guestHome)) {
      _currentIndex = 0;
    } else if (location.startsWith(AppRoutes.coursesScreen)) {
      _currentIndex = 1;
    } else if (location.startsWith(AppRoutes.teachersScreen)) {
      _currentIndex = 2;
    } else if (location.startsWith(AppRoutes.aboutScreen)) {
      _currentIndex = 3;
    }

    return Scaffold(
      key: _scaffoldKey,
      body: widget.child,
      endDrawer: GuestMenuDrawer(selectedRoute: location),
      bottomNavigationBar: CustomBottomNavBar(
        items: guestBottomNavItems,
        currentIndex: _currentIndex,
        onTap: _onTap,
      ),
    );
  }
}