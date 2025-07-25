import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:todo_app_getx/Components/Routes/route_name.dart';

class LoginController extends GetxController {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  RxnString emailError = RxnString();
  RxnString passwordError = RxnString();

  void isLogin() {
     if(emailController.text.trim().isEmpty) {
       emailError.value = 'Email is required';
     }
     else if(!GetUtils.isEmail(emailController.text.trim())) {
       emailError.value = 'Enter a valid email';
     }
     else {
       emailError.value = null;
     }

     if(passwordController.text.isEmpty) {
       passwordError.value = "Password is Required";
     }
     else if (passwordController.text.trim().length < 8){
     passwordError.value = "Enter a 8 digits password Atleast";
     }
     else {
       passwordError.value = null;
     }

     if(emailError.value == null && passwordError.value == null) {
       if(emailController.text.trim() == "abcd@gmail.com" && passwordController.text.trim() == "12347890") {
         Get.snackbar("Login","Login Successfully");
         Get.offAllNamed(RouteName.todoView);
       }
       else {
         Get.snackbar("Invalid","Invalid email or password");
       }
     }
  }

}