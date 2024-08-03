import 'package:flutter/material.dart';
import '../widgets/custom_app_bar.dart';
import '../widgets/custom_bottom_app_bar.dart';
import '../models/item.dart';


class SearchPage extends StatefulWidget {
  const SearchPage({Key? key}) : super(key: key);

  @override
  _SearchPageState createState() => _SearchPageState();
}


class _SearchPageState extends State<SearchPage> {
  final TextEditingController _searchController = TextEditingController();
  final List<Item> _allItems = [
    Item('Apple', 'A delicious red fruit'),
    Item('Banana', 'A yellow fruit that monkeys love'),
    Item('Cherry', 'A small red fruit'),
    Item('Date', 'A sweet brown fruit'),
    Item('Eggfruit', 'A tropical fruit'),
    Item('Fig', 'A sweet fruit with a unique texture'),
    Item('Grape', 'A small juicy fruit often used to make wine'),
    Item('Honeydew', 'A sweet green melon'),
    Item('유나', '엄마한테 혼나고있음'),
    Item('우진', '살찌고 있음'),
    Item('아빠', '못생겼다고 놀림당하고있음'),
    
  ];
  List<Item> _filteredItems = [];

  @override
  void initState() {
    super.initState();
    _filteredItems = _allItems;
  }

  void _filterItems(String query) {
    setState(() {
      if (query.isEmpty) {
        _filteredItems = _allItems;
      } else {
        _filteredItems = _allItems.where((item) => item.title.toLowerCase().contains(query.toLowerCase())).toList();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(title: 'Search Page'),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _searchController,
              decoration: const InputDecoration(
                labelText: 'Search',
                border: OutlineInputBorder(),
              ),
              onChanged: _filterItems,
            ),
            const SizedBox(height: 16),
            Expanded(
              child: ListView.builder(
                itemCount: _filteredItems.length,
                itemBuilder: (context, index) {
                  return Card(
                    margin: const EdgeInsets.symmetric(vertical: 8.0),
                    child: ListTile(
                      title: Text(_filteredItems[index].title),
                      subtitle: Text(_filteredItems[index].description),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: const CustomBottomAppBar(),
    );
  }
}