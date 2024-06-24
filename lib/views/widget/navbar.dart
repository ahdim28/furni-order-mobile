import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:furni_order/views/cartPage.dart';
import 'package:furni_order/views/homePage.dart';
import 'package:furni_order/views/profilePage.dart';
import 'package:furni_order/views/transactionPage.dart';
import 'package:water_drop_nav_bar/water_drop_nav_bar.dart';

class Navbar extends StatefulWidget {
  const Navbar({super.key});

  @override
  State<Navbar> createState() => _NavbarState();
}

class _NavbarState extends State<Navbar> {
  final Color navigationBarColor =  Colors.white;
  int selectedIndex = 0;
  late PageController pageController;
  @override
  void initState() {
    super.initState();
    pageController = PageController(initialPage: selectedIndex);
  }

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle(
        systemNavigationBarColor: navigationBarColor,
        systemNavigationBarIconBrightness: Brightness.dark,
      ),
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.blue,
          title: const Text(
            'Furni Order',
            style: TextStyle(
              color: Colors.white
            ),
          ),
        ),
        // backgroundColor: Colors.grey,
        body: PageView(
          physics: const NeverScrollableScrollPhysics(),
          controller: pageController,
          children: const <Widget>[
            HomePage(),
            CartPage(),
            TransactionPage(),
            ProfilePage()
          ],
        ),
        bottomNavigationBar: WaterDropNavBar(
          backgroundColor: navigationBarColor,
          waterDropColor: Colors.blue,
          onItemSelected: (int index) {
            setState(() {
              selectedIndex = index;
            });
            pageController.animateToPage(selectedIndex,
                duration: const Duration(milliseconds: 400),
                curve: Curves.easeOutQuad);
          },
          selectedIndex: selectedIndex,
          barItems: <BarItem>[
            BarItem(
              filledIcon: Icons.home_rounded,
              outlinedIcon: Icons.home_outlined,
            ),
            BarItem(
                filledIcon: Icons.shopping_cart_rounded,
                outlinedIcon: Icons.shopping_cart_outlined),
            BarItem(
              filledIcon: Icons.list_rounded,
              outlinedIcon: Icons.list_outlined,
            ),
            BarItem(
              filledIcon: Icons.person_rounded,
              outlinedIcon: Icons.person_outline,
            ),
          ],
        ),
      ),
    );
  }
}