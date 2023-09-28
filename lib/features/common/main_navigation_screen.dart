import 'package:final_project/features/add/add_mood_screen.dart';
import 'package:final_project/features/home/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';

class MainNavigationScreen extends StatefulWidget {
  const MainNavigationScreen({
    super.key,
    required this.tab,
  });

  final String tab;
  static const String routeName = "mainNavigation";

  @override
  State<MainNavigationScreen> createState() => _MainNavigationScreenState();
}

class _MainNavigationScreenState extends State<MainNavigationScreen> {
  final List<String> _tabs = [
    "home",
    "write",
  ];

  late int _selectedIndex = _tabs.indexOf(widget.tab);

  void _selectTab(int index) {
    context.go("/${_tabs[index]}");
    print(index);
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        bottomNavigationBar: Container(
          decoration: const BoxDecoration(
            border: Border(
              top: BorderSide(
                width: 2,
                color: Colors.black,
              ),
            ),
          ),
          child: BottomNavigationBar(
            backgroundColor: Colors.transparent,
            elevation: 0,
            showSelectedLabels: false,
            showUnselectedLabels: false,
            onTap: (value) => _selectTab(value),
            currentIndex: _selectedIndex,
            items: const [
              BottomNavigationBarItem(
                label: "Home",
                icon: FaIcon(
                  FontAwesomeIcons.house,
                ),
              ),
              BottomNavigationBarItem(
                label: "Write",
                icon: FaIcon(
                  FontAwesomeIcons.pencil,
                ),
              ),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            Offstage(
              offstage: _selectedIndex != 0,
              child: const HomeScreen(),
            ),
            Offstage(
              offstage: _selectedIndex != 1,
              child: const AddMoodScreen(),
            )
          ],
        ),
      ),
    );
  }
}
