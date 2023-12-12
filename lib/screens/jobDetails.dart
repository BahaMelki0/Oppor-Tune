import 'package:flutter/material.dart';
import 'package:test/customShape.dart';

class JobDetails extends StatefulWidget {
  const JobDetails({Key? key}) : super(key: key);
  static const routeName = '/';

  @override
  _JobDetailsState createState() => _JobDetailsState();
}

class _JobDetailsState extends State<JobDetails> with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 4, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 130,
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        flexibleSpace: Column(
          children: [
            ClipPath(
              clipper: Customshape(),
              child: Container(
                height: 100,
                width: MediaQuery.of(context).size.width,
                color: const Color.fromARGB(255, 5, 68, 120),
                child: const Center(
                  child: Image(
                    image: AssetImage('assets/logo.png'),
                    width: 200.0,
                    height: 100.0,
                  ),
                ),
              ),
            ),
          ],
        ),
        bottom: TabBar(
          controller: _tabController,
          tabs: const [
            Tab(text: 'Description'),
            Tab(text: 'Requirements'),
            Tab(text: 'About'),
            Tab(text: 'Reviews'),
          ],
        ),
      ),
      body: SafeArea(
        child: TabBarView(
          controller: _tabController,
          children: [
            _buildSection("Builds and maintains websites for functionality....."),
            _buildSection("Proficiency in HTML and CSS"),
            _buildSection("About"),
            _buildSection("Reviews"),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: Colors.indigo[700],
        unselectedItemColor: Colors.black45,
        currentIndex: _tabController.index,
        onTap: (index) {
          _tabController.animateTo(index);
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
      floatingActionButton: Container(
        alignment: Alignment.bottomCenter,
        padding: const EdgeInsets.only(bottom: 20.0),
        child: ElevatedButton(
          onPressed: () {
            // Handle button press
          },
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.blue,
          ),
          child: const Text(
            'APPLY NOW',
            style: TextStyle(
              color: Colors.white,
              fontSize: 16,
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildSection(String title) {
    return Container(
      padding: const EdgeInsets.all(20),
      child: Center(
        child: Text(
          title,
          style: const TextStyle(fontSize: 18),
        ),
      ),
    );
  }
}
