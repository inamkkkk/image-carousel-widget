import 'package:flutter/material.dart';
import 'package:image_carousel/screens/carousel_screen.dart';
import 'package:provider/provider.dart';
import 'package:image_carousel/models/carousel_model.dart';

void main() {
  runApp(
    ChangeNotifierProvider(create: (context) => CarouselModel(), child: const MyApp()),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Image Carousel Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const CarouselScreen(
        images: [
          'assets/images/image1.jpg',
          'https://via.placeholder.com/600/92c952',
          'assets/images/image2.jpg',
          'https://via.placeholder.com/600/771796'
        ],
        autoPlay: true,
        autoPlayInterval: Duration(seconds: 3),
      ),
    );
  }
}
