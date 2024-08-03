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
    Item('Kiwi', 'A small brown fruit with green flesh'),
    Item('Lemon', 'A yellow citrus fruit'),
    Item('Mango', 'A tropical stone fruit'),
    Item('Nectarine', 'A smooth-skinned peach'),
    Item('Orange', 'A citrus fruit known for its vitamin C'),
    Item('Papaya', 'A tropical fruit with orange flesh'),
    Item('Quince', 'A yellow fruit related to apples and pears'),
    Item('유나', '엄마한테 혼나고있음'),
    Item('우진', '살찌고 있음'),
    Item('아빠', '못생겼다고 놀림당하고있음'),
  ];
  List<Item> _filteredItems = [];
  int _itemsPerPage = 10;
  int _currentPage = 1;

  @override
  void initState() {
    super.initState();
    _filteredItems = _allItems;
  }

  void _filterItems(String query) {
    setState(() {
      _currentPage = 1;
      if (query.isEmpty) {
        _filteredItems = _allItems;
      } else {
        _filteredItems = _allItems.where((item) => item.title.toLowerCase().contains(query.toLowerCase())).toList();
      }
    });
  }

  void _loadMore() {
    setState(() {
      _currentPage++;
    });
  }

  @override
  Widget build(BuildContext context) {
    final int _totalItems = _filteredItems.length;
    final int _itemsToShow = (_currentPage * _itemsPerPage).clamp(0, _totalItems);
    final bool _showMoreButton = _itemsToShow < _totalItems;

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
                itemCount: _showMoreButton ? _itemsToShow + 1 : _itemsToShow,
                itemBuilder: (context, index) {
                  if (index < _itemsToShow) {
                    final item = _filteredItems[index];
                    return Card(
                      margin: const EdgeInsets.symmetric(vertical: 8.0),
                      child: ListTile(
                        title: Text(item.title),
                        subtitle: Text(item.description),
                      ),
                    );
                  } else if (index == _itemsToShow && _showMoreButton) {
                    return ElevatedButton(
                      onPressed: _loadMore,
                      child: const Text('More'),
                    );
                  } else {
                    return null;
                  }
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