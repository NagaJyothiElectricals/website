// ignore_for_file: deprecated_member_use

import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:njewebsite/helper/aboutushelperpage.dart';
import 'package:njewebsite/helper/clientspagehelper.dart';
import 'package:njewebsite/helper/contacthelperpage.dart';
import 'package:njewebsite/helper/galleryhelperpage.dart';
import 'package:njewebsite/helper/serviceshelperpage.dart';
import 'package:njewebsite/pages/homepage.dart';
// import 'package:google_fonts/google_fonts.dart';
// import 'package:njewebsite/helper/aboutushelperpage.dart';
// import 'package:njewebsite/helper/contacthelperpage.dart';
// import 'package:njewebsite/helper/galleryhelperpage.dart';
// import 'package:njewebsite/helper/serviceshelperpage.dart';
// import 'package:njewebsite/pages/homepage.dart';

class DrawerWidget extends StatefulWidget {
  const DrawerWidget({super.key});

  @override
  State<DrawerWidget> createState() => _DrawerWidgetState();
}

class _DrawerWidgetState extends State<DrawerWidget> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Colors.transparent,
      child: ClipRRect(
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(24),
          bottomLeft: Radius.circular(24),
        ),
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 18, sigmaY: 18),
          child: Container(
            decoration: BoxDecoration(
              color: Colors.white.withOpacity(0.05),
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(20),
                bottomLeft: Radius.circular(20),
              ),
              border: Border.all(
                color: Colors.white.withOpacity(0.1),
                width: 1.5,
              ),
            ),
            child: ListView(
              padding: const EdgeInsets.symmetric(vertical: 40, horizontal: 16),
              children: [
                FlatGradientHoverTile(
                  icon: Icons.home,
                  label: 'Home',
                  hoverGradient: const LinearGradient(
                    colors: [Colors.blue, Colors.lightBlueAccent],
                  ),
                  onTap: () {
                    Navigator.of(context).pop();
                    Navigator.of(
                      context,
                    ).push(MaterialPageRoute(builder: (_) => MyHomePage()));
                  },
                ),
                FlatGradientHoverTile(
                  icon: Icons.info_outline,
                  label: 'About Us',
                  hoverGradient: const LinearGradient(
                    colors: [Colors.purple, Colors.pinkAccent],
                  ),
                  onTap: () {
                    Navigator.of(context).pop();
                    Navigator.of(context).push(
                      MaterialPageRoute(builder: (_) => AboutUsHelperPage()),
                    );
                  },
                ),
                FlatGradientHoverTile(
                  icon: Icons.build_circle_outlined,
                  label: 'Services',
                  hoverGradient: const LinearGradient(
                    colors: [Colors.orange, Colors.deepOrangeAccent],
                  ),
                  onTap: () {
                    Navigator.of(context).pop();
                    Navigator.of(context).push(
                      MaterialPageRoute(builder: (_) => ServicesHelperPage()),
                    );
                  },
                ),
                FlatGradientHoverTile(
                  icon: Icons.build_circle_outlined,
                  label: 'Clients',
                  hoverGradient: const LinearGradient(
                    colors: [Colors.red, Colors.redAccent],
                  ),
                  onTap: () {
                    Navigator.of(context).pop();
                    Navigator.of(context).push(
                      MaterialPageRoute(builder: (_) => ClientsPageHelper()),
                    );
                  },
                ),
                FlatGradientHoverTile(
                  icon: Icons.photo_library_outlined,
                  label: 'Gallery',
                  hoverGradient: const LinearGradient(
                    colors: [Colors.teal, Colors.cyanAccent],
                  ),
                  onTap: () {
                    Navigator.of(context).pop();
                    Navigator.of(context).push(
                      MaterialPageRoute(builder: (_) => GalleryHelperPage()),
                    );
                  },
                ),
                FlatGradientHoverTile(
                  icon: Icons.contact_mail_outlined,
                  label: 'Contact',
                  hoverGradient: const LinearGradient(
                    colors: [Colors.green, Colors.lightGreenAccent],
                  ),
                  onTap: () {
                    Navigator.of(context).pop();
                    Navigator.of(context).push(
                      MaterialPageRoute(builder: (_) => ContactHelperPage()),
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class FlatGradientHoverTile extends StatefulWidget {
  final IconData icon;
  final String label;
  final VoidCallback onTap;
  final Gradient hoverGradient;

  const FlatGradientHoverTile({
    super.key,
    required this.icon,
    required this.label,
    required this.onTap,
    required this.hoverGradient,
  });

  @override
  FlatGradientHoverTileState createState() => FlatGradientHoverTileState();
}

class FlatGradientHoverTileState extends State<FlatGradientHoverTile> {
  bool _hovering = false;

  void _setHover(bool hover) {
    setState(() {
      _hovering = hover;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => _setHover(true),
      onExit: (_) => _setHover(false),
      child: GestureDetector(
        onTap: widget.onTap,
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 200),
          padding: const EdgeInsets.symmetric(vertical: 14, horizontal: 20),
          transform:
              _hovering
                  ? (Matrix4.identity()..scale(1.05))
                  : Matrix4.identity(),
          child: Row(
            children: [
              _hovering
                  ? ShaderMask(
                    shaderCallback:
                        (bounds) => widget.hoverGradient.createShader(
                          Rect.fromLTWH(0, 0, bounds.width, bounds.height),
                        ),
                    child: Icon(widget.icon, size: 24, color: Colors.white),
                  )
                  : Icon(widget.icon, size: 24, color: Colors.white),

              const SizedBox(width: 16),

              _hovering
                  ? ShaderMask(
                    shaderCallback:
                        (bounds) => widget.hoverGradient.createShader(
                          Rect.fromLTWH(0, 0, bounds.width, bounds.height),
                        ),
                    child: Text(
                      widget.label,
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                        color: Colors.white,
                      ),
                    ),
                  )
                  : Text(
                    widget.label,
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                      color: Colors.white,
                    ),
                  ),
            ],
          ),
        ),
      ),
    );
  }
}

//   @override
//   Widget build(BuildContext context) {
//     return Drawer(
//       elevation: 1,
//       backgroundColor: Colors.black54,
//       child: ListView(
//         children: [
//           ListTile(
//             leading: Icon(Icons.home, color: Colors.white, size: 18),
//             onTap: () {
//               Navigator.of(context).pushReplacement(
//                 MaterialPageRoute(builder: (context) => MyHomePage()),
//               );
//             },
//             title: Text(
//               'Home',
//               style: GoogleFonts.montserrat(fontSize: 18, color: Colors.white),
//             ),
//           ),
//           Divider(color: Colors.white),
//           ListTile(
//             leading: Icon(Icons.home, color: Colors.white, size: 18),
//             onTap: () {
//               Navigator.of(context).push(
//                 MaterialPageRoute(builder: (context) => AboutUsHelperPage()),
//               );
//             },
//             title: Text(
//               'About Us',
//               style: GoogleFonts.montserrat(fontSize: 18, color: Colors.white),
//             ),
//           ),
//           Divider(color: Colors.white),
//           ListTile(
//             leading: Icon(Icons.home, color: Colors.white, size: 18),
//             onTap: () {
//               Navigator.of(
//                 context,
//               ).push(MaterialPageRoute(builder: (_) => GalleryHelperPage()));
//             },
//             title: Text(
//               'Gallery',
//               style: GoogleFonts.montserrat(fontSize: 18, color: Colors.white),
//             ),
//           ),
//           Divider(color: Colors.white),
//           ListTile(
//             leading: Icon(Icons.home, color: Colors.white, size: 18),
//             onTap: () {
//               Navigator.of(
//                 context,
//               ).push(MaterialPageRoute(builder: (_) => ServicesHelperPage()));
//             },
//             title: Text(
//               'Our Services',
//               style: GoogleFonts.montserrat(fontSize: 18, color: Colors.white),
//             ),
//           ),
//           Divider(color: Colors.white),
//           ListTile(
//             leading: Icon(Icons.home, color: Colors.white, size: 18),
//             onTap: () {
//               Navigator.of(
//                 context,
//               ).push(MaterialPageRoute(builder: (_) => ContactHelperPage()));
//             },
//             title: Text(
//               'Contact Us',
//               style: GoogleFonts.montserrat(fontSize: 18, color: Colors.white),
//             ),
//           ),
//           Divider(color: Colors.white),
//         ],
//       ),
//     );
//   }
// }
