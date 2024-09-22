import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/controller/current_location_controller.dart';
import 'package:location/controller/direction_controller.dart';
import 'package:location/controller/map_controller.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  final GMapController gMapController = Get.find<GMapController>();
  final UserCurrentLocation currrentLocController =
      Get.find<UserCurrentLocation>();
  final DirectionController directionController =
      Get.find<DirectionController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepOrange,
        automaticallyImplyLeading: false,
        centerTitle: true,
        title: Text(
          "My Location",
          style: TextStyle(
              fontSize: 20.sp,
              color: Colors.white,
              fontWeight: FontWeight.bold),
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: Obx(
              () => GoogleMap(
                zoomControlsEnabled: false,
                myLocationEnabled: true,
                myLocationButtonEnabled: true,
                markers: Set<Marker>.of(gMapController.markers),
                polylines: Set<Polyline>.of(gMapController.polylines),
                initialCameraPosition: gMapController.cameraPosition,
                onMapCreated: (GoogleMapController controller) {
                  gMapController.mapController.complete(controller);
                },
              ),
            ),
          ),
          Obx(
            () => Container(
              padding: EdgeInsets.all(16.h),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Distance: ${directionController.distanceText.value}',
                    style: TextStyle(
                      fontSize: 16.sp,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 8.h),
                  Text(
                    'Duration: ${directionController.durationText.value}',
                    style: TextStyle(
                      fontSize: 16.sp,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
