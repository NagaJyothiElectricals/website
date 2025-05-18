import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:njewebsite/pages/aboutuspage.dart';
import 'package:njewebsite/pages/clientspage.dart';
import 'package:njewebsite/pages/contactpage.dart';
import 'package:njewebsite/pages/gallerypage.dart';
import 'package:njewebsite/pages/servicespage.dart';
import 'package:njewebsite/widgets/chatbot.dart';
import 'package:njewebsite/widgets/drawer.dart';
import 'package:njewebsite/widgets/landing.dart';
import 'package:url_launcher/url_launcher.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: Stack(
        clipBehavior: Clip.none,

        children: [
          Stack(
            clipBehavior: Clip.none,
            alignment: Alignment.bottomRight,
            children: [
              // FAB
              FloatingActionButton(
                backgroundColor: Colors.blue,
                child: ClipOval(
                  child: Image.asset(
                    'images/scrappy.png', // your transparent icon image here
                    width: 38,
                    height: 38,
                    fit: BoxFit.contain,
                  ),
                ),
                onPressed: () => _openChatBot(context),
              ),
            ],
          ),
        ],
      ),
      backgroundColor: Colors.transparent,
      extendBodyBehindAppBar: true,
      endDrawer: DrawerWidget(),
      appBar: PreferredSize(
        preferredSize: Size(MediaQuery.sizeOf(context).width, 140),
        child: AppBar(
          automaticallyImplyLeading: false,
          bottom: PreferredSize(
            preferredSize: Size.fromHeight(50),
            child: Align(
              alignment: Alignment.centerRight,
              child: Container(
                width: MediaQuery.sizeOf(context).width / 1.5,
                color: Colors.deepOrangeAccent,
                height: 24,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    quickLinks(
                      email: 'info@nagajyothielectricals.com',
                      phone: '+91 9666111105',
                    ),

                    // RichText(
                    //   text: TextSpan(
                    //     text: 'Gmail: Info@nje.com',
                    //     style: TextStyle(color: Colors.white),
                    //   ),
                    // ),
                    // TextButton(
                    //   onPressed: () {},
                    //   child: Text(
                    //     'Call Us: +91 9666111105',
                    //     style: TextStyle(color: Colors.white),
                    //   ),
                    // ),
                  ],
                ),
              ),
            ),
          ),
          elevation: 0,
          backgroundColor: Colors.white,
          centerTitle: false,
          toolbarHeight: 200,
          title: Padding(
            padding: const EdgeInsets.all(5.0),
            child: Row(
              children: [
                SizedBox(height: 10.0),
                Image.asset(
                  'images/logo1.png', // or use NetworkImage
                  height: 150,
                  width: 200,
                ),
                Text(
                  'NAGA',
                  style: GoogleFonts.montserrat(
                    fontSize: 18,
                    color: Colors.orange,
                    fontWeight: FontWeight.bold,
                    fontStyle: FontStyle.italic,
                  ),
                ),
                Text(
                  'JYOTHI',
                  style: GoogleFonts.montserrat(
                    fontSize: 18,
                    color: Colors.lightGreen,
                    fontWeight: FontWeight.bold,
                    fontStyle: FontStyle.italic,
                  ),
                ),
                Text(
                  'ELECTRICALS',
                  style: GoogleFonts.montserrat(
                    fontSize: 18,
                    color: Colors.blueAccent,
                    fontWeight: FontWeight.bold,
                    fontStyle: FontStyle.italic,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      body: Stack(
        children: [
          Container(
            color: Colors.white,
            height: MediaQuery.sizeOf(context).height,
            width: MediaQuery.sizeOf(context).width,
            child: SingleChildScrollView(
              child: Column(
                children: [
                  SizedBox(height: 15.0),
                  SizedBox(
                    height: MediaQuery.sizeOf(context).height / 0.75,
                    width: MediaQuery.sizeOf(context).width,
                    child: LandingPage(),
                  ),
                  //CarouselSliderPage(),
                  AboutUsPage(),
                  ServicesPage(),
                  ClientsPage(),
                  GalleryPage(),
                  ContactPage(),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  void _openChatBot(BuildContext context) {
    showDialog(
      context: context,
      builder:
          (context) => Align(
            alignment: Alignment.bottomRight,
            child: Padding(
              padding: const EdgeInsets.only(bottom: 80, right: 20),
              child: Material(
                type: MaterialType.transparency,
                child: ChatBotGlassBox(),
              ),
            ),
          ),
    );
  }

  Widget quickLinks({required String email, required String phone}) {
    Future<void> launchUrlHelper(String url) async {
      final Uri uri = Uri.parse(url);
      if (!await launchUrl(uri)) {
        throw 'Could not launch $url';
      }
    }

    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        GestureDetector(
          onTap: () => launchUrlHelper('mailto:$email'),
          child: Padding(
            padding: const EdgeInsets.only(left: 8.0, right: 8.0),
            child: Text(
              'Email: $email',
              style: GoogleFonts.maitree(color: Colors.white, fontSize: 16),
            ),
          ),
        ),
        const SizedBox(width: 20.0),
        GestureDetector(
          onTap: () => launchUrlHelper('tel:$phone'),
          child: Padding(
            padding: const EdgeInsets.only(left: 8.0, right: 8.0),
            child: Text(
              'Call: $phone',
              style: GoogleFonts.maitree(color: Colors.white, fontSize: 16),
            ),
          ),
        ),
      ],
    );
  }
}
