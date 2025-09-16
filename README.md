# Image Carousel Widget

A customizable Flutter image carousel widget that supports local assets and network images, including dot indicators and auto-scrolling.

## Features

*   Supports both local asset images and network images.
*   Includes dot indicators to show the current image.
*   Auto-scrolling functionality with customizable duration.
*   Uses Provider for state management.
*   Uses `carousel_slider` package for the carousel implementation
*   Uses `cached_network_image` package for caching network images

## Usage

1.  Add the dependency to your `pubspec.yaml` file:

    
    dependencies:
      image_carousel: ^1.0.0
    

2.  Import the package in your Dart code:

    
    import 'package:image_carousel/screens/carousel_screen.dart';
    

3.  Use the `CarouselScreen` widget in your app.

## Example


import 'package:flutter/material.dart';
import 'package:image_carousel/screens/carousel_screen.dart';

void main() {
  runApp(const MyApp());
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


## Customization

You can customize the following properties:

*   `images`: A list of image URLs (local assets or network).
*   `autoPlay`: A boolean indicating whether the carousel should auto-scroll.
*   `autoPlayInterval`: The duration between auto-scrolls.
*   `indicatorColor`: The color of the active dot indicator.
*   `inactiveIndicatorColor`: The color of the inactive dot indicators.

## Folder Structure


image_carousel/
├── lib/
│   ├── main.dart
│   ├── screens/
│   │   └── carousel_screen.dart
│   ├── models/
│   │   └── carousel_model.dart
│   ├── services/
│   │   └── carousel_service.dart
├── assets/
│   └── images/
│       ├── image1.jpg
│       └── image2.jpg
├── pubspec.yaml
└── README.md


## Assets

Place local images in the `assets/images/` folder and reference them in the `images` list.

**Note:** Remember to declare the assets directory in your `pubspec.yaml` file under the `flutter` section.
