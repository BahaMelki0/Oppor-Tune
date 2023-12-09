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

  Future<void> uploadCV() async {
    cvFile = (await FilePicker.platform.pickFiles(allowMultiple: false))!;

    if (cvFile == null) {
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

    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('CV Corrector App'),
        backgroundColor: Colors.blue, // Change the app bar color
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                'Upload your CV, and we will correct it for you.',
                style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: uploadCV,
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                  child: Text(
                    'Upload CV',
                    style: TextStyle(fontSize: 18.0),
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
                Text(
                  correctedCV,
                  style: TextStyle(fontSize: 16.0),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
