import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:njewebsite/helper/contacthelperpage.dart';
import 'package:url_launcher/url_launcher.dart';

class ContactPage extends StatefulWidget {
  const ContactPage({super.key});

  @override
  State<ContactPage> createState() => _ContactPageState();
}

class _ContactPageState extends State<ContactPage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 40, horizontal: 20),
      width: MediaQuery.sizeOf(context).width,
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          colors: [Color(0xFF0F2027), Color(0xFF203A43), Color(0xFF2C5364)],
        ),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          // Company Info and Contact Details
          Text(
            'Naga Jyothi Electricals',
            style: TextStyle(
              color: Colors.white,
              fontSize: 30,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            'Innovating for a better future',
            style: TextStyle(color: Colors.white70, fontSize: 16),
          ),
          const SizedBox(height: 20),
          const Text(
            'Phone: +91 9666111105\t \tOffice: +91 9989376363\n\n Email: info@nagajyothielectricals.com',
            style: TextStyle(color: Colors.white70, fontSize: 14),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 20),

          // Call to Action Button
          ElevatedButton(
            onPressed: () {
              Navigator.of(
                context,
              ).push(MaterialPageRoute(builder: (_) => ContactHelperPage()));
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.orangeAccent, // Button Color
              padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 30),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(25),
              ),
            ),
            child: const Text(
              'Get in Touch',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
          ),
          const SizedBox(height: 20),

          // Social Media Icons with Hover Effect
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [ContactIconsRow()],
          ),
          const SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextButton(
                onPressed: () {
                  showDialog(
                    context: context,
                    builder:
                        (context) => AlertDialog(
                          title: Text("Privacy Policy"),
                          content: const SizedBox(
                            width: double.maxFinite,
                            height: 400,
                            child: PrivacyPolicyWidget(),
                          ),
                          actions: [
                            TextButton(
                              onPressed: () => Navigator.of(context).pop(),
                              child: const Text("Close"),
                            ),
                          ],
                        ),
                  );
                },
                child: Text(
                  "Privacy Policy",
                  style: GoogleFonts.quicksand(
                    fontSize: 14,
                    color: Colors.redAccent,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Text(
                " | ",
                style: GoogleFonts.quicksand(
                  fontSize: 14,
                  color: Colors.grey,
                  fontWeight: FontWeight.bold,
                ),
              ),
              TextButton(
                onPressed: () {
                  showDialog(
                    context: context,
                    builder:
                        (context) => AlertDialog(
                          title: const Text("Terms & Conditions"),
                          content: const SizedBox(
                            width: double.maxFinite,
                            height: 400,
                            child: TermsAndConditionsWidget(),
                          ),
                          actions: [
                            TextButton(
                              onPressed: () => Navigator.of(context).pop(),
                              child: const Text("Close"),
                            ),
                          ],
                        ),
                  );
                },
                child: Text(
                  "Terms & Conditions",
                  style: GoogleFonts.quicksand(
                    fontSize: 14,
                    color: Colors.redAccent,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
          // Copyright
          const Text(
            '© 2025 Naga Jyothi Electricals. All rights reserved.',
            style: TextStyle(color: Colors.white54, fontSize: 12),
          ),
        ],
      ),
    );
  }
}

class TermsAndConditionsWidget extends StatelessWidget {
  const TermsAndConditionsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("Terms & Conditions"),
          const SizedBox(height: 10),
          Text(
            "Welcome to Naga Jyothi Electricals. By using our services, you agree to the following terms and conditions.\n",
          ),
          Text(
            "1. Service Scope",
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          Text(
            "We provide electrical contracting for industrial, commercial, and infrastructure projects.",
          ),
          const SizedBox(height: 10),
          Text("2. Estimates", style: TextStyle(fontWeight: FontWeight.bold)),
          Text(
            "All estimates are preliminary and may change post site inspection.",
          ),
          const SizedBox(height: 10),
          Text("3. Payments", style: TextStyle(fontWeight: FontWeight.bold)),
          Text(
            "Payments must be made as per contract. Delays may incur penalties.",
          ),
          const SizedBox(height: 10),
          Text("4. Liability", style: TextStyle(fontWeight: FontWeight.bold)),
          Text("We are not liable for indirect or consequential damages."),
          const SizedBox(height: 10),
          Text("5. Warranty", style: TextStyle(fontWeight: FontWeight.bold)),
          Text(
            "Limited warranty is offered as per project. Excludes misuse and disasters.",
          ),
          const SizedBox(height: 10),
          Text(
            "6. Dispute Resolution",
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          Text("Subject to Indian law under Telangana jurisdiction."),
        ],
      ),
    );
  }
}

class PrivacyPolicyWidget extends StatelessWidget {
  const PrivacyPolicyWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("Privacy Policy"),
          const SizedBox(height: 10),
          Text(
            "At Naga Jyothi Electricals, your privacy is important to us. This Privacy Policy explains how we collect, use, and protect your personal information when you contact us or use our services.\n",
          ),
          Text(
            "1. Information We Collect",
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          Text(
            "• Name, email, phone number, and message from contact form.\n• IP and browser details (if applicable).",
          ),
          const SizedBox(height: 10),
          Text(
            "2. How We Use Your Information",
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          Text(
            "• To respond to your inquiries.\n• To provide quotes and updates.\n• To improve our services.",
          ),
          const SizedBox(height: 10),
          Text(
            "3. Data Security",
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          Text(
            "We safeguard your information with standard security practices.",
          ),
          const SizedBox(height: 10),
          Text(
            "4. Data Sharing",
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          Text(
            "We do not sell or rent your data. Trusted service providers may help deliver services.",
          ),
          const SizedBox(height: 10),
          Text("5. Your Rights", style: TextStyle(fontWeight: FontWeight.bold)),
          Text("You may request access, correction, or deletion of your data."),
          const SizedBox(height: 10),
          Text("6. Contact", style: TextStyle(fontWeight: FontWeight.bold)),
          Text(
            "Email: Info@nje.com\nPhone: +91 9666111105\nHyderabad, Telangana, India",
          ),
        ],
      ),
    );
  }
}

class SocialIcon extends StatelessWidget {
  final IconData icon;
  final String link;

  const SocialIcon({super.key, required this.icon, required this.link});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        // Open social media link
      },
      child: MouseRegion(
        onEnter: (_) => _onHover(true, context),
        onExit: (_) => _onHover(false, context),
        child: FaIcon(icon, color: Colors.white, size: 30),
      ),
    );
  }

  // Hover effect for the social media icons
  void _onHover(bool isHovered, BuildContext context) {
    final icon = context.findRenderObject() as RenderBox?;
    if (isHovered) {
      // Scale icon up and add glow effect
      icon?.paintBounds.inflate(5.0);
    } else {
      // Reset icon back to normal
      icon?.paintBounds.inflate(-5.0);
    }
  }
}

class ContactIconsRow extends StatelessWidget {
  const ContactIconsRow({super.key});

  Future<void> _launchUrl(String url) async {
    final uri = Uri.parse(url);
    if (!await launchUrl(uri, mode: LaunchMode.externalApplication)) {
      throw Exception('Could not launch $url');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        IconButton(
          icon: Image.asset('assets/images/gmail.png', width: 32, height: 32),
          tooltip: 'Gmail',
          onPressed: () {
            _launchUrl('mailto: info@nagajyothielectricals.com');
          },
        ),
        const SizedBox(width: 16),
        IconButton(
          icon: Image.asset(
            'assets/images/linkedIn.png',
            width: 32,
            height: 32,
          ),
          tooltip: 'LinkedIn',
          onPressed: () {
            _launchUrl(
              'https://www.linkedin.com/company/naga-jyothi-electricals/?viewAsMember=true',
            );
          },
        ),
        const SizedBox(width: 16),
        IconButton(
          icon: SvgPicture.asset(
            'assets/images/twitter.svg',
            width: 32,
            height: 32,
          ),
          tooltip: 'Twitter',
          onPressed: () {
            _launchUrl('https://twitter.com/yourusername');
          },
        ),
      ],
    );
  }
}
