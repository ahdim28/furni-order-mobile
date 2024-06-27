import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:water_drop_nav_bar/water_drop_nav_bar.dart';

import '../cart_page.dart';
import '../home_page.dart';
import '../profile_page.dart';
import '../transaction_page.dart';

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
          automaticallyImplyLeading: false,
          backgroundColor: Colors.blue,
          title: const Text(
            'Furni Order',
            style: TextStyle(
              fontWeight: FontWeight.w800,
              color: Colors.white,
            ),
          ),
          actions: [
            IconButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const ProfilePage()),
                );
              }, 
              icon: const Icon(Icons.person_2_outlined, color: Colors.white)
            )
          ],
        ),
        body: PageView(
          physics: const NeverScrollableScrollPhysics(),
          controller: pageController,
          children: <Widget>[
            const HomePage(),
            CartPage(
              onTransaction: () {
                setState(() {
                  selectedIndex = 2;
                });
                pageController.animateToPage(selectedIndex,
                  duration: const Duration(milliseconds: 400),
                  curve: Curves.easeOutQuad);
                },
              ),
            const TransactionPage()
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
              filledIcon: Icons.paid_rounded,
              outlinedIcon: Icons.paid_outlined,
            )
          ],
        ),
      ),
    );
  }
}