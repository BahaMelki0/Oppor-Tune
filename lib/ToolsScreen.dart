import 'package:flutter/material.dart';
import 'package:biblio/Resouces/Resources.dart';
import 'package:biblio/Cv_generator.dart';
import 'package:biblio/Cv_corrector.dart';




class ToolsScreen extends StatefulWidget {
  const ToolsScreen({super.key});

  @override
  State<ToolsScreen> createState() => _ToolsScreenState();
}

class _ToolsScreenState extends State<ToolsScreen> {
  int _currentIndex = 2;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('TOOLS'),
        elevation: 6,
      ),
      body: Column(
        children: [
          SizedBox(height:10),
          Center(
            child: Text(
              'Tools',
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
          ),
          SizedBox(height:10),
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  padding: EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      IconContainer(
                        text: 'CV generator',
                        containerColor:Color(0xFF84B6E6),

                        icon: Icons.picture_as_pdf,
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => CvGenerator()),
                          );
                        },
                      ),
                      SizedBox( width:12),
                      IconContainer(
                        text: 'Resources',
                        containerColor:Color(0xFF51A1EE),
                        icon: Icons.auto_awesome_motion,
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => ArticleList()),
                          );
                        },
                      ),
                    ],
                  ),
                ),
                Container(
                  //auto_fix_high
                  padding: EdgeInsets.all(2.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      IconContainer(
                        text: 'CV corrector',
                        containerColor: Color(0xFF51A1EE),
                        icon: Icons.build_rounded,
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) =>CvCorrector()),
                          );
                        },
                      ),
                      SizedBox( width:12),
                      IconContainer(
                        text: 'Interviews',
                        containerColor:Color(0xFF84B6E6),
                        icon: Icons.personal_video_outlined, // Replace with your icon
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => ArticleList()),
                          );
                        },
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: Colors.indigo[700],
        unselectedItemColor: Colors.black45,
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.article),
            label: 'Blog',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.build),
            label: 'Tools',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
        ],
      ),
    );
  }
}

class IconContainer extends StatelessWidget {
  final IconData icon;
  final VoidCallback onPressed;
  final String text;
  final Color containerColor;

  IconContainer({
    required this.icon,
    required this.onPressed,
    required this.text,
    required this.containerColor,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 140.0,
      height: 180.0,
      decoration: BoxDecoration(
        shape: BoxShape.rectangle,
        borderRadius: BorderRadius.circular(12.0),
        color: containerColor,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          IconButton(
            icon: Icon(icon, size: 50.0, color: Colors.black),
            onPressed: onPressed,
          ),
          SizedBox(height: 8.0),
          Text(
            text,
            style: TextStyle(
              color: Colors.black,
              fontSize: 16.0,
            ),
          ),
        ],
      ),
    );
  }
}


