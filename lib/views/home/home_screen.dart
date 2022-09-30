import 'package:flutter/material.dart';
import 'package:spark/views/vehicle/add_vehicle_screen.dart';
import 'package:spark/views/vehicle/view_vehicle_screem.dart';
import 'package:spark/widgets/loading_button.dart';
import 'package:get/get.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 50),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("Multiple Image & Data"),
              SizedBox(
                height: 5,
              ),
              LoadingButton(
                onClick: () async {
                  Get.to(() => AddPhotoScreen());
                },
                color: Colors.lightGreen,
                childWidget: Center(
                    child: Padding(
                  padding: EdgeInsets.only(left: 16.0, right: 16.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Add Photo',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                )),
              ),
              SizedBox(
                height: 10,
              ),
              LoadingButton(
                onClick: () async {
                  Get.to(() => ViewVehicleScreen());
                },
                color: Colors.lightGreen,
                childWidget: Center(
                    child: Padding(
                  padding: EdgeInsets.only(left: 16.0, right: 16.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'View Vehicle',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                )),
              ),
              SizedBox(
                height: 25,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
