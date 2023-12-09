import 'dart:convert';
import 'dart:io';  // Add this import for File class
import 'package:flutter/material.dart';
import 'package:file_picker/file_picker.dart';
import 'package:http/http.dart' as http;

class CVCorrector extends StatefulWidget {
  @override
  _CVCorrectorState createState() => _CVCorrectorState();
}

class _CVCorrectorState extends State<CVCorrector> {
  FilePickerResult cvFile;
  String correctedCV;

  Future<void> uploadCV() async {
    cvFile = await FilePicker.platform.pickFiles(allowMultiple: false);

    if (cvFile == null) {
      return;
    }

    File file = File(cvFile.files.first.path);

    var response = await http.post(
      'https://example.com/api/correct-cv',
      body: await file.readAsBytes(),
    );

    if (response.statusCode == 200) {
      correctedCV = jsonDecode(response.body)['correctedCV'];
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
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text('Upload your CV and we will correct it for you.'),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: uploadCV,
              child: Text('Upload CV'),
            ),
            SizedBox(height: 20),
            if (correctedCV != null)
              Text(correctedCV),
          ],
        ),
      ),
    );
  }
}
