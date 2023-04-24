import 'package:flutter/material.dart';
import 'package:serpismotor2/pages/home/home_page.dart';
import 'package:serpismotor2/pages/home/service_page.dart';
import 'package:serpismotor2/pages/home/profile_page.dart';
import 'package:serpismotor2/theme.dart';
import 'package:google_fonts/google_fonts.dart';

class NavbarMain extends StatefulWidget {
  @override
  State<NavbarMain> createState() => _NavbarMainState();
}

class _NavbarMainState extends State<NavbarMain> {
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    Widget cartButton() {
      return FloatingActionButton(
        backgroundColor: primaryColor,
        onPressed: () {
          Navigator.pushNamed(context, '/cart');
        },
        child: Image.asset(
          'assets/icon_trolley.png',
          width: 20,
        ),
      );
    }

    Widget customBottomNav() {
      return BottomAppBar(
        shape: CircularNotchedRectangle(),
        notchMargin: 12,
        clipBehavior: Clip.antiAlias,
        child: Theme(
          data: ThemeData(
              splashColor: Colors.transparent,
              highlightColor: Colors.transparent),
          child: BottomNavigationBar(
              backgroundColor: Colors.white,
              currentIndex: currentIndex,
              onTap: (value) {
                print(value);
                setState(() {
                  currentIndex = value;
                });
              },
              type: BottomNavigationBarType.fixed,
              items: [
                BottomNavigationBarItem(
                    icon: Container(
                      margin: EdgeInsets.only(
                        top: 20,
                      ),
                      child: Column(
                        children: [
                          Image.asset(
                            currentIndex == 0
                                ? 'assets/icon_home_on.png'
                                : 'assets/icon_home_off.png',
                            width: 26,
                            // color: currentIndex == 0 ? primaryColor : iconColor,
                          ),
                          SizedBox(
                            height: 2,
                          ),
                          Text("Home",
                              style: GoogleFonts.poppins(
                                  color: currentIndex == 0
                                      ? primaryColor
                                      : blackColor,
                                  fontWeight: semibold,
                                  fontSize: 10))
                        ],
                      ),
                    ),
                    label: ''),
                BottomNavigationBarItem(
                    icon: Container(
                      margin: EdgeInsets.only(
                        top: 20,
                      ),
                      child: Column(
                        children: [
                          Image.asset(
                            currentIndex == 1
                                ? 'assets/icon_service_on.png'
                                : 'assets/icon_service_off.png',
                            width: 23,
                            // color: currentIndex == 0 ? primaryColor : iconColor,
                          ),
                          SizedBox(
                            height: 2,
                          ),
                          Text("Services",
                              style: GoogleFonts.poppins(
                                  color: currentIndex == 1
                                      ? primaryColor
                                      : blackColor,
                                  fontWeight: semibold,
                                  fontSize: 10))
                        ],
                      ),
                    ),
                    label: ''),
                BottomNavigationBarItem(
                    icon: Container(
                      margin: EdgeInsets.only(
                        top: 20,
                      ),
                      child: Column(
                        children: [
                          Image.asset(
                            currentIndex == 2
                                ? 'assets/icon_profile_on.png'
                                : 'assets/icon_profile_off.png',
                            width: 26,
                            // color: currentIndex == 0 ? primaryColor : iconColor,
                          ),
                          SizedBox(
                            height: 2,
                          ),
                          Text("Profile",
                              style: GoogleFonts.poppins(
                                  color: currentIndex == 2
                                      ? primaryColor
                                      : blackColor,
                                  fontWeight: semibold,
                                  fontSize: 10))
                        ],
                      ),
                    ),
                    label: ''),
                BottomNavigationBarItem(
                  icon: Container(
                    margin: EdgeInsets.only(top: 20, bottom: 10),
                    child: Image.asset(
                      'assets/icon_cart.png',
                      width: 20,
                      color: transparentColor,
                    ),
                  ),
                  label: '',
                ),
              ]),
        ),
      );
    }

    int previousIndex = 0;

    Widget body() {
      switch (currentIndex) {
        case 0:
          previousIndex = 0;
          return HomePage();
          break;
        case 1:
          previousIndex = 1;
          return ServicePage();
          break;
        case 2:
          previousIndex = 2;
          return ProfilePage();
          break;

        default:
          currentIndex = previousIndex;
          return body();
      }
    }

    void changeIndex(int newIndex) {
      if (newIndex >= 0 && newIndex <= 2) {
        previousIndex = currentIndex;
        currentIndex = newIndex;
      } else {
        currentIndex = previousIndex;
      }
    }

    return Scaffold(
      backgroundColor: backgroundColor1,
      floatingActionButton: cartButton(),
      floatingActionButtonLocation: FloatingActionButtonLocation.endDocked,
      bottomNavigationBar: customBottomNav(),
      body: body(),
    );
  }
}
