import 'package:get/get.dart';
import 'package:todo_app_getx/Components/Routes/route_name.dart';
import 'package:todo_app_getx/View/Login/login_screen.dart';
import 'package:todo_app_getx/View/SplashScreen/splash_screen.dart';

class Routes {
  static appRoutes() => [
    GetPage(name: RouteName.splashView, page:()=> SplashScreen()),
    GetPage(name: RouteName.loginView, page: ()=> LoginScreen()),
  ];
}