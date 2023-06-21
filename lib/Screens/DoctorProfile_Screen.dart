import 'package:doctor_panel/Config/Colors.dart';
import 'package:doctor_panel/Widget/mytextwidget.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class DoctorProfileScreen extends StatefulWidget {
  const DoctorProfileScreen({Key? key}) : super(key: key);

  @override
  _DoctorProfileScreenState createState() => _DoctorProfileScreenState();
}

class _DoctorProfileScreenState extends State<DoctorProfileScreen> {
  List<String> timeSlots = []; // List to store time slots
  TextEditingController descriptionController = TextEditingController();
  TextEditingController experienceController = TextEditingController();
  TextEditingController specializationController = TextEditingController();
  TextEditingController ageController = TextEditingController();
  String? profileImagePath; // Variable to store the profile image path

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              GestureDetector(
                onTap: () {
                  _editProfilePicture();
                },
                child: CircleAvatar(
                  radius: 80,
                  backgroundImage: profileImagePath != null
                      ? AssetImage(profileImagePath!)
                      : null,
                  child: profileImagePath == null
                      ? Icon(Icons.person, size: 80)
                      : null,
                ),
              ),
              SizedBox(height: 16.0),
              MyTextField(
                textController: descriptionController,
                label: 'Description',
              ),
              MyTextField(
                textController: specializationController,
                label: 'Specialization',
              ),
              MyTextField(
                textController: ageController,
                label: 'Age',
              ),
              SizedBox(height: 16.0),
              Text(
                'Time Slots',
                style: TextStyle(
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 8.0),
              Wrap(
                spacing: 8.0,
                runSpacing: 8.0,
                children: timeSlots.map((slot) {
                  return Chip(
                    label: Text(slot),
                    onDeleted: () {
                      setState(() {
                        timeSlots.remove(slot);
                      });
                    },
                  );
                }).toList(),
              ),
              SizedBox(height: 16.0),
              Container(
                decoration: BoxDecoration(
                  color: blue,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: TextButton(
                  onPressed: () {
                    showDialog(
                      context: context,
                      builder: (context) => TimeSlotDialog(
                        onTimeSlotAdded: (slot) {
                          setState(() {
                            timeSlots.add(slot);
                          });
                        },
                      ),
                    );
                  },
                  child: const Text(
                    'Add Time Slot',
                    style: TextStyle(color: Colors.white, fontSize: 16),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _editProfilePicture() async {
    final ImagePicker _picker = ImagePicker();
    final XFile? image = await _picker.pickImage(source: ImageSource.gallery);
    if (image != null) {
      setState(() {
        profileImagePath = image.path;
      });
    }
  }
}

class TimeSlotDialog extends StatefulWidget {
  final Function(String) onTimeSlotAdded;

  const TimeSlotDialog({Key? key, required this.onTimeSlotAdded})
      : super(key: key);

  @override
  _TimeSlotDialogState createState() => _TimeSlotDialogState();
}

class _TimeSlotDialogState extends State<TimeSlotDialog> {
  TextEditingController timeSlotController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text('Add Time Slot'),
      content: TextField(
        controller: timeSlotController,
        decoration: InputDecoration(
          labelText: 'Time Slot',
        ),
      ),
      actions: [
        TextButton(
          onPressed: () {
            Navigator.pop(context);
          },
          child: Text('Cancel'),
        ),
        ElevatedButton(
          onPressed: () {
            String timeSlot = timeSlotController.text;
            widget.onTimeSlotAdded(timeSlot);
            Navigator.pop(context);
          },
          child: Text('Add'),
        ),
      ],
    );
  }
}
