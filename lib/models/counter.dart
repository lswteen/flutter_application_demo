import 'package:flutter/material.dart';

class Counter with ChangeNotifier {
  int _counter = 0;
  bool _isLiked = false;
  late AnimationController _controller;
  late Animation<double> _animation;

  int get counter => _counter;
  bool get isLiked => _isLiked;
  Animation<double> get animation => _animation;

  void initController(TickerProvider vsync) {
    _controller = AnimationController(
      duration: const Duration(seconds: 1),
      vsync: vsync,
    );
    _animation = Tween<double>(begin: 0, end: -100).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeOut),
    )..addStatusListener((status) {
        if (status == AnimationStatus.completed) {
          _controller.reset();
        }
      });
  }

  void increment() {
    _counter++;
    notifyListeners();
  }

  void toggleLike() {
    _isLiked = !_isLiked;
    notifyListeners();

    if (_isLiked) {
      _controller.forward();
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}