import 'package:flutter/material.dart';
import 'package:flutter_adaptive_scaffold/flutter_adaptive_scaffold.dart';
import 'package:flutter_card_swiper/flutter_card_swiper.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _selectedTab = 1;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return AdaptiveScaffold(
      selectedIndex: _selectedTab,
      onSelectedIndexChange: (int index) {
        setState(() {
          _selectedTab = index;
        });
      },
      destinations: const [
        NavigationDestination(icon: Icon(Icons.checklist), label: 'Levels'),
        NavigationDestination(icon: Icon(Icons.newspaper), label: 'Detect'),
        NavigationDestination(icon: Icon(Icons.settings), label: 'Settings')
      ],
      body: (context) {
        switch (_selectedTab) {
          case 0:
            return const Text('asdasdasd');
          case 1:
            return DetectTab();
          case 2:
            return const Text('asdasdasd');
          default:
            return const Text('Something went wrong');
        }
      },
    );
  }
}

class DetectTab extends StatelessWidget {
  List<Container> cards = [
    Container(
      alignment: Alignment.center,
      child: const Text('1'),
      color: Colors.blue,
    ),
    Container(
      alignment: Alignment.center,
      child: const Text('2'),
      color: Colors.red,
    ),
    Container(
      alignment: Alignment.center,
      child: const Text('3'),
      color: Colors.purple,
    )
  ];

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        const Center(
          child: Text('No more articles!'),
        ),
        SafeArea(
          child: CardSwiper(
              isLoop: false,
              cardBuilder:
                  (context, index, percentThresholdX, percentThresholdY) =>
                      cards[index],
              cardsCount: cards.length),
        )
      ],
    );
  }
}
