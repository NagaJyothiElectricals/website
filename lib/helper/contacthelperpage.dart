// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:njewebsite/pages/contactpage.dart';
import 'package:njewebsite/widgets/drawer.dart';
import 'package:url_launcher/url_launcher.dart';

class ContactHelperPage extends StatefulWidget {
  const ContactHelperPage({super.key});

  @override
  State<ContactHelperPage> createState() => _ContactHelperPageState();
}

class _ContactHelperPageState extends State<ContactHelperPage> {
  final _formKey = GlobalKey<FormState>();
  String name = '';
  String email = '';
  String contact = '';
  String message = '';
  final List<Map<String, String>> faqs = [
    {
      "question": "What types of electrical projects do you handle?",
      "answer":
          "We handle industrial, commercial, and infrastructure projects across India, especially for pharma, manufacturing, and machinery companies.",
    },
    {
      "question": "Do you offer service across India?",
      "answer":
          "Yes, we currently work with over 60+ clients across India including Hetero Labs, Zenara Pharma, and Puzzolana Machinery.",
    },
    {
      "question": "How can I get a quote for my project?",
      "answer":
          "Just fill out the contact form or call us directly. We'll schedule a site visit and send you a detailed estimate.",
    },
    {
      "question": "Do you provide annual maintenance contracts (AMCs)?",
      "answer":
          "Yes, we offer customizable AMCs for industrial and commercial electrical setups to ensure ongoing reliability and compliance.",
    },
  ];

  void launchEmail() async {
    final subject = Uri.encodeComponent("Contact Request from $name");
    final body = Uri.encodeComponent(
      "Name: $name\nContact: $contact\n$email\nMessage: $message",
    );

    final uri = Uri.parse(
      'mailto:info@nagajyothielectricals.com?subject=$subject&body=$body',
    );

    if (await canLaunchUrl(uri)) {
      await launchUrl(uri);
    } else {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text("Could not open email app")));
    }
  }

  Widget _buildMotivationalBlock(String emoji, String title, String subtitle) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(emoji, style: TextStyle(fontSize: 24)),
          SizedBox(width: 8),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                ),
                SizedBox(height: 4),
                Text(subtitle, style: TextStyle(fontSize: 14)),
              ],
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Contact Us',
          style: GoogleFonts.quicksand(
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
        flexibleSpace: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Colors.green,
                Colors.green,
                Colors.greenAccent,
                Colors.greenAccent,
              ],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
        ),
        elevation: 0,
        backgroundColor: Colors.transparent,
      ),
      endDrawer: DrawerWidget(),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Motivational Intro
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // 🧡 Friendly and Warm
                  _buildMotivationalBlock(
                    "🧡",
                    "We're here to help!",
                    "Whether you have a question, a project in mind, or just want to say hello — we'd love to hear from you.",
                  ),

                  // 💼 Professional and Inviting
                  _buildMotivationalBlock(
                    "💼",
                    "Let’s build something great together.",
                    "Reach out to our team to discuss your electrical needs. We're just a message away.",
                  ),

                  // 🔧 Industry-Aligned
                  _buildMotivationalBlock(
                    "🔧",
                    "Your power, our priority.",
                    "If you’re looking for reliable, experienced electrical contractors, you’ve come to the right place. Let’s connect and bring your project to life.",
                  ),

                  // 🛠️ Simple and Encouraging
                  _buildMotivationalBlock(
                    "🛠️",
                    "Got a question or a challenge?",
                    "Let’s talk. We're ready to deliver solutions that power your success.",
                  ),

                  SizedBox(height: 20),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      'Fill in your details we will contact you right now or with in 24 hrs!.',
                      style: GoogleFonts.quicksand(
                        fontSize: 18,
                        color: Colors.redAccent,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Card(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Form(
                        key: _formKey,
                        child: Column(
                          children: [
                            TextFormField(
                              textInputAction: TextInputAction.next,
                              keyboardType: TextInputType.name,
                              maxLines: 1,
                              decoration: InputDecoration(
                                labelText: "Enter Your Name",
                              ),
                              onSaved: (val) => name = val ?? '',
                              validator:
                                  (val) =>
                                      val == null || val.isEmpty
                                          ? "Please enter your name"
                                          : null,
                            ),
                            TextFormField(
                              textInputAction: TextInputAction.next,
                              keyboardType: TextInputType.number,
                              maxLines: 1,
                              decoration: InputDecoration(
                                labelText: "Enter Your Contact",
                              ),
                              onSaved: (val) => contact = val ?? '',
                              validator:
                                  (val) =>
                                      val == null ||
                                              val.isEmpty ||
                                              val.length < 10
                                          ? "Enter your 10 digit contact number"
                                          : null,
                            ),
                            TextFormField(
                              textInputAction: TextInputAction.next,
                              keyboardType: TextInputType.emailAddress,
                              maxLines: 1,
                              decoration: InputDecoration(
                                labelText: "Enter Your Email Id",
                              ),
                              onSaved: (val) => email = val ?? '',
                              validator:
                                  (val) =>
                                      val == null || !val.contains('@')
                                          ? "Enter valid email Id"
                                          : null,
                            ),
                            TextFormField(
                              textInputAction: TextInputAction.done,
                              keyboardType: TextInputType.multiline,
                              decoration: InputDecoration(
                                labelText: "Message us about your requirment",
                              ),
                              maxLines: 5,
                              onSaved: (val) => message = val ?? '',
                              validator:
                                  (val) =>
                                      val == null || val.isEmpty
                                          ? "Enter your requirment correctly"
                                          : null,
                            ),
                            SizedBox(height: 20),
                            ElevatedButton(
                              child: Text("Send"),
                              onPressed: () {
                                if (_formKey.currentState?.validate() ??
                                    false) {
                                  _formKey.currentState?.save();
                                  launchEmail();
                                }
                              },
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 40),
                  Divider(),
                  SizedBox(height: 10),
                  Center(
                    child: Text(
                      'You Can Reach Us Directly Here',
                      style: GoogleFonts.quicksand(
                        fontSize: 14,
                        color: Colors.redAccent,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  // Contact Info
                  Center(child: Text("📞 Phone: +91 9666111105")),
                  Center(
                    child: Text("✉️ Email: info@nagajyothielectricals.com"),
                  ),
                  Center(
                    child: Text("📍 Address: Hyderabad, Telangana, India"),
                  ),
                  ContactIconsRow(),
                  SizedBox(height: 20),
                  Divider(),
                  SizedBox(height: 20),
                  Center(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        'FAQS',
                        style: GoogleFonts.quicksand(
                          fontSize: 28,
                          color: Colors.redAccent,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                  Text("❓ Frequently Asked Questions"),
                  SizedBox(height: 10),

                  ...faqs.map(
                    (faq) => ExpansionTile(
                      title: Text(faq['question']!),
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 16.0,
                            vertical: 8.0,
                          ),
                          child: Text(faq['answer']!),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
