import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ClientsPage extends StatefulWidget {
  const ClientsPage({super.key});

  @override
  State<ClientsPage> createState() => _ClientsPageState();
}

class _ClientsPageState extends State<ClientsPage> {
  final List<Client> clients = [
    Client(name: 'Hetero Labs', logoPath: 'images/hetero.jpg'),
    Client(name: 'Standard Seals Ltd.', logoPath: 'images/standard.jpeg'),
    Client(
      name: 'Agarvanshi Aluminium Pvt. Ltd.',
      logoPath: 'images/agarvanshi.jpeg',
    ),

    Client(name: 'Pon Pure Chem Pvt. Ltd.', logoPath: 'images/ponpure.png'),
    Client(name: 'Vertex Air Tech Pvt. Ltd.', logoPath: 'images/vertex.jpeg'),
    Client(
      name: 'Gold Fish Pharma Pvt. Ltd.',
      logoPath: 'images/goldfish.jpeg',
    ),
    Client(name: 'BJR Infra', logoPath: 'images/bjrinfra.png'),
    Client(name: 'Zenara Pharma', logoPath: 'images/Zenara.jpg'),
    Client(name: 'Pellets Pharma Pvt. Ltd.', logoPath: 'images/pellets.png'),
    Client(name: 'SIRIS Pharma Pvt. Ltd.', logoPath: 'images/siris.png'),
    Client(name: 'SRS Projects', logoPath: 'images/srs.jpg'),
    Client(name: 'Nifty Labs Pvt. Ltd.', logoPath: 'images/nifty.jpeg'),
    Client(name: 'Abhiram Infra Pvt. Ltd.', logoPath: 'images/abhiram.jpeg'),
    Client(name: 'Spear Pack Pvt. Ltd.', logoPath: 'images/spear.png'),
    Client(name: 'Puzzolana', logoPath: 'images/puzzolana.png'),
    Client(name: 'Mungi Enterprises', logoPath: 'images/mungi.jpg'),
    Client(name: 'Shree Gen Pharma Ltd.', logoPath: 'images/shreegen.jpg'),
    Client(name: 'GenX Pharma Ltd.', logoPath: 'images/genx.jpeg'),
    Client(name: 'On Top Pharma Ltd.', logoPath: 'images/ontop.png'),
    Client(name: 'Asphar Pharma Ltd.', logoPath: 'images/asphar.jpeg'),
    Client(name: 'Azista Bhutan Ltd.', logoPath: 'images/azizta.jpg'),
    Client(name: 'Analys Pharma Ltd.', logoPath: 'images/analys.png'),
    Client(name: 'Annora Pharma Pvt. Ltd.', logoPath: 'images/annora.png'),
    Client(
      name: 'Vannsh Life Science Pvt. Ltd.',
      logoPath: 'images/vannsh.png',
    ),
    Client(name: 'Clians Pharma Ltd.', logoPath: 'images/clians.jpg'),
    Client(name: 'Chemeca Drugs Pvt. Ltd.', logoPath: 'images/chemeca.png'),
    Client(name: 'Rui Laboratatires Pvt. Ltd.', logoPath: 'images/rui.jpeg'),
    Client(name: 'Saptagir Camphor Pvt. Ltd.', logoPath: 'images/saptagir.png'),
    Client(name: 'ARKTEK LABS', logoPath: 'images/arktek.png'),
    Client(name: 'LEE Pharma Pvt. Ltd.', logoPath: 'images/lee.jpg'),
    Client(name: 'Raichandani Groups', logoPath: 'images/raichandani.jpg'),
    Client(name: 'Ji Tech Pvt. Ltd.', logoPath: 'images/ji.png'),
    Client(name: 'Godavari Drugs Ltd.', logoPath: 'images/godavari.png'),
    Client(name: 'AR Life Sciences Pvt. Ltd.', logoPath: 'images/ar.png'),
    Client(
      name: 'HeteroCyclics Pvt. Ltd.',
      logoPath: 'images/heterocyclics.jpeg',
    ),
    Client(name: 'Virupaksha Organics Ltd.', logoPath: 'images/virupaksha.jpg'),
    Client(
      name: 'Kreative Oraganics Pvt. Ltd.',
      logoPath: 'images/kreative.png',
    ),
    // Client(name: 'Dr Jagath Reddy Labs', logoPath: 'assets/clients/jagath.png'),
    //Client(name: 'Kreative Organics', logoPath: 'assets/clients/kreative.png'),
    // Add more as needed
  ];

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    int crossAxisCount =
        screenWidth > 900
            ? 5
            : screenWidth > 600
            ? 4
            : 2;

    return Padding(
      padding: const EdgeInsets.all(24),
      child: Column(
        children: [
          Text(
            'Our Clients',
            style: GoogleFonts.poppins(
              fontSize: 28,
              fontWeight: FontWeight.bold,
              color: Colors.blueGrey.shade800,
            ),
          ),
          const SizedBox(height: 16),
          Text(
            'Trusted by industry leaders and innovators',
            style: GoogleFonts.poppins(fontSize: 16, color: Colors.black),
            textAlign: TextAlign.center,
          ),
          GridView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: clients.length,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: crossAxisCount,
              crossAxisSpacing: 24,
              mainAxisSpacing: 24,
              childAspectRatio: 0.8,
            ),
            itemBuilder: (context, index) {
              final client = clients[index];
              return Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(
                      8,
                    ), // optional: rounds the corners a bit
                    child: Image.asset(
                      client.logoPath,
                      width: 120,
                      height: 100,
                      fit:
                          BoxFit
                              .fill, // or BoxFit.contain depending on the image shape
                    ),
                  ),
                  const SizedBox(height: 10),
                  Text(
                    client.name,
                    textAlign: TextAlign.center,
                    style: GoogleFonts.poppins(
                      fontSize: 14,
                      color: Colors.blueGrey[700],
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              );
            },
          ),
        ],
      ),
    );
  }
}

class Client {
  final String name;
  final String logoPath;

  Client({required this.name, required this.logoPath});
}
