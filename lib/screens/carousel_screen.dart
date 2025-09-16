import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:provider/provider.dart';
import 'package:image_carousel/models/carousel_model.dart';
import 'package:cached_network_image/cached_network_image.dart';

class CarouselScreen extends StatefulWidget {
  const CarouselScreen({
    Key? key,
    required this.images,
    this.autoPlay = true,
    this.autoPlayInterval = const Duration(seconds: 3),
    this.indicatorColor = Colors.blue,
    this.inactiveIndicatorColor = Colors.grey,
  }) : super(key: key);

  final List<String> images;
  final bool autoPlay;
  final Duration autoPlayInterval;
  final Color indicatorColor;
  final Color inactiveIndicatorColor;

  @override
  State<CarouselScreen> createState() => _CarouselScreenState();
}

class _CarouselScreenState extends State<CarouselScreen> {

  @override
  void initState() {
    super.initState();

    if (widget.autoPlay) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        if (mounted) {
        Provider.of<CarouselModel>(context, listen: false).startAutoPlay(widget.autoPlayInterval, widget.images.length);
      }
      });
    }
  }

  @override
  void dispose() {
    Provider.of<CarouselModel>(context, listen: false).stopAutoPlay();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Image Carousel')), // Added AppBar
      body: Consumer<CarouselModel>(
        builder: (context, model, child) {
          return Column(
            children: [
              CarouselSlider(
                options: CarouselOptions(
                  autoPlay: false,
                  enlargeCenterPage: true,
                  aspectRatio: 16 / 9,
                  viewportFraction: 0.8,
                  onPageChanged: (index, reason) {
                    model.setCurrentIndex(index);
                  },
                ),
                items: widget.images.map((image) {
                  return Builder(
                    builder: (BuildContext context) {
                      return Container(
                        width: MediaQuery.of(context).size.width,
                        margin: const EdgeInsets.symmetric(horizontal: 5.0),
                        decoration: const BoxDecoration(
                          color: Colors.amber
                        ),
                        child: (image.startsWith('http'))
                          ? CachedNetworkImage(
                              imageUrl: image,
                              fit: BoxFit.cover,
                              placeholder: (context, url) => const Center(child: CircularProgressIndicator()),
                              errorWidget: (context, url, error) => const Icon(Icons.error),
                            )
                          : Image.asset(
                              image,
                              fit: BoxFit.cover,
                            ),
                      );
                    },
                  );
                }).toList(),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: widget.images.asMap().entries.map((entry) {
                  return GestureDetector(
                    onTap: () => Provider.of<CarouselModel>(context, listen: false).carouselController.animateToPage(entry.key),
                    child: Container(
                      width: 12.0,
                      height: 12.0,
                      margin: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 4.0),
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: (Theme.of(context).brightness == Brightness.dark
                                ? Colors.white
                                : widget.inactiveIndicatorColor)
                            .withOpacity(model.currentIndex == entry.key ? 0.9 : 0.4),
                      ),
                    ),
                  );
                }).toList(),
              ),
            ],
          );
        },
      ),
    );
  }
}
