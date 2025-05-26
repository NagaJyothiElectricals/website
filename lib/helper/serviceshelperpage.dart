import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:njewebsite/widgets/drawer.dart';
import 'package:njewebsite/widgets/requestquote.dart';

class ServicesHelperPage extends StatefulWidget {
  const ServicesHelperPage({super.key});

  @override
  State<ServicesHelperPage> createState() => _ServicesHelperPageState();
}

class _ServicesHelperPageState extends State<ServicesHelperPage> {
  @override
  Widget build(BuildContext context) {
    final bool isWide = MediaQuery.of(context).size.width > 800;
    return Scaffold(
      endDrawer: DrawerWidget(),
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
        flexibleSpace: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Colors.orange,
                Colors.orange,
                Colors.orangeAccent,
                Colors.orangeAccent,
              ],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
        ),
        elevation: 0,
        backgroundColor: Colors.transparent, // Makes sure gradient is visible
        title: Text(
          'Our Services',
          style: GoogleFonts.quicksand(
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 30),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Our Services",
              style: TextStyle(
                fontSize: isWide ? 40 : 32,
                fontWeight: FontWeight.bold,
                color: Colors.blue.shade900,
              ),
            ).animate().fadeIn().slideY(begin: 0.2),
            const SizedBox(height: 10),
            Text(
              "Delivering expert electrical contracting solutions across industries.",
              style: TextStyle(fontSize: 18, color: Colors.blueGrey.shade700),
            ).animate().fadeIn(delay: 300.ms),
            const SizedBox(height: 40),
            Wrap(
              spacing: 20,
              runSpacing: 20,
              children:
                  services
                      .map(
                        (service) => ServiceCard(
                          service: service,
                          width: isWide ? 280 : double.infinity,
                        ),
                      )
                      .toList(),
            ),
            const SizedBox(height: 50),

            // Why Choose Us
            Text(
              "Why Choose Us?",
              style: TextStyle(
                fontSize: isWide ? 36 : 28,
                fontWeight: FontWeight.bold,
                color: Colors.blue.shade900,
              ),
            ).animate().fadeIn().slideY(begin: 0.3),
            const SizedBox(height: 20),
            Wrap(
              spacing: 20,
              runSpacing: 20,
              children: [
                FeatureTile(
                  icon: Icons.security,
                  title: "Safety First",
                  description: "We follow all safety codes and standards.",
                ),
                FeatureTile(
                  icon: Icons.flash_on,
                  title: "Fast Response",
                  description: "Quick turnarounds and efficient execution.",
                ),
                FeatureTile(
                  icon: Icons.thumb_up,
                  title: "Trusted by 60+ Clients",
                  description: "Reputed companies across pharma and infra.",
                ),
                FeatureTile(
                  icon: Icons.handshake,
                  title: "Turnkey Expertise",
                  description: "Design to execution handled end-to-end.",
                ),
              ],
            ).animate().fadeIn(delay: 500.ms),
            const SizedBox(height: 50),
            const SizedBox(height: 50),

            // Components
            Text(
              "Reputed Vendors Components",
              style: TextStyle(
                fontSize: isWide ? 36 : 28,
                fontWeight: FontWeight.bold,
                color: Colors.blue.shade900,
              ),
            ).animate().fadeIn().slideY(begin: 0.3),
            const SizedBox(height: 20),
            Wrap(
              spacing: 20,
              runSpacing: 20,
              children: [
                Container(
                  width: 280,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(18),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.shade300,
                        blurRadius: 8,
                        offset: const Offset(0, 4),
                      ),
                    ],
                  ),
                  child: Column(
                    children: [
                      Image.asset(
                        'assets/images/Siemenslogo.jpg',
                        fit: BoxFit.fill,
                        height: 140,
                      ),
                      Padding(
                        padding: EdgeInsets.all(10.0),
                        child: Column(
                          children: [
                            Text('SIEMENS'),
                            Text('Leading Industrial Components'),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  width: 280,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(18),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.shade300,
                        blurRadius: 8,
                        offset: const Offset(0, 4),
                      ),
                    ],
                  ),
                  child: Column(
                    children: [
                      Image.asset(
                        'assets/images/LT.jpeg',
                        fit: BoxFit.fill,
                        height: 140,
                      ),
                      Padding(
                        padding: EdgeInsets.all(10.0),
                        child: Column(
                          children: [
                            Text('L & T'),
                            Text('Leading Industrial Components'),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  width: 280,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(18),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.shade300,
                        blurRadius: 8,
                        offset: const Offset(0, 4),
                      ),
                    ],
                  ),
                  child: Column(
                    children: [
                      Image.asset(
                        'assets/images/abb.png',
                        fit: BoxFit.fill,
                        height: 140,
                      ),
                      Padding(
                        padding: EdgeInsets.all(10.0),
                        child: Column(
                          children: [
                            Text('ABB'),
                            Text('Leading Industrial Components'),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  width: 280,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(18),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.shade300,
                        blurRadius: 8,
                        offset: const Offset(0, 4),
                      ),
                    ],
                  ),
                  child: Column(
                    children: [
                      Image.asset(
                        'assets/images/sch.jpeg',
                        fit: BoxFit.fill,
                        height: 140,
                      ),
                      Padding(
                        padding: EdgeInsets.all(10.0),
                        child: Column(
                          children: [
                            Text('SCHNEIDER'),
                            Text('Leading Industrial Components'),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ).animate().fadeIn(delay: 500.ms),
            const SizedBox(height: 50),

            // Call to Action
            Center(
              child: Container(
                padding: const EdgeInsets.all(32),
                decoration: BoxDecoration(
                  color: Colors.blue.shade800,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Center(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Center(
                        child:
                            const Text(
                              "Need Electrical Experts for Your Project?",
                              style: TextStyle(
                                fontSize: 24,
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                              ),
                            ).animate().fadeIn(),
                      ),
                      const SizedBox(height: 12),
                      Center(
                        child: const Text(
                          "Request a callback or quote and we'll get in touch within 24 hours.",
                          style: TextStyle(color: Colors.white70),
                        ).animate().fadeIn(delay: 200.ms),
                      ),
                      const SizedBox(height: 20),
                      Center(
                        child: ElevatedButton(
                          onPressed: () {
                            showDialog(
                              context: context,
                              builder:
                                  (context) => AlertDialog(
                                    title: const Text('Request a Quote'),
                                    content: SizedBox(
                                      width: 500, // Set width for web
                                      child: RequestQuoteForm(),
                                    ),
                                    actions: [
                                      TextButton(
                                        onPressed:
                                            () => Navigator.of(context).pop(),
                                        child: const Text('Close'),
                                      ),
                                    ],
                                  ),
                            );
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.yellow.shade600,
                            padding: const EdgeInsets.symmetric(
                              horizontal: 24,
                              vertical: 14,
                            ),
                          ),
                          child: const Text(
                            "Request Quote",
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ).animate().fadeIn(delay: 400.ms),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            const SizedBox(height: 60),
          ],
        ),
      ),
    );
  }
}

class ServiceCard extends StatelessWidget {
  final Service service;
  final double width;
  const ServiceCard({super.key, required this.service, required this.width});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(18),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.shade300,
            blurRadius: 8,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        children: [
          Image.asset(
            service.image,
            height: 240,
            width: double.infinity,
            fit: BoxFit.cover,
          ),
          Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Icon(service.icon, size: 36, color: Colors.blue.shade900),
                const SizedBox(height: 12),
                Text(
                  service.title,
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 6),
                Text(
                  service.description,
                  style: TextStyle(color: Colors.grey.shade700),
                ),
                const SizedBox(height: 6),
                ...service.bullets.map(
                  (b) => Row(
                    children: [
                      const Icon(
                        Icons.check_circle_outline,
                        size: 16,
                        color: Colors.green,
                      ),
                      const SizedBox(width: 6),
                      Expanded(
                        child: Text(b, style: const TextStyle(fontSize: 13)),
                      ),
                    ],
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

class FeatureTile extends StatelessWidget {
  final IconData icon;
  final String title;
  final String description;
  const FeatureTile({
    super.key,
    required this.icon,
    required this.title,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 280,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(18),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.shade300,
            blurRadius: 8,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        children: [
          Icon(icon, size: 36, color: Colors.blue.shade900),
          const SizedBox(height: 10),
          Text(
            title,
            style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 6),
          Text(
            description,
            textAlign: TextAlign.center,
            style: TextStyle(color: Colors.grey.shade700),
          ),
        ],
      ),
    );
  }
}

class Service {
  final String title;
  final String description;
  final IconData icon;
  final String image;
  final List<String> bullets;

  Service({
    required this.title,
    required this.description,
    required this.icon,
    required this.image,
    required this.bullets,
  });
}

final List<Service> services = [
  Service(
    title: "Industrial Wiring",
    description: "Robust wiring solutions for industrial units.",
    icon: Icons.electrical_services,
    image: "assets/images/pic21.jpg",
    bullets: ["Heavy-duty cables", "Circuit protection", "Load testing"],
  ),
  Service(
    title: "HT/LT Installation",
    description: "Complete HT/LT panels and switchgear setup.",
    icon: Icons.power,
    image: "assets/images/pic17.jpg",
    bullets: ["HT panels", "Transformer setup", "Relay coordination"],
  ),
  Service(
    title: "Automation & Control",
    description: "Automating processes with precision.",
    icon: Icons.settings_remote,
    image: "assets/images/pic4.jpg",
    bullets: ["PLC integration", "SCADA setup", "Remote monitoring"],
  ),
  Service(
    title: "Annual Maintenance",
    description: "Reliable AMC for uninterrupted operations.",
    icon: Icons.build,
    image: "assets/images/pic6.jpg",
    bullets: ["Preventive checks", "Fault diagnosis", "Quick repairs"],
  ),
];
