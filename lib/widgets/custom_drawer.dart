import 'package:flutter/material.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({Key? key}) : super(key: key);

  final List<Map<String, dynamic>> menuItems = const [
    {'icon': Icons.home, 'title': 'Home', 'route': '/home'},
    {'icon': Icons.person, 'title': 'Person', 'route': '/person'},
    {'icon': Icons.search, 'title': 'Search', 'route': '/search'},
    {'icon': Icons.book, 'title': 'Recipe', 'route': '/recipe'},
    {'icon': Icons.star, 'title': 'Recommendation', 'route': '/recommendation'},
    {'icon': Icons.casino, 'title': 'Roulette', 'route': '/roulette'}, // 추가된 항목
    {'icon': Icons.settings, 'title': 'Settings', 'route': null},
  ];

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          const DrawerHeader(
            decoration: BoxDecoration(
              color: Colors.teal,
            ),
            child: Text(
              'Menu',
              style: TextStyle(
                color: Colors.white,
                fontSize: 24,
              ),
            ),
          ),
          ...menuItems.map((item) {
            return ListTile(
              leading: Icon(item['icon']),
              title: Text(item['title']),
              onTap: () {
                Navigator.pop(context);
                if (item['route'] != null) {
                  WidgetsBinding.instance.addPostFrameCallback((_) {
                    Navigator.pushNamed(context, item['route']);
                  });
                }
              },
            );
          }).toList(),
        ],
      ),
    );
  }
}