import 'package:doctor_panel/Config/Colors.dart';
import 'package:doctor_panel/Widget/acceptappointment.dart';
import 'package:doctor_panel/Widget/appointment.dart';
import 'package:doctor_panel/Widget/rejectedappointment.dart';
import 'package:flutter/material.dart';

class ScheduleScreen extends StatefulWidget {
  const ScheduleScreen({super.key});

  @override
  State<ScheduleScreen> createState() => _ScheduleScreenState();
}

class _ScheduleScreenState extends State<ScheduleScreen> {
  int _ButtonIndex = 0;
  final List<Widget> _scheduleWidget = [
    // upcoming widget
    Appointment(),
    //  Accepted  Appointment widget
    AcceptedAppointment(),
    // Rejected Appointment Widgets
    RejectedAppointment(),
  ];

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
        child: Padding(
      padding: EdgeInsets.only(top: 40),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 15),
            child: Text(
              "Schedule",
              style: TextStyle(
                fontSize: 32,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Container(
            padding: EdgeInsets.all(5),
            margin: EdgeInsets.symmetric(horizontal: 15),
            decoration: BoxDecoration(
              color: Color(0xFFF4F6FA),
              borderRadius: BorderRadius.circular(10),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                InkWell(
                    onTap: () {
                      setState(() {
                        _ButtonIndex = 0;
                      });
                    },
                    child: Container(
                      padding:
                          EdgeInsets.symmetric(vertical: 12, horizontal: 20),
                      decoration: BoxDecoration(
                          color: _ButtonIndex == 0 ? blue : Colors.transparent,
                          borderRadius: BorderRadius.circular(10)),
                      child: Text(
                        "Upcoming",
                        style: TextStyle(
                            color:
                                _ButtonIndex == 0 ? Colors.white : Colors.black,
                            fontSize: 16,
                            fontWeight: FontWeight.w500),
                      ),
                    )),
                InkWell(
                    onTap: () {
                      setState(() {
                        _ButtonIndex = 1;
                      });
                    },
                    child: Container(
                      padding:
                          EdgeInsets.symmetric(vertical: 12, horizontal: 20),
                      decoration: BoxDecoration(
                          color: _ButtonIndex == 1 ? blue : Colors.transparent,
                          borderRadius: BorderRadius.circular(10)),
                      child: Text(
                        "Accepted",
                        style: TextStyle(
                            color:
                                _ButtonIndex == 1 ? Colors.white : Colors.black,
                            fontSize: 16,
                            fontWeight: FontWeight.w500),
                      ),
                    )),
                InkWell(
                    onTap: () {
                      setState(() {
                        _ButtonIndex = 2;
                      });
                    },
                    child: Container(
                      padding:
                          EdgeInsets.symmetric(vertical: 12, horizontal: 20),
                      decoration: BoxDecoration(
                          color: _ButtonIndex == 2 ? blue : Colors.transparent,
                          borderRadius: BorderRadius.circular(10)),
                      child: Text(
                        "Rejected",
                        style: TextStyle(
                            color:
                                _ButtonIndex == 2 ? Colors.white : Colors.black,
                            fontSize: 16,
                            fontWeight: FontWeight.w500),
                      ),
                    )),
              ],
            ),
          ),
          SizedBox(
            height: 30,
          ),
          _scheduleWidget[_ButtonIndex]
        ],
      ),
    ));
  }
}
