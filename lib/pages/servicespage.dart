// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:google_fonts/google_fonts.dart';

class ServicesPage extends StatefulWidget {
  const ServicesPage({super.key});

  @override
  State<ServicesPage> createState() => _ServicesPageState();
}

class _ServicesPageState extends State<ServicesPage> {
  final List<Service> services = [
    Service(
      icon: Icons.settings_input_component,
      title: 'Custom LT Panels',
      description:
          'MCC, PCC, APFC, PLC, Drive, Soft Starter Panels built to spec.',
      color: Colors.deepPurpleAccent,
    ),
    Service(
      icon: Icons.developer_board,
      title: 'Control & Automation',
      description: 'PLC-based automation panels and console boards.',
      color: Colors.blueAccent,
    ),
    Service(
      icon: Icons.lightbulb_outline,
      title: 'Lighting & Cable Design',
      description: 'Lighting circuits, cable routing, and earth pit layout.',
      color: Colors.amber[700]!,
    ),
    Service(
      icon: Icons.electrical_services,
      title: 'Erection & Commissioning',
      description: 'Expert panel installation and cable laying services.',
      color: Colors.green[700]!,
    ),
    Service(
      icon: Icons.router,
      title: 'Bus Ducts & Cable Trays',
      description: 'Non-segregated bus ducts, trays for organized cabling.',
      color: Colors.indigo[700]!,
    ),
    Service(
      icon: Icons.design_services,
      title: 'Project Design & Consultancy',
      description: 'Complete low tension electrical system design.',
      color: Colors.orange[800]!,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;

    int crossAxisCount = screenWidth > 800 ? 3 : (screenWidth > 500 ? 2 : 1);

    return Container(
      height: screenHeight * 0.9,
      width: screenWidth,
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 20.0),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [Colors.blueGrey.shade50, Colors.white],
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Centered Heading Section with Google Font
          Center(
            child: Text(
              'Our Expertise',
              style: GoogleFonts.poppins(
                fontSize: 36,
                fontWeight: FontWeight.bold,
                color: Colors.blueGrey[900],
              ),
            ),
          ),
          const SizedBox(height: 10),
          Center(
            child: Text(
              'Providing high-quality electrical solutions tailored to your needs.',
              style: GoogleFonts.poppins(
                fontSize: 18,
                color: Colors.blueGrey[600],
                fontWeight: FontWeight.w400,
              ),
            ),
          ),
          const SizedBox(height: 8.0),

          // Grid Section for Services
          Expanded(
            child: GridView.builder(
              itemCount: services.length,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: crossAxisCount,
                crossAxisSpacing: 20,
                mainAxisSpacing: 20,
                childAspectRatio: 3 / 2,
              ),
              itemBuilder: (context, index) {
                final service = services[index];
                return ServiceCard(
                  service: service,
                ).animate().fadeIn(duration: 500.ms, delay: (100 * index).ms);
              },
            ),
          ),
        ],
      ),
    );
  }
}

class Service {
  final IconData icon;
  final String title;
  final String description;
  final Color color;

  Service({
    required this.icon,
    required this.title,
    required this.description,
    required this.color,
  });
}

class ServiceCard extends StatelessWidget {
  final Service service;

  const ServiceCard({super.key, required this.service});

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 400),
      decoration: BoxDecoration(
        color: service.color.withOpacity(0.1),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: service.color.withOpacity(0.3), width: 1.2),
        boxShadow: [
          BoxShadow(
            color: service.color.withOpacity(0.2),
            blurRadius: 15,
            offset: const Offset(2, 4),
          ),
        ],
      ),
      padding: const EdgeInsets.all(24),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Icon(service.icon, size: 50, color: service.color),
          const SizedBox(height: 16),
          Text(
            service.title,
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: service.color,
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 12),
          Text(
            service.description,
            style: const TextStyle(fontSize: 14, color: Colors.black54),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
