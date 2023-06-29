import 'package:clickbait_conundrum/ui/about_tab.dart';
import 'package:clickbait_conundrum/ui/detect_tab.dart';
import 'package:clickbait_conundrum/ui/level_selection_tab.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedTab = 0;

  @override
  void initState() {
    super.initState();
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedTab = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        bottomNavigationBar: BottomNavigationBar(
            onTap: (value) => _onItemTapped(value),
            currentIndex: _selectedTab,
            items: const [
              BottomNavigationBarItem(
                  icon: Icon(Icons.checklist), label: 'Levels'),
              BottomNavigationBarItem(
                  icon: Icon(Icons.newspaper), label: 'Detect'),
              BottomNavigationBarItem(icon: Icon(Icons.info), label: 'About')
            ]),
        body: Builder(
          builder: (context) {
            switch (_selectedTab) {
              case 0:
                return LevelSelectionTab(
                  onSelectLevel: () => _onItemTapped(1),
                );
              case 1:
                return DetectTab();
              case 2:
                return const AboutTab();
              default:
                return const Text('Something went wrong');
            }
          },
        ));
  }
}
