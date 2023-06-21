import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class PrescriptionPage extends StatefulWidget {
  final String patientName;
  final String patientAge;
  final String patientGender;

  PrescriptionPage({
    required this.patientName,
    required this.patientAge,
    required this.patientGender,
  });

  @override
  _PrescriptionPageState createState() => _PrescriptionPageState();
}

class _PrescriptionPageState extends State<PrescriptionPage> {
  late TextEditingController prescriptionController;
  String prescriptionText = '';
  File? prescriptionImage;

  @override
  void initState() {
    super.initState();
    prescriptionController = TextEditingController();
  }

  @override
  void dispose() {
    prescriptionController.dispose();
    super.dispose();
  }

  Future<void> _addPrescriptionPicture() async {
    final pickedImage =
        await ImagePicker().pickImage(source: ImageSource.gallery);
    if (pickedImage != null) {
      setState(() {
        prescriptionImage = File(pickedImage.path);
      });
      // Implement logic to handle the picked image (e.g., save it to a file, upload to a server, etc.)
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Prescription'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Patient Details:',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 8.0),
              Text('Name: ${widget.patientName}'),
              Text('Age: ${widget.patientAge}'),
              Text('Gender: ${widget.patientGender}'),
              SizedBox(height: 16.0),
              TextField(
                maxLines: 6,
                controller: prescriptionController,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Write your prescription here',
                ),
              ),
              SizedBox(height: 16.0),
              ElevatedButton(
                onPressed: _addPrescriptionPicture,
                child: Text('Add Prescription Picture'),
              ),
              SizedBox(height: 16.0),
              if (prescriptionImage != null) ...[
                Text(
                  'Prescription Picture:',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 8.0),
                Image.file(
                  prescriptionImage!,
                  width: 200,
                  height: 200,
                ),
              ],
              SizedBox(height: 16.0),
              ElevatedButton(
                onPressed: () {
                  setState(() {
                    prescriptionText = prescriptionController.text;
                  });
                  // Implement logic to save prescriptionText and prescriptionImage
                },
                child: Text('Save Prescription'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
