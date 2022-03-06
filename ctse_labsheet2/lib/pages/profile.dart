import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Profile extends StatelessWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          "My App",
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(15.0),
            child: Image.asset(
              "assets/images/profile.png",
              width: 200,
              height: 200,
              fit: BoxFit.cover,
            ),
          ),
          const SizedBox(
            width: double.infinity,
            height: 50,
          ),
          Text(
            "Hirush Gimhan",
            style: GoogleFonts.adventPro(
              fontSize: 25,
            ),
          ),
          const Text(
            "Software Engineer",
            style: TextStyle(
                fontSize: 15,
                fontStyle: FontStyle.italic,
                color: Colors.blueAccent),
          ),
          const SizedBox(
            height: 10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
              Icon(Icons.facebook),
              SizedBox(
                width: 10,
              ),
              Icon(Icons.email),
            ],
          ),
        ],
      ),
    );
  }
}
