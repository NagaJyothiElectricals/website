import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:njewebsite/helper/contacthelperpage.dart';
import 'package:njewebsite/widgets/drawer.dart';

class AboutUsHelperPage extends StatelessWidget {
  const AboutUsHelperPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      endDrawer: DrawerWidget(),
      appBar: AppBar(
        title: Text(
          'About Us',
          style: GoogleFonts.quicksand(
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
        flexibleSpace: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Colors.pink,
                Colors.pink,
                Colors.pinkAccent,
                Colors.pinkAccent,
              ],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
        ),
        elevation: 0,
        backgroundColor: Colors.transparent,
      ),
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 24),
              Row(
                children: [
                  Icon(Icons.electrical_services, size: 48, color: Colors.blue),
                  const SizedBox(width: 16),
                  Text(
                    'About Us',
                    style: Theme.of(context).textTheme.headlineLarge?.copyWith(
                      fontWeight: FontWeight.bold,
                      color: Colors.blue,
                    ),
                  ),
                ],
              ).animate().slideX(duration: 600.ms).fadeIn(),
              const SizedBox(height: 32),

              // Who We Are
              sectionTitle(context, 'Who We Are'),
              sectionBody(
                context,
                'We are a leading electrical contracting company serving over 60 major clients across the pharmaceutical, manufacturing, and infrastructure sectors in India. Our team delivers reliable, high-quality electrical solutions with a focus on safety and efficiency.',
              ),

              // Company History
              sectionTitle(context, 'Our Journey'),
              sectionBody(
                context,
                'Founded in 2010, we started as a small team of passionate engineers. Over the years, we have grown into a national player, completing over 300 projects across India. Our journey reflects our commitment to continuous improvement and customer satisfaction.',
              ),

              // Timeline / Milestones
              sectionTitle(context, 'Company Milestones'),
              sectionBody(
                context,
                '• 2010: Company founded\n • 2011: Reached first 10 industrial clients\n • 2017: Completed 100th project\n • 2021: Expanded PAN India\n • 2024: Launched Automation & Energy division',
              ),

              // Our Mission
              sectionTitle(context, 'Our Mission'),
              sectionBody(
                context,
                'To empower industries with dependable and innovative electrical systems while ensuring environmental and workplace safety.',
              ),

              // Our Vision
              sectionTitle(context, 'Our Vision'),
              sectionBody(
                context,
                'To become India’s most trusted electrical contractor by continually innovating and maintaining the highest standards of quality and service.',
              ),

              // Our Values
              sectionTitle(context, 'Our Core Values'),
              sectionBody(
                context,
                '• Integrity and transparency in all operations.\n • Commitment to safety and quality.\n • Continuous improvement and innovation.\n • Customer-centric approach.\n • Sustainable practices.',
              ),

              // Services Offered
              sectionTitle(context, 'Services We Offer'),
              sectionBody(
                context,
                '• Industrial Electrical Installations\n• HT/LT Cabling and Panel Work\n• Annual Maintenance Contracts (AMC)\n• Power Audits and Safety Checks\n• Automation and Control Systems\n• Energy Management Solutions\n• Turnkey Project Execution',
              ),

              // Our Clients
              sectionTitle(context, 'Our Clients'),
              Wrap(
                spacing: 12,
                runSpacing: 12,
                children:
                    [
                          'Hetero Labs',
                          'Zenara Pharma',
                          'Puzzolana Machinery',
                          'Azista Bhutan',
                          'Lee Pharma',

                          'And many more...',
                        ]
                        .map(
                          (client) => Chip(
                            label: Text(client),
                            backgroundColor: Colors.blue.shade50,
                          ),
                        )
                        .toList(),
              ).animate().fadeIn(duration: 500.ms, delay: 300.ms),
              const SizedBox(height: 32),

              // Why Choose Us
              sectionTitle(context, 'Why Choose Us'),
              sectionBody(
                context,
                '• Over 15 years of industry experience\n• Trusted by 60+ large-scale clients\n• Skilled team of certified engineers and technicians\n• 24/7 customer support\n• On-time project delivery with zero compromise on quality\n• PAN India service network\n• Cutting-edge tools and technologies',
              ),

              // Meet the Team
              sectionTitle(context, 'Meet Our Leadership'),
              teamCard(
                'Srinivasa Reddy Movva',
                'Founder & CEO',
                'An electrical engineering  with 20+ years of experience, Srinivasa Reddy leads the company with vision and expertise.',
              ),
              teamCard(
                'Naga Jyothi',
                'Operations Head',
                'Naga Jyothi ensures smooth execution of projects and quality assurance.',
              ),
              teamCard(
                'Sai Hrithik Reddy Movva',
                'Managing Director',
                'Hrithik Reddy is the brain behind our most complex and high-voltage installations, ensuring technical excellence on every site and connections with overseas clients.',
              ),

              // Our Impact
              sectionTitle(context, 'Our Impact'),
              sectionBody(
                context,
                'Over 100 MW of electrical installations completed.\nHelped reduce client energy costs by up to 30% through automation and audits.\nSupported over 500+ jobs across regions.',
              ),

              // Career Opportunities
              sectionTitle(context, 'Careers at Our Company'),
              sectionBody(
                context,
                'We are always looking for talented engineers, technicians, and professionals to join our growing team. Work with us to build the electrical backbone of Indian industries.',
              ),

              // CSR / Community Involvement
              sectionTitle(context, 'Corporate Social Responsibility'),
              sectionBody(
                context,
                '• Electrified 3+ remote villages\n• Sponsored vocational training for 20+ youth\n• Conducted safety workshops in government schools\n• Support internship programs for engineering colleges',
              ),

              // Stats
              sectionTitle(context, 'Our Numbers Speak'),
              sectionBody(
                context,
                '• 100+ Projects Completed\n• 100 MW+ Installed Capacity\n• 60+ Enterprise Clients\n• 50+ Jobs Created\n• 12% Avg. Energy Savings for Clients',
              ),

              const SizedBox(height: 48),

              // Contact Us Button
              Center(
                child:
                    ElevatedButton(
                      onPressed: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (_) => ContactHelperPage(),
                          ),
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.green,
                        padding: const EdgeInsets.symmetric(
                          horizontal: 32,
                          vertical: 16,
                        ),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                      child: const Text(
                        'Contact Us',
                        style: TextStyle(fontSize: 18, color: Colors.white),
                      ),
                    ).animate().scale(duration: 400.ms).fadeIn(),
              ),
              const SizedBox(height: 60),
            ],
          ),
        ),
      ),
    );
  }

  Widget sectionTitle(BuildContext context, String title) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 32),
        Text(
          title,
          style: Theme.of(context).textTheme.headlineSmall?.copyWith(
            color: Colors.black87,
            fontWeight: FontWeight.bold,
          ),
        ).animate().fadeIn(duration: 500.ms),
        const SizedBox(height: 16),
      ],
    );
  }

  Widget sectionBody(BuildContext context, String content) {
    return Text(
      content,
      style: Theme.of(context).textTheme.bodyLarge,
    ).animate().fadeIn(duration: 500.ms);
  }

  Widget teamCard(String name, String role, String bio) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 12),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.grey.shade100,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.shade300,
            blurRadius: 6,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CircleAvatar(
            radius: 30,
            backgroundColor: Colors.blue.shade200,
            child: Text(
              name[0],
              style: const TextStyle(fontSize: 24, color: Colors.white),
            ),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  name,
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(role, style: const TextStyle(color: Colors.grey)),
                const SizedBox(height: 8),
                Text(bio),
              ],
            ),
          ),
        ],
      ),
    ).animate().fadeIn(duration: 500.ms);
  }
}
