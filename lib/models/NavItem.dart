import 'package:flutter/material.dart';
import 'package:the_dwarf_chef/screens/home/home_screen.dart';
import 'package:the_dwarf_chef/screens/profile/prrofile_screen.dart';

class NavItem {
  final int id;
  final String icon;
  final Widget? destination;

  NavItem({required this.id, required this.icon, this.destination});

// If there is no destination then it help us
  bool destinationChecker() {
    if (destination != null) {
      return true;
    }
    return false;
  }
}

// If we made any changes here Provider package rebuid those widget those use this NavItems
class NavItems extends ChangeNotifier {
  // By default first one is selected
  int selectedIndex = 0;

  void chnageNavIndex({required int index}) {
    selectedIndex = index;
    // if any changes made it notify widgets that use the value
    notifyListeners();
  }

  List<NavItem> items = [
    NavItem(
      id: 1,
      icon: "assets/icons/home.svg",
      destination: HomeScreen(),
    ),
    NavItem(
      id: 2,
      icon: "assets/icons/list.svg",
      destination: null,
    ),
    NavItem(
      id: 3,
      icon: "assets/icons/camera.svg",
      destination: null,
    ),
    NavItem(
      id: 4,
      icon: "assets/icons/chef_nav.svg",
      destination: null,
    ),
    NavItem(
      id: 5,
      icon: "assets/icons/user.svg",
      destination: ProfileScreen(),
    ),
  ];
}
