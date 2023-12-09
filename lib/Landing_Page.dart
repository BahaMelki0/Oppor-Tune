import 'package:flutter/material.dart';

class FirstPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Background with Gradient Overlay
          Container(
            color: Colors.white,
            child: Stack(
              children: [
                // Your other widgets
              ],
            ),
          ),
          Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [Colors.transparent, Colors.black.withOpacity(0.8)],
              ),
            ),
          ),
          // Logo and Text
          Positioned(
            top: 150.0,
            left: 20.0,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Logo
                Image.asset(
                  "lib/assets/Asset1.jpg",
                  height: 100.0,
                ),
                SizedBox(height: 20.0),
                // Text
                Text(
                  "Find Your",
                  style: TextStyle(
                    color: Colors.blueAccent,
                    fontSize: 32.0,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 1.2,
                    shadows: [
                      Shadow(
                        color: Colors.black,
                        offset: Offset(1, 1),
                        blurRadius: 2,
                      ),
                    ],
                  ),
                ),
                Text(
                  "Dream Job",
                  style: TextStyle(
                    color: Colors.pinkAccent,
                    fontSize: 32.0,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 1.2,
                    shadows: [
                      Shadow(
                        color: Colors.black,
                        offset: Offset(1, 1),
                        blurRadius: 2,
                      ),
                    ],
                  ),
                ),
                Text(
                  "Here !",
                  style: TextStyle(
                    color: Colors.blueAccent,
                    fontSize: 32.0,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 1.2,
                    shadows: [
                      Shadow(
                        color: Colors.black,
                        offset: Offset(1, 1),
                        blurRadius: 2,
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 20.0),
                Text(
                  "Explore all the most exciting job roles\nbased on your interest and study major.",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18.0,
                    letterSpacing: 1.2,
                  ),
                  textAlign: TextAlign.left,
                ),
              ],
            ),
          ),
          // Button
          Positioned(
            bottom: 40.0,
            right: 20.0,
            child: FloatingActionButton(
              onPressed: () {
                // Navigate to the next page
                Navigator.pushNamed(context, '/generate_cv');
              },
              child: Icon(Icons.arrow_forward),
              backgroundColor: Colors.blueAccent,
              elevation: 5.0,
              highlightElevation: 10.0,
            ),
          ),
        ],
      ),
    );
  }
}
