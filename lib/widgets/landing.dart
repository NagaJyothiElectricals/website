// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:video_player/video_player.dart';
import 'package:animated_text_kit/animated_text_kit.dart';

class LandingPage extends StatefulWidget {
  const LandingPage({super.key});

  @override
  State<LandingPage> createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {
  late VideoPlayerController _controller;

  @override
  void initState() {
    super.initState();

    // Use your provided video URL
    _controller =
        VideoPlayerController.networkUrl(
            Uri.parse(
              'https://static.videezy.com/system/resources/previews/000/046/535/original/Lightning.mp4',
            ),
          )
          ..setLooping(true)
          ..setVolume(0)
          ..initialize().then((_) {
            _controller.play();
            setState(() {});
          });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  final List<String> textList = [
    "Do You Get Unlimited Ideas! Here's One Stop",
    "Amped up for innovation. Grounded in trust.",
    "Lighting Innovation, ",
    "Energizing The World!",
    "Naga Jyothi Electricals",
  ];
  final List<String> subtextList = [
    "Precision. Power. Performance.",
    "Lighting the path of progress — one connection at a time.",
    "We don’t just power buildings — we power industries.",
    "Energizing The India...",
    "Powering The Future We Trust..\n\tBefore.. Now.. Future..",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:
          _controller.value.isInitialized
              ? Stack(
                children: [
                  SizedBox.expand(
                    child: FittedBox(
                      fit: BoxFit.cover,
                      child: SizedBox(
                        width: _controller.value.size.width,
                        height: _controller.value.size.height,
                        child: VideoPlayer(_controller),
                      ),
                    ),
                  ),
                  Container(
                    color: Colors.black.withOpacity(
                      0.4,
                    ), // Dark overlay for contrast
                  ),
                  Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        DefaultTextStyle(
                          style: GoogleFonts.montserrat(
                            fontSize: 32.0,
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),

                          child: AnimatedTextKit(
                            animatedTexts:
                                textList
                                    .map(
                                      (text) => FadeAnimatedText(
                                        text,
                                        duration: const Duration(seconds: 4),
                                      ),
                                    )
                                    .toList(),
                            repeatForever: true,
                            pause: const Duration(milliseconds: 500),
                          ),
                        ),
                        const SizedBox(height: 20),
                        DefaultTextStyle(
                          style: GoogleFonts.quicksand(
                            fontSize: 20.0,
                            color: Colors.white70,
                            fontWeight: FontWeight.w700,
                          ),
                          child: AnimatedTextKit(
                            animatedTexts:
                                subtextList
                                    .map(
                                      (subtext) => FadeAnimatedText(
                                        subtext,
                                        duration: Duration(seconds: 4),
                                      ),
                                    )
                                    .toList(),
                            repeatForever: true,
                            pause: const Duration(milliseconds: 500),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              )
              : const Center(child: CircularProgressIndicator()),
    );
  }
}
