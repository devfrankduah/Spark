import 'dart:io';

import 'package:flutter/material.dart';
import 'package:spark/controllers/vehicleController.dart';
import 'package:spark/frontend/auth_screens/login.dart';
import 'package:spark/widgets/loading_button.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:spark/frontend/auth_screens/sign_up.dart';

import '../../global_uses/alert.dart';

class AddPhotoScreen extends StatefulWidget {
  @override
  _AddPhotoScreenState createState() => _AddPhotoScreenState();
}

class _AddPhotoScreenState extends State<AddPhotoScreen> {
  final vehicleController = Get.put(VehicleController());

  @override
  void initState() {
    // TODO: implement initState
    vehicleController.clearController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final node = FocusScope.of(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('Verification'),
        backgroundColor: Colors.amber,
      ),
      body: Container(
        child: SingleChildScrollView(
          padding: EdgeInsets.symmetric(vertical: 20, horizontal: 20),
          child: Form(
            key: vehicleController.formKey,
            autovalidateMode: AutovalidateMode.disabled,
            child: Column(
              children: [
                SizedBox(height: 40),
                TextFormField(
                  keyboardType: TextInputType.name,
                  controller: vehicleController.name,
                  onEditingComplete: () => node.nextFocus(),
                  validator: (String? value) {
                    if (value!.isEmpty) {
                      return 'This field is required';
                    }
                    return null;
                  },
                  decoration: InputDecoration(
                    labelText: "Card Type",
                  ),
                ),
                SizedBox(height: 10),
                TextFormField(
                  keyboardType: TextInputType.number,
                  controller: vehicleController.year,
                  onEditingComplete: () => node.nextFocus(),
                  validator: (String? value) {
                    if (value!.isEmpty) {
                      return 'This field is required';
                    }
                    return null;
                  },
                  decoration: InputDecoration(
                    labelText: "Year",
                  ),
                ),
                SizedBox(height: 10),
                GetBuilder<VehicleController>(
                  builder: (_c) => Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      InkWell(
                        child: Container(
                          decoration: BoxDecoration(
                            boxShadow: <BoxShadow>[
                              BoxShadow(
                                color: Colors.grey.withOpacity(0.3),
                                blurRadius: 40,
                              ),
                            ],
                          ),
                          child: SizedBox(
                            height: 115,
                            width: 115,
                            child: Stack(
                              clipBehavior: Clip.none,
                              fit: StackFit.expand,
                              children: [
                                Image(
                                  image: vehicleController.pickedFile1 != null
                                      ? FileImage(
                                          File(vehicleController
                                              .pickedFile1!.path),
                                        )
                                      : AssetImage('assets/images/add_pic.png')
                                          as ImageProvider,
                                  fit: BoxFit.cover,
                                ),
                              ],
                            ),
                          ),
                        ),
                        onTap: () {
                          vehicleController.selectImage1(ImageSource.camera);
                        },
                      ),
                      InkWell(
                        child: Container(
                          decoration: BoxDecoration(
                            boxShadow: <BoxShadow>[
                              BoxShadow(
                                color: Colors.grey.withOpacity(0.3),
                                blurRadius: 40,
                              ),
                            ],
                          ),
                          child: SizedBox(
                            height: 115,
                            width: 115,
                            child: Stack(
                              clipBehavior: Clip.none,
                              fit: StackFit.expand,
                              children: [
                                Image(
                                  image: vehicleController.pickedFile2 != null
                                      ? FileImage(
                                          File(vehicleController
                                              .pickedFile2!.path),
                                        )
                                      : AssetImage(
                                              'assets/images/no image.jpeg')
                                          as ImageProvider,
                                  fit: BoxFit.cover,
                                ),
                              ],
                            ),
                          ),
                        ),
                        onTap: () {
                          vehicleController.selectImage2(ImageSource.gallery);
                        },
                      )
                    ],
                  ),
                ),
                SizedBox(height: 30),
                Obx(() {
                  if (vehicleController.isLoading.value)
                    return LoadingButton(
                      onClick: () async {},
                      color: Colors.green,
                      childWidget: Center(
                        child: CircularProgressIndicator(
                          backgroundColor: Colors.white,
                        ),
                      ),
                    );
                  else
                    return LoadingButton(
                      onClick: () async {
                        vehicleController.create();
                        //alert(title: 'Age limit exceeded', context: context);
                        alert(title: 'Success', context: context);

                        Navigator.pushReplacement(context,
                            MaterialPageRoute(builder: (_) => LoginPage()));
                      },
                      color: Color.fromARGB(255, 250, 147, 20),
                      childWidget: Center(
                          child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Continue',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 18,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ],
                      )),
                    );
                }),
                SizedBox(height: 10),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
