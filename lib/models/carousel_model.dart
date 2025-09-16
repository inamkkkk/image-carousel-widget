import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'dart:async';

class CarouselModel extends ChangeNotifier {
  int _currentIndex = 0;
  Timer? _timer;
  final CarouselController carouselController = CarouselController();

  int get currentIndex => _currentIndex;

  void setCurrentIndex(int index) {
    _currentIndex = index;
    notifyListeners();
  }

  void startAutoPlay(Duration interval, int itemCount) {
    stopAutoPlay();
    _timer = Timer.periodic(interval, (timer) {
      if (_currentIndex < itemCount - 1) {
        _currentIndex++;
      } else {
        _currentIndex = 0;
      }
      carouselController.animateToPage(
        _currentIndex,
        duration: const Duration(milliseconds: 300),
        curve: Curves.linear,
      );
      notifyListeners();
    });
  }

  void stopAutoPlay() {
    _timer?.cancel();
  }
}
