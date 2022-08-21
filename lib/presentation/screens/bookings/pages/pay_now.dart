import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class PayNowPage extends StatelessWidget {
  const PayNowPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Select Payment Mode",
          style: GoogleFonts.ubuntu(fontSize: screenWidth <= 320 ? 20 : 24),
        ),
      ),
      body: SingleChildScrollView(
        child: Row(
          children: const [Text("Online"), Text("Ready Cash")],
        ),
      ),
    );
  }
}
