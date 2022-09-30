import 'package:flutter/material.dart';
import 'package:spark/controllers/vehicleController.dart';
import 'package:spark/global_uses/constants.dart';
import 'package:spark/models/vehicle.dart';
import 'package:get/get.dart';

class ViewAgeScreen extends StatefulWidget {
  @override
  _ViewAgeScreenState createState() => _ViewAgeScreenState();
}

class _ViewAgeScreenState extends State<ViewAgeScreen> {
  final vehicleController = Get.put(VehicleController());

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    WidgetsBinding.instance!.addPostFrameCallback((_) {
      vehicleController.fetch();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: Container(
      color: Colors.red,
      child: Padding(
      padding: const EdgeInsets.only(top: 12.0, left: 100.0, right: 100.0),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
            minimumSize: const Size(100.0, 50.0),
            primary: kBrown,
            elevation: 0.0,
            padding: const EdgeInsets.symmetric(vertical: 2.0, horizontal: 8.0),
            shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(40.0)))),
        child: const Text('SIGN UP',
            style: TextStyle(
                color: kWhite,
                letterSpacing: 1.0,
                fontSize: 18.0,
                fontWeight: FontWeight.w500)),
        onPressed: () async {}
      ),
    ),
    ));
  }
}

class VehicleCard extends StatelessWidget {
  final Vehicle vehicle;
  const VehicleCard({required this.vehicle});
  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        padding: EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(Radius.circular(8)),
          boxShadow: <BoxShadow>[
            BoxShadow(
                color: Colors.grey.withOpacity(0.2),
                offset: Offset(1.1, 1.1),
                blurRadius: 10.0),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  'Name',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      // fontFamily: AppTheme.fontName,
                      fontWeight: FontWeight.w500,
                      fontSize: 16,
                      letterSpacing: -0.1,
                      color: Colors.black87),
                ),
                Text(
                  '${vehicle.name}',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 28,
                    color: Colors.black,
                  ),
                )
              ],
            ),
            SizedBox(
              height: 10,
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  'Year',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      // fontFamily: AppTheme.fontName,
                      fontWeight: FontWeight.w500,
                      fontSize: 16,
                      letterSpacing: -0.1,
                      color: Colors.black87),
                ),
                Text(
                  '${vehicle.year}',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    // fontWeight: FontWeight.w600,
                    fontSize: 12,
                    color: Colors.black87,
                  ),
                )
              ],
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Container(
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
                    child: Image(image: NetworkImage(vehicle.image1)),
                  ),
                ),
                Container(
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
                    child: Image(
                      image: NetworkImage(vehicle.image2),
                      fit: BoxFit.cover,
                    ),
                  ),
                )
              ],
            ),
          ],
        ));
  }
}
