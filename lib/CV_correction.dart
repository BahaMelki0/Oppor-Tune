import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:file_picker/file_picker.dart';
import 'package:http/http.dart' as http;

class CVCorrector extends StatefulWidget {
  @override
  _CVCorrectorState createState() => _CVCorrectorState();
}

class _CVCorrectorState extends State<CVCorrector> {
  late FilePickerResult cvFile;
  String correctedCV = ''; // Initialize here
  bool isSubmitting = false;

  Future<void> uploadCV() async {
    setState(() {
      isSubmitting = true;
    });

    cvFile = (await FilePicker.platform.pickFiles(allowMultiple: false))!;

    if (cvFile == null) {
      setState(() {
        isSubmitting = false;
      });
      return;
    }

    File? file;

    if (cvFile != null) {
      FilePickerResult result = cvFile!;
      PlatformFile filePlatform = result.files.first;
      file = File(filePlatform.path!);
    }

    var response = await http.post(
      Uri.parse('https://enhancv.com/resources/resume-checker/'),
      body: file?.readAsBytesSync(),
    );

    if (response.statusCode == 200) {
      setState(() {
        correctedCV = jsonDecode(response.body)['correctedCV'];
      });
    } else {
      print('Error: ${response.statusCode}');
      print(response.body);
    }

    setState(() {
      isSubmitting = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'CV Corrector',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.blue, // Change the app bar color
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                'Upload your CV, and we will correct it for you.',
                style: TextStyle(
                  fontSize: 18.0,
                  fontWeight: FontWeight.bold, // Add bold font weight
                  color: Colors.blue, // Set text color
                  letterSpacing: 1.2, // Add letter spacing
                  fontStyle: FontStyle.italic, // Add italic style
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: isSubmitting ? null : uploadCV,
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      if (isSubmitting) CircularProgressIndicator(color: Colors.white),
                      if (isSubmitting) SizedBox(width: 10),
                      Text(
                        'Upload CV',
                        style: TextStyle(fontSize: 18.0),
                      ),
                    ],
                  ),
                ),
                style: ElevatedButton.styleFrom(
                  primary: Colors.blue, // Change the button color
                  onPrimary: Colors.white, // Change the text color
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                ),
              ),
              SizedBox(height: 20),
              if (correctedCV.isNotEmpty)
                AnimatedOpacity(
                  opacity: correctedCV.isNotEmpty ? 1.0 : 0.0,
                  duration: Duration(milliseconds: 500),
                  child: Container(
                    padding: EdgeInsets.all(10.0),
                    decoration: BoxDecoration(
                      color: Colors.grey[200],
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    child: Text(
                      correctedCV,
                      style: TextStyle(fontSize: 16.0),
                    ),
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
