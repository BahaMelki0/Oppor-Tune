import 'package:flutter/material.dart';

class CVGeneratorPage extends StatefulWidget {
  @override
  State<CVGeneratorPage> createState() => _CVGeneratorPageState();
}

class _CVGeneratorPageState extends State<CVGeneratorPage> {
  final _formKey = GlobalKey<FormState>();

  String _firstName = "";
  String _lastName = "";
  String _address = "";
  String _email = "";
  String _aboutMe = "";
  List<String> _degrees = [];
  List<String> _technicalSkills = [];
  List<String> _languages = [];
  bool _isSubmitting = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("CV Generator"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: ListView(
            children: [
              // First and Last Name fields in a Row
              Row(
                children: [
                  Flexible(
                    child: TextFormField(
                      decoration: InputDecoration(
                        labelText: "First Name",
                        hintText: "Enter your first name",
                        icon: Icon(Icons.person),
                      ),
                      onChanged: (value) {
                        setState(() {
                          _firstName = value;
                        });
                      },
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "First name is required.";
                        }
                        return null;
                      },
                    ),
                  ),
                  SizedBox(width: 16.0), // Add some spacing between the fields
                  Flexible(
                    child: TextFormField(
                      decoration: InputDecoration(
                        labelText: "Last Name",
                        hintText: "Enter your last name",
                        icon: Icon(Icons.person),
                      ),
                      onChanged: (value) {
                        setState(() {
                          _lastName = value;
                        });
                      },
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "Last name is required.";
                        }
                        return null;
                      },
                    ),
                  ),
                ],
              ),

              SizedBox(height: 16.0),

              TextFormField(
                decoration: InputDecoration(
                  labelText: "Address",
                  hintText: "Enter your address",
                  icon: Icon(Icons.location_on),
                ),
                onChanged: (value) {
                  setState(() {
                    _address = value;
                  });
                },
              ),
              SizedBox(height: 16.0),

              TextFormField(
                decoration: InputDecoration(
                  labelText: "Email",
                  hintText: "Enter your email",
                  icon: Icon(Icons.email),
                ),
                onChanged: (value) {
                  setState(() {
                    _email = value;
                  });
                },
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Email is required.";
                  }
                  if (!RegExp(
                    r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+",
                  ).hasMatch(value)) {
                    return "Please enter a valid email address.";
                  }
                  return null;
                },
              ),
              SizedBox(height: 16.0),

              // Languages list
              ListTile(
                title: Text("University Degrees"),
                leading: Icon(Icons.school),
              ),
              _buildDynamicList(_degrees, "Add a degree", Icons.add, "Enter the specialty and year"),
              SizedBox(height: 16.0),

              // Information about yourself
              TextFormField(
                decoration: InputDecoration(
                  labelText: "About Me",
                  hintText: "Tell us a bit about yourself...",
                  icon: Icon(Icons.info),
                ),
                onChanged: (value) {
                  setState(() {
                    _aboutMe = value;
                  });
                },
                maxLines: 3,
              ),
              SizedBox(height: 16.0),

              // Technical skills list
              ListTile(
                title: Text("Technical Skills"),
                leading: Icon(Icons.code),
              ),
              _buildDynamicList(_technicalSkills, "Add Technical Skill", Icons.add, "Enter technical skill"),

              // Languages list
              ListTile(
                title: Text("Languages"),
                leading: Icon(Icons.language),
              ),
              _buildDynamicList(_languages, "Add Language", Icons.add, "Enter language"),

              SizedBox(height: 16.0),

              // Generate CV button
              ElevatedButton(
                onPressed: _isSubmitting ? null : _submitForm,
                child: _isSubmitting
                    ? CircularProgressIndicator(
                  valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
                )
                    : Text("Generate CV"),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: Colors.indigo[700],
        unselectedItemColor: Colors.black45,
        currentIndex: 2,
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

  Widget _buildDynamicList(List<String> items, String buttonText, IconData buttonIcon, String hintText) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        for (var i = 0; i < items.length; i++)
          ListTile(
            title: Text(items[i]),
            trailing: IconButton(
              icon: Icon(Icons.remove),
              onPressed: () {
                setState(() {
                  items.removeAt(i);
                });
              },
            ),
          ),
        ListTile(
          title: TextField(
            onSubmitted: (value) {
              setState(() {
                items.add(value);
              });
            },
            decoration: InputDecoration(
              hintText: hintText,
            ),
          ),
          trailing: IconButton(
            icon: Icon(buttonIcon),
            onPressed: () {
              // Navigate to the correct_cv page before adding an item to the list
              Navigator.pushNamed(context, '/correct_cv');
              setState(() {
                items.add(""); // Add an empty string as a default value for the hint
              });
            },
          ),
        ),
      ],
    );
  }

  void _submitForm() {
    setState(() {
      _isSubmitting = true;
    });

    // Simulate processing time with a delay
    Future.delayed(Duration(seconds: 2), () {
      // Process the form data here...

      // Navigate to the correct_cv page after generating the CV
      Navigator.pushNamed(context, '/correct_cv');
    });
  }
}
