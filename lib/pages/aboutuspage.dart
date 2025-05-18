// ignore_for_file: library_private_types_in_public_api, deprecated_member_use
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:njewebsite/helper/contacthelperpage.dart';
import 'package:url_launcher/url_launcher.dart';

class AboutUsPage extends StatefulWidget {
  const AboutUsPage({super.key});

  @override
  State<AboutUsPage> createState() => _AboutUsPageState();
}

class _AboutUsPageState extends State<AboutUsPage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [Color(0xFFEFF3F6), Color(0xFFDDE3E9)],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        backgroundBlendMode: BlendMode.lighten,
        borderRadius: BorderRadius.circular(30),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 30,
            spreadRadius: 10,
          ),
        ],
      ),
      margin: EdgeInsets.all(20),
      padding: EdgeInsets.all(40),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          AnimatedText(),
          SizedBox(height: 10),
          Text(
            'Innovating the Future with Electrical Excellence',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 20,
              fontStyle: FontStyle.italic,
              color: Colors.black87,
              letterSpacing: 1.0,
              shadows: [
                Shadow(
                  color: Colors.black.withOpacity(0.1),
                  offset: Offset(2, 2),
                  blurRadius: 4,
                ),
              ],
            ),
          ),
          SizedBox(height: 24),
          Text(
            'We provide electrical solutions that power homes, businesses, and industries. Our team of experts offers reliable and innovative services with safety, energy-efficiency, and sustainability at the forefront.',
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 16, color: Colors.black87),
          ),
          SizedBox(height: 20),
          Wrap(
            alignment: WrapAlignment.center,
            spacing: 16,
            runSpacing: 16,
            children: [
              _infoTile(
                Icons.electrical_services,
                'Expert Electrical Solutions',
              ),
              _infoTile(Icons.star, 'Top Clients and Projects'),
              _infoTile(Icons.access_alarm, '10+ Years Experience'),
              _infoTile(Icons.lightbulb_outline, 'Energy-Efficient Designs'),
              _infoTile(Icons.draw, 'Professional AutoCad Designs'),
            ],
          ),
          SizedBox(height: 30),
          Container(
            padding: EdgeInsets.all(16),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.1),
                  blurRadius: 20,
                  spreadRadius: 5,
                ),
              ],
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 5.0, sigmaY: 5.0),
                child: Container(
                  color: Color.fromARGB(150, 255, 255, 255),
                  padding: EdgeInsets.all(16),
                  child: Column(
                    children: [
                      Text(
                        'Why Choose Us?',
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          color: Colors.blueGrey,
                        ),
                      ),
                      SizedBox(height: 10),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('✅ Comprehensive electrical services'),
                          Text('✅ Experienced professionals on every project'),
                          Text('✅ Timely and within budget'),
                          Text('✅ Future-ready, sustainable designs'),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
          SizedBox(height: 30),
          InkWell(
            onTap: () {
              Navigator.of(
                context,
              ).push(MaterialPageRoute(builder: (_) => ContactHelperPage()));
            },
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 24, vertical: 16),
              decoration: BoxDecoration(
                color: const Color.fromARGB(255, 61, 171, 226),
                borderRadius: BorderRadius.circular(40),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.1),
                    blurRadius: 20,
                    spreadRadius: 5,
                  ),
                ],
              ),
              child: Text(
                'Get in Touch',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.black87,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _infoTile(IconData icon, String label) {
    return GestureDetector(
      onTap: () {},
      child: HoverIcon(icon: icon, label: label),
    );
  }
}

class ContactCardPopup {
  static Future<void> show(BuildContext context) {
    return showDialog(
      context: context,
      barrierDismissible: true,
      builder:
          (_) => Dialog(
            backgroundColor: Colors.transparent,
            insetPadding: const EdgeInsets.symmetric(
              horizontal: 32,
              vertical: 24,
            ),
            child: const _GlassmorphicContactCard(),
          ),
    );
  }
}

class _GlassmorphicContactCard extends StatelessWidget {
  const _GlassmorphicContactCard();

  // Helpers for launching phone and email
  void _launchPhone(String phone) async {
    final uri = Uri(scheme: 'tel', path: phone);
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri);
    }
  }

  void _launchEmail(String email) async {
    final uri = Uri(
      scheme: 'mailto',
      path: email,
      query: Uri.encodeFull('subject=Contact Inquiry&body=Hello,'),
    );
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri);
    }
  }

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(24),
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 16, sigmaY: 16),
        child: Container(
          decoration: BoxDecoration(
            color: Colors.white.withOpacity(0.15),
            borderRadius: BorderRadius.circular(24),
            border: Border.all(
              color: Colors.white.withOpacity(0.25),
              width: 1.5,
            ),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.15),
                blurRadius: 12,
                offset: const Offset(0, 4),
              ),
            ],
          ),
          padding: const EdgeInsets.symmetric(horizontal: 28, vertical: 32),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                'Get In Touch',
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 1.2,
                  color: Colors.white.withOpacity(0.85),
                  shadows: [
                    Shadow(
                      color: Colors.black.withOpacity(0.4),
                      blurRadius: 4,
                      offset: const Offset(0, 2),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 28),
              _GlassContactRow(
                icon: Icons.location_on,
                label: 'Address',
                value: 'Medchal, Hyderabad, India',
                onTap: null,
              ),
              const SizedBox(height: 24),
              _GlassContactRow(
                icon: Icons.phone,
                label: 'Phone',
                value: '+91 9666111105',
                onTap: () => _launchPhone('+919666111105'),
              ),
              const SizedBox(height: 24),
              _GlassContactRow(
                icon: Icons.email,
                label: 'Email',
                value: 'info@nagajyothielectricals.com',
                onTap: () => _launchEmail('info@nagajyothielectricals.com'),
              ),
              const SizedBox(height: 32),
              Align(
                alignment: Alignment.centerRight,
                child: TextButton(
                  onPressed: () => Navigator.pop(context),
                  style: TextButton.styleFrom(
                    foregroundColor: Colors.white.withOpacity(0.8),
                    textStyle: const TextStyle(fontSize: 18),
                  ),
                  child: const Text('Close'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _GlassContactRow extends StatelessWidget {
  final IconData icon;
  final String label;
  final String value;
  final VoidCallback? onTap;

  const _GlassContactRow({
    required this.icon,
    required this.label,
    required this.value,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final iconColor = onTap != null ? Colors.white : Colors.white70;
    final textColor = Colors.white.withOpacity(0.85);

    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(16),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 44,
            height: 44,
            decoration: BoxDecoration(
              color: iconColor.withOpacity(0.3),
              shape: BoxShape.circle,
            ),
            child: Icon(icon, color: iconColor, size: 26),
          ),
          const SizedBox(width: 18),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  label,
                  style: TextStyle(
                    color: textColor.withOpacity(0.9),
                    fontWeight: FontWeight.w600,
                    fontSize: 16,
                  ),
                ),
                const SizedBox(height: 6),
                Text(
                  value,
                  style: TextStyle(
                    color:
                        onTap != null
                            ? Colors.blue.shade200
                            : textColor.withOpacity(0.8),
                    fontWeight: FontWeight.w500,
                    fontSize: 15,
                    decoration: onTap != null ? TextDecoration.underline : null,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class HoverIcon extends StatefulWidget {
  final IconData icon;
  final String label;

  const HoverIcon({super.key, required this.icon, required this.label});

  @override
  _HoverIconState createState() => _HoverIconState();
}

class _HoverIconState extends State<HoverIcon> {
  Color iconColor = Colors.black;
  Color backgroundColor = Color.fromARGB(100, 255, 255, 255);

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) {
        setState(() {
          iconColor = Colors.redAccent;
          backgroundColor = Color.fromARGB(180, 255, 255, 255);
        });
      },
      onExit: (_) {
        setState(() {
          iconColor = Colors.black;
          backgroundColor = Color.fromARGB(100, 255, 255, 255);
        });
      },
      child: AnimatedContainer(
        duration: Duration(milliseconds: 300),
        curve: Curves.easeInOut,
        padding: EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: backgroundColor,
          borderRadius: BorderRadius.circular(12),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.1),
              blurRadius: 10,
              spreadRadius: 2,
            ),
          ],
        ),
        child: Column(
          children: [
            Icon(widget.icon, color: iconColor, size: 40),
            SizedBox(height: 8),
            Text(
              widget.label,
              style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class AnimatedText extends StatefulWidget {
  const AnimatedText({super.key});

  @override
  _AnimatedTextState createState() => _AnimatedTextState();
}

class _AnimatedTextState extends State<AnimatedText> {
  double _fontSize = 42;

  @override
  void initState() {
    super.initState();
    _animateText();
  }

  void _animateText() {
    Future.delayed(Duration(milliseconds: 500), () {
      setState(() {
        _fontSize = 48;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedDefaultTextStyle(
      duration: Duration(milliseconds: 600),
      style: TextStyle(
        fontSize: _fontSize,
        fontWeight: FontWeight.bold,
        color: Colors.blueGrey.shade800,
        letterSpacing: 1.2,
        shadows: [
          Shadow(
            color: Colors.black.withOpacity(0.2),
            offset: Offset(2, 2),
            blurRadius: 6,
          ),
        ],
      ),
      child: Text('About Us', textAlign: TextAlign.center),
    );
  }
}
