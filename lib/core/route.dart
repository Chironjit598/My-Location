
import 'package:get/get_navigation/src/routes/get_route.dart';
import 'package:location/screen/home_screen.dart';
import 'package:location/screen/splash_screen.dart';

class AppRoute {
  
  static const home = "/home_screen";
    static const splash = "/splash_screen";



  static List<GetPage> pages = [
    GetPage(name: home, page: ()=>  HomeScreen()),
        GetPage(name: splash, page: ()=>  SplashScreen()),

  ];
}
