import 'package:flutter/material.dart';
import 'package:njewebsite/pages/homepage.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'NJE WEBSITE',
      // initialRoute: '/myHome',
      // routes: {
      //   '/myHome': (context) => const MyHomePage(),
      //   '/home': (context) => const HomePage(),
      //   '/about': (context) => const AboutUsPage(),
      //   '/services': (context) => const ServicesPage(),
      //   '/portfolio': (context) => const GalleryPage(),
      //   '/contact': (context) => const ContactPage(),
      // },
      home: MyHomePage(),
      debugShowCheckedModeBanner: false,
    );
  }
}
