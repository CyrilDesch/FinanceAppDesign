import 'package:flutter/material.dart';
import 'package:testapp/screens/Tab/AccountScreen.dart';
import 'package:testapp/screens/Tab/AddScreen.dart';
import 'package:testapp/screens/Tab/CreditScreen.dart';
import 'package:testapp/screens/Tab/MoneyScreen.dart';
import 'package:testapp/utilities/constants.dart';
import 'package:testapp/widgets/appIcons.dart';

import 'Tab/HomeScreen.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  static const List<Widget> _pages = <Widget>[
    HomeScreen(),
    CreditScreen(),
    AddScreen(),
    MoneyScreen(),
    AccountScreen(),
  ];

  int _selectedIndex = 2;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      body: SafeArea(
        bottom: false,
        child: IndexedStack(
          children: _pages,
          index: _selectedIndex,
        ),
      ),
      backgroundColor: lightBlue,
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [lightBlue, Color(0x00e5edf6)],
            begin: Alignment.bottomCenter,
            end: Alignment.topCenter,
            stops: [0.8, 1],
            tileMode: TileMode.clamp,
          ),
        ),
        child: Theme(
          data: Theme.of(context).copyWith(
            canvasColor: Color(0x00ffffff),
            primaryColor: Color(0x00ffffff),
          ),
          child: BottomNavigationBar(
            unselectedItemColor: gray,
            elevation: 0,
            showSelectedLabels: false,
            selectedItemColor: lightBlue,
            currentIndex: _selectedIndex,
            onTap: (index) => setState(() => _selectedIndex = index),
            items: <BottomNavigationBarItem>[
              BottomNavigationBarItem(
                icon: Icon(
                  AppIcons.home_outline,
                  size: 20,
                ),
                activeIcon: Container(
                    decoration: BoxDecoration(
                      color: blue,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Padding(
                      padding:
                          EdgeInsets.symmetric(horizontal: 16, vertical: 9),
                      child: Icon(
                        AppIcons.home_outline,
                        size: 15,
                      ),
                    )),
                label: 'Home',
              ),
              BottomNavigationBarItem(
                icon: Icon(
                  Icons.credit_card_outlined,
                  size: 25,
                ),
                activeIcon: Container(
                  decoration: BoxDecoration(
                    color: blue,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Padding(
                    padding:
                        EdgeInsets.symmetric(horizontal: 14, vertical: 6.8),
                    child: Icon(
                      Icons.credit_card_outlined,
                      size: 20,
                    ),
                  ),
                ),
                label: 'Credit',
              ),
              BottomNavigationBarItem(
                icon: Icon(
                  Icons.add,
                  size: 25,
                ),
                activeIcon: Container(
                  decoration: BoxDecoration(
                    color: blue,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Padding(
                    padding:
                        EdgeInsets.symmetric(horizontal: 14, vertical: 6.8),
                    child: Icon(
                      Icons.add,
                      size: 20,
                    ),
                  ),
                ),
                label: 'Add',
              ),
              BottomNavigationBarItem(
                icon: Icon(
                  Icons.attach_money_outlined,
                  size: 25,
                ),
                activeIcon: Container(
                  decoration: BoxDecoration(
                    color: blue,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Padding(
                    padding:
                        EdgeInsets.symmetric(horizontal: 14, vertical: 6.8),
                    child: Icon(
                      Icons.attach_money_outlined,
                      size: 20,
                    ),
                  ),
                ),
                label: 'Money',
              ),
              BottomNavigationBarItem(
                icon: Icon(
                  Icons.account_circle_outlined,
                  size: 25,
                ),
                activeIcon: Container(
                  decoration: BoxDecoration(
                    color: blue,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Padding(
                    padding:
                        EdgeInsets.symmetric(horizontal: 14, vertical: 6.8),
                    child: Icon(
                      Icons.account_circle_outlined,
                      size: 20,
                    ),
                  ),
                ),
                label: 'Account',
              ),
            ],
          ),
        ),
      ),
    );
  }
}
