import 'dart:ui'; // For ImageFilter
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class GalleryPage extends StatefulWidget {
  const GalleryPage({super.key});

  @override
  State<GalleryPage> createState() => _GalleryPageState();
}

class _GalleryPageState extends State<GalleryPage> {
  final List<List<String>> _carouselItems = [
    [
      'assets/images/homeimage.jpeg',
      'assets/images/homeimage.jpg',
      'assets/images/logo.png',
    ],
    [
      'assets/images/njehome.jpeg',
      'assets/images/pic1.jpg',
      'assets/images/pic5.jpg',
    ],
    [
      'assets/images/pic2.jpg',
      'assets/images/pic3.jpg',
      'assets/images/pic4.jpg',
    ],
    [
      'assets/images/pic6.jpg',
      'assets/images/pic7.jpg',
      'assets/images/pic8.jpg',
    ],
    [
      'assets/images/pic9.jpg',
      'assets/images/pic10.jpg',
      'assets/images/pic11.jpg',
    ],
    [
      'assets/images/pic13.jpg',
      'assets/images/pic12.jpg',
      'assets/images/pic17.jpg',
    ],
    [
      'assets/images/pic14.jpg',
      'assets/images/pic15.jpg',
      'assets/images/pic16.jpg',
    ],
    [
      'assets/images/pic18.jpg',
      'assets/images/pic19.jpg',
      'assets/images/pic20.jpg',
    ],
    [
      'assets/images/pic21.jpg',
      'assets/images/pic22.jpg',
      'assets/images/pic24.jpg',
    ],
    [
      'assets/images/pic25.jpg',
      'assets/images/pic27.jpg',
      'assets/images/pic28.jpg',
    ],
    [
      'assets/images/pic26.jpg',
      'assets/images/pic29.jpg',
      'assets/images/pic23.jpg',
    ],
    [
      'assets/images/pic30.jpg',
      'assets/images/njelogo.png',
      'assets/images/pic29.jpg',
    ],
  ];

  void _showFullScreenPopup(List<String> allImages, int initialIndex) {
    showGeneralDialog(
      context: context,
      barrierLabel: "Image Viewer",
      barrierDismissible: true,
      barrierColor: Color.fromRGBO(0, 0, 0, 0.95),
      transitionDuration: Duration(milliseconds: 300),
      pageBuilder: (_, __, ___) {
        final controller = PageController(initialPage: initialIndex);
        return Scaffold(
          backgroundColor: Colors.transparent,
          body: SafeArea(
            child: GestureDetector(
              onTap: () => Navigator.pop(context),
              child: PageView.builder(
                controller: controller,
                itemCount: allImages.length,
                itemBuilder: (context, index) {
                  final image = allImages[index];
                  final tag = 'hero_${image}_$index';
                  return Center(
                    child: Hero(
                      tag: tag,
                      child: Image.asset(image, fit: BoxFit.contain),
                    ),
                  );
                },
              ),
            ),
          ),
        );
      },
      transitionBuilder: (_, anim, __, child) {
        return FadeTransition(opacity: anim, child: child);
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final allImages = _carouselItems.expand((e) => e).toList();
    return Padding(
      padding: const EdgeInsets.only(left: 5.0, right: 5.0),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(16),
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 12.0, sigmaY: 12.0),
          child: Container(
            height: MediaQuery.sizeOf(context).height / 2,
            width: MediaQuery.sizeOf(context).width,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(16),
              border: Border.all(color: Colors.white38),
              boxShadow: [
                BoxShadow(
                  color: Colors.black26,
                  blurRadius: 8,
                  spreadRadius: 2,
                ),
              ],
            ),
            child: SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    'Gallery',
                    style: GoogleFonts.montserrat(
                      fontSize: 32,
                      fontStyle: FontStyle.italic,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                  CarouselSlider(
                    options: CarouselOptions(
                      height: MediaQuery.sizeOf(context).height / 1.75,
                      autoPlay: true,
                      enlargeCenterPage: true,
                    ),
                    items:
                        _carouselItems.map((gridImages) {
                          return Builder(
                            builder: (context) {
                              return GridView.builder(
                                physics: NeverScrollableScrollPhysics(),
                                shrinkWrap: true,
                                itemCount: gridImages.length,
                                gridDelegate:
                                    SliverGridDelegateWithFixedCrossAxisCount(
                                      crossAxisCount: 3,
                                      crossAxisSpacing: 8,
                                      mainAxisSpacing: 8,
                                      childAspectRatio: 4 / 3,
                                    ),
                                itemBuilder: (context, index) {
                                  final image = gridImages[index];
                                  final flatIndex = allImages.indexOf(image);
                                  final tag =
                                      'hero_${gridImages[index]}_${_carouselItems.indexOf(gridImages)}_$index';

                                  return GestureDetector(
                                    onTap:
                                        () => _showFullScreenPopup(
                                          allImages,
                                          flatIndex,
                                        ),
                                    child: Hero(
                                      tag: tag,
                                      child: ClipRRect(
                                        borderRadius: BorderRadius.circular(8),
                                        child: Image.asset(
                                          image,
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                    ),
                                  );
                                },
                              );
                            },
                          );
                        }).toList(),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
