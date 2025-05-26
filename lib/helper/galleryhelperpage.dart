import 'dart:async';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:njewebsite/widgets/drawer.dart';
import 'package:video_player/video_player.dart';

class GalleryHelperPage extends StatefulWidget {
  const GalleryHelperPage({super.key});

  @override
  State<GalleryHelperPage> createState() => _GalleryPageState();
}

class _GalleryPageState extends State<GalleryHelperPage> {
  final List<String> imageUrls = [
    // Replace these with actual asset paths or network URLs
    'assets/images/pic1.jpg',
    'assets/images/pic2.jpg',
    'assets/images/pic3.jpg',
    'assets/images/pic4.jpg',
    'assets/images/pic5.jpg',
    'assets/images/pic6.jpg',
    'assets/images/pic7.jpg',
    'assets/images/pic8.jpg',
    'assets/images/pic9.jpg',
    'assets/images/pic10.jpg',
    'assets/images/pic21.jpg',
    'assets/images/pic22.jpg',
    'assets/images/pic23.jpg',
    'assets/images/pic24.jpg',
    'assets/images/pic25.jpg',
    'assets/images/pic26.jpg',
    'assets/images/pic27.jpg',
    'assets/images/pic28.jpg',
    'assets/images/pic29.jpg',
    'assets/images/pic30.jpg',
    'assets/images/pic31.jpg',
    'assets/images/pic32.jpg',
    'assets/images/pic33.jpg',
    'assets/images/pic34.jpg',
    'assets/images/pic35.jpg',
    'assets/images/pic36.jpg',
    'assets/images/pic37.jpg',
    'assets/images/pic38.jpg',
    'assets/images/pic39.jpg',
    'assets/images/pic40.jpg',
    'assets/images/pic41.jpg',
    'assets/images/pic42.jpg',
    'assets/images/pic43.jpg',
    'assets/images/pic44.jpg',
    'assets/images/pic45.jpg',
    'assets/images/pic46.jpg',
    'assets/images/pic47.jpg',
    'assets/images/pic48.jpg',
    'assets/images/pic49.jpg',
    'assets/images/pic50.jpg',
    'assets/images/pic51.jpg',
    'assets/images/pic52.jpg',
    'assets/images/pic53.jpg',
    'assets/images/pic54.jpg',
    'assets/images/pic55.jpg',
    'assets/images/pic56.jpg',
    'assets/images/pic57.jpg',
    'assets/images/pic58.jpg',
    'assets/images/pic59.jpg',
    'assets/images/pic60.jpg',
    'assets/images/pic61.jpg',
    'assets/images/pic62.jpg',
    'assets/images/pic63.jpg',
    'assets/images/pic64.jpg',
    'assets/images/pic65.jpg',
    'assets/images/pic66.jpg',
    'assets/images/pic67.jpg',
    'assets/images/pic68.jpg',
    'assets/images/pic69.jpg',
    'assets/images/pic70.jpg',
  ];
  final List<String> highlightImages = [
    'assets/images/pic57.jpg',
    'assets/images/pic58.jpg',
    'assets/images/pic59.jpg',
    'assets/images/pic60.jpg',
    'assets/images/pic61.jpg',
    'assets/images/pic62.jpg',
    'assets/images/pic63.jpg',
    'assets/images/pic64.jpg',
    'assets/images/pic11.jpg',
    'assets/images/pic12.jpg',
    'assets/images/pic13.jpg',
    'assets/images/pic14.jpg',
    'assets/images/pic15.jpg',
    'assets/images/pic16.jpg',
    'assets/images/pic17.jpg',
    'assets/images/pic18.jpg',
    'assets/images/pic19.jpg',
    'assets/images/pic20.jpg',
  ];

  final List<String> videosUrl = [
    'assets/videos/video1.mp4',
    'assets/videos/video2.mp4',
    'assets/videos/video3.mp4',
    'assets/videos/video5.mp4',
  ];

  final CarouselSliderControllerImpl _carouselController =
      CarouselSliderControllerImpl();
  int _currentHighlight = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      endDrawer: DrawerWidget(),
      appBar: AppBar(
        title: Text("Company Gallery"),
        flexibleSpace: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Colors.cyan,
                Colors.cyan,
                Colors.cyanAccent,
                Colors.cyanAccent,
              ],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
        ),
        backgroundColor: Colors.transparent,
      ),
      body: ListView(
        children: [
          const SizedBox(height: 10.0),

          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              'Recent Project Highlights',
              style: GoogleFonts.montserrat(
                fontSize: 32,
                fontWeight: FontWeight.w700,
                fontStyle: FontStyle.italic,
                color: Colors.red,
              ),
            ),
          ),
          SizedBox(height: 8.0),
          Column(
            children: [
              CarouselSlider.builder(
                itemCount: highlightImages.length,
                carouselController: _carouselController,
                options: CarouselOptions(
                  height: MediaQuery.sizeOf(context).height / 1.5,
                  autoPlay: true,
                  enlargeCenterPage: true,
                  viewportFraction: 0.8,
                  onPageChanged: (index, reason) {
                    setState(() {
                      _currentHighlight = index;
                    });
                  },
                ),
                itemBuilder: (context, index, realIdx) {
                  return ClipRRect(
                    borderRadius: BorderRadius.circular(12),
                    child: Image.asset(
                      highlightImages[index],
                      fit: BoxFit.cover,
                      width: double.infinity,
                    ),
                  );
                },
              ),
              const SizedBox(height: 8),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children:
                    highlightImages.asMap().entries.map((entry) {
                      return GestureDetector(
                        onTap:
                            () => _carouselController.animateToPage(entry.key),
                        child: Container(
                          width: 10.0,
                          height: 10.0,
                          margin: const EdgeInsets.symmetric(horizontal: 4.0),
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color:
                                _currentHighlight == entry.key
                                    ? Colors.redAccent
                                    : Colors.grey.shade300,
                          ),
                        ),
                      );
                    }).toList(),
              ),
            ],
          ),
          const SizedBox(height: 10),
          Divider(height: 1, color: Colors.black),
          const SizedBox(height: 10),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              'Images',
              style: GoogleFonts.montserrat(
                fontSize: 32,
                fontWeight: FontWeight.w700,
                fontStyle: FontStyle.italic,
                color: Colors.red,
              ),
            ),
          ),
          Container(
            color: Colors.black,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: MasonryGridView.count(
                physics: NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                crossAxisCount: MediaQuery.sizeOf(context).width > 800 ? 3 : 2,
                mainAxisSpacing: 8,
                crossAxisSpacing: 8,
                itemCount: 10,
                itemBuilder: (context, index) {
                  final imageUrl = imageUrls[index];
                  return HoverImageWidget(
                    imageUrl: imageUrl,
                    onTap: () => _showFullImage(context, imageUrl),
                  );
                },
              ),
            ),
          ),
          const SizedBox(height: 20.0),
          Divider(height: 1.0, color: Colors.black),
          const SizedBox(height: 10.0),

          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              'Videos',
              style: GoogleFonts.montserrat(
                fontSize: 32,
                fontWeight: FontWeight.w700,
                fontStyle: FontStyle.italic,
                color: Colors.red,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Project Videos',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 8),
                MasonryGridView.count(
                  mainAxisSpacing: 8,
                  crossAxisSpacing: 8,
                  crossAxisCount:
                      MediaQuery.of(context).size.width > 800 ? 3 : 2,
                  itemCount: videosUrl.length,
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  itemBuilder: (context, index) {
                    final videoUrl = videosUrl[index];
                    return Stack(
                      children: [
                        GestureDetector(
                          onTap: () => _showVideoDialog(context, videoUrl),
                          child: Container(
                            margin: EdgeInsets.symmetric(vertical: 8),
                            height: 280,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(12),
                              color: Colors.black12,
                            ),
                            child: Center(
                              child: Icon(
                                Icons.play_circle_fill,
                                size: 64,
                                color: Colors.blueAccent,
                              ),
                            ),
                          ),
                        ),
                      ],
                    );
                  },
                ),
              ],
            ),
          ),
          Divider(height: 1.0, color: Colors.black),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              'More Images',
              style: GoogleFonts.montserrat(
                fontSize: 32,
                fontWeight: FontWeight.w700,
                fontStyle: FontStyle.italic,
                color: Colors.red,
              ),
            ),
          ),
          Container(
            color: Colors.black,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: MasonryGridView.count(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                crossAxisCount: MediaQuery.of(context).size.width > 800 ? 3 : 2,
                mainAxisSpacing: 8,
                crossAxisSpacing: 8,
                itemCount: imageUrls.length - 10,
                itemBuilder: (context, index) {
                  final imageUrl = imageUrls[index + 10];
                  return HoverImageWidget(
                    imageUrl: imageUrl,
                    onTap: () => _showFullImage(context, imageUrl),
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }

  void _showVideoDialog(BuildContext context, String videoUrl) {
    showDialog(
      context: context,
      builder:
          (context) => Dialog(
            insetPadding: EdgeInsets.all(10),
            backgroundColor: Colors.black,
            child: ConstrainedBox(
              constraints: BoxConstraints(
                maxHeight: MediaQuery.sizeOf(context).height,
                maxWidth: MediaQuery.sizeOf(context).width,
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 12.0),
                child: _VideoPlayerWidget(videoUrl: videoUrl),
              ),
            ),
          ),
    );
  }

  void _showFullImage(BuildContext context, String imageUrl) {
    showDialog(
      context: context,
      builder:
          (context) => Dialog(
            child: InteractiveViewer(
              child: Image.asset(imageUrl, fit: BoxFit.contain),
            ),
          ),
    );
  }
}

class _VideoPlayerWidget extends StatefulWidget {
  final String videoUrl;

  const _VideoPlayerWidget({required this.videoUrl});

  @override
  State<_VideoPlayerWidget> createState() => _VideoPlayerWidgetState();
}

class _VideoPlayerWidgetState extends State<_VideoPlayerWidget> {
  late VideoPlayerController _controller;
  late Future<void> _initializeVideoPlayerFuture;
  bool _isPlaying = false;

  @override
  void initState() {
    super.initState();
    _controller = VideoPlayerController.asset(widget.videoUrl);
    _initializeVideoPlayerFuture = _controller.initialize().then((_) {
      setState(() {
        _isPlaying = true;
        _controller.setVolume(0.0);
        _controller.play();
        _controller.setLooping(true);
        _controller.addListener(() {
          if (mounted) setState(() {}); // keeps UI in sync
        });
      });
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _togglePlayback() {
    setState(() {
      _isPlaying = !_isPlaying;
      _isPlaying ? _controller.play() : _controller.pause();
    });
  }

  String _formatDuration(Duration duration) {
    final minutes = duration.inMinutes.toString().padLeft(2, '0');
    final seconds = (duration.inSeconds % 60).toString().padLeft(2, '0');
    return '$minutes:$seconds';
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: _initializeVideoPlayerFuture,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          return Stack(
            alignment: Alignment.bottomCenter,
            children: [
              AspectRatio(
                aspectRatio: _controller.value.aspectRatio,
                child: VideoPlayer(_controller),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 5.0, right: 5.0),
                child: VideoProgressIndicator(
                  _controller,
                  allowScrubbing: true,
                  colors: VideoProgressColors(
                    playedColor: Colors.red,
                    bufferedColor: Colors.grey,
                    backgroundColor: Colors.white24,
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,

                children: [
                  IconButton(
                    icon: Icon(
                      _isPlaying ? Icons.pause : Icons.play_arrow,
                      color: Colors.white,
                      size: 30,
                    ),
                    onPressed: _togglePlayback,
                  ),
                  Text(
                    '${_formatDuration(_controller.value.position)} / ${_formatDuration(_controller.value.duration)}',
                    style: TextStyle(color: Colors.white),
                  ),
                ],
              ),
            ],
          );
        } else {
          return Center(child: CircularProgressIndicator());
        }
      },
    );
  }
}

class HoverImageWidget extends StatefulWidget {
  final String imageUrl;
  final VoidCallback onTap;

  const HoverImageWidget({
    required this.imageUrl,
    required this.onTap,
    super.key,
  });

  @override
  State<HoverImageWidget> createState() => _HoverImageWidgetState();
}

class _HoverImageWidgetState extends State<HoverImageWidget> {
  bool _hovering = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => _hovering = true),
      onExit: (_) => setState(() => _hovering = false),
      child: GestureDetector(
        onTap: widget.onTap,
        child: Stack(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: Image.asset(widget.imageUrl, fit: BoxFit.cover),
            ),
            AnimatedOpacity(
              opacity: _hovering ? 1 : 0,
              duration: Duration(milliseconds: 200),
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  color: Colors.black45,
                ),
                alignment: Alignment.center,
                child: Icon(Icons.zoom_in, color: Colors.white, size: 40),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
