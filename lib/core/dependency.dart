
import 'package:get/get.dart';
import 'package:location/controller/current_location_controller.dart';
import 'package:location/controller/direction_controller.dart';
import 'package:location/controller/map_controller.dart';
import 'package:location/controller/user_id_controller.dart';

class DependancyInjection extends Bindings {
  @override
  void dependencies() {
    //================= google map controller ==================
    Get.lazyPut(() => GMapController());

    //================= user current location controller ==================
    Get.lazyPut(() => UserCurrentLocation());
    //================= get device uniq id controller ==================
    Get.lazyPut(() => DeviceInfoController());
    //================= direction api controller ==================
    Get.lazyPut(() => DirectionController());

  
  }
}
