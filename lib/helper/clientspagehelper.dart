import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:njewebsite/pages/clientspage.dart';
import 'package:njewebsite/widgets/drawer.dart';

class ClientsPageHelper extends StatefulWidget {
  const ClientsPageHelper({super.key});

  @override
  State<ClientsPageHelper> createState() => _ClientsPageHelperState();
}

class _ClientsPageHelperState extends State<ClientsPageHelper> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Our Clients',
          style: GoogleFonts.quicksand(
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
        flexibleSpace: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Colors.red,
                Colors.red,
                Colors.redAccent,
                Colors.redAccent,
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
      body: SingleChildScrollView(child: ClientsPage()),
    );
  }
}
