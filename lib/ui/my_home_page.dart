import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/counter.dart';
import '../widgets/custom_drawer.dart';
import '../widgets/custom_app_bar.dart';
import '../widgets/custom_bottom_app_bar.dart';

class MyHomePage extends StatefulWidget {
  final String title;

  const MyHomePage({Key? key, required this.title}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> with SingleTickerProviderStateMixin {
  @override
  void initState() {
    super.initState();
    final counter = Provider.of<Counter>(context, listen: false);
    counter.initController(this);
  }

  @override
  void dispose() {
    final counter = Provider.of<Counter>(context, listen: false);
    counter.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: widget.title),
      drawer: const CustomDrawer(),
      body: Stack(
        children: [
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                const Text('You have pushed the button this many times:'),
                Consumer<Counter>(
                  builder: (context, counter, child) {
                    return Text(
                      '${counter.counter}',
                      style: Theme.of(context).textTheme.headlineMedium,
                    );
                  },
                ),
              ],
            ),
          ),
          Positioned(
            right: 32,
            bottom: 100,
            child: Consumer<Counter>(
              builder: (context, counter, child) {
                double iconSize = 25;
                return AnimatedBuilder(
                  animation: counter.animation,
                  builder: (context, child) {
                    return Transform.translate(
                      offset: Offset(0, counter.isLiked ? counter.animation.value : 0),
                      child: Icon(
                        Icons.favorite,
                        color: counter.isLiked ? Colors.red : Colors.grey,
                        size: iconSize,
                      ),
                    );
                  },
                );
              },
            ),
          ),
        ],
      ),
      floatingActionButton: Stack(
        alignment: Alignment.bottomRight,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(bottom: 70.0),
            child: FloatingActionButton(
              onPressed: () {
                context.read<Counter>().toggleLike();
              },
              tooltip: 'Like',
              child: Consumer<Counter>(
                builder: (context, counter, child) {
                  return Icon(
                    counter.isLiked ? Icons.favorite : Icons.favorite_border,
                    color: counter.isLiked ? Colors.red : Colors.grey,
                    size: 25,
                  );
                },
              ),
            ),
          ),
          FloatingActionButton(
            onPressed: () {
              context.read<Counter>().increment();
            },
            tooltip: 'Increment',
            child: const Icon(Icons.add),
          ),
        ],
      ),
    bottomNavigationBar: const CustomBottomAppBar(),
    );
  }
}