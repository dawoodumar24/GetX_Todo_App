import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:todo_app_getx/Components/Routes/route_name.dart';

class LoginController extends GetxController {

  RxBool isLoading = false.obs;

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  RxnString emailError = RxnString();
  RxnString passwordError = RxnString();

  Future<void> isLogin() async {
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
       try{
         isLoading.value = true;
         var response = await http.post(Uri.parse("https://reqres.in/api/login"),
         headers: {
           'Content-Type': 'application/json',
           'x-api-key': 'reqres-free-v1',
             },
         body : jsonEncode(
             {
               "email" : emailController.text.trim(),
             "password" : passwordController.text.trim()
             }));

         print("Status Code: ${response.statusCode}");
         print("Body: ${response.body}");

         if(response.statusCode == 200) {
           isLoading.value = false;
           var data = jsonDecode(response.body);
           Get.snackbar("Login","Login Successfully\n Token: ${data['token']}");
           Get.offAllNamed(RouteName.todoView);
         }
         else{
           isLoading.value = false;
           var error = jsonDecode(response.body);
           Get.snackbar("Login failed",error['error'] ?? "Invalid Login");
         }
       }catch(e) {
         isLoading.value = false;
         Get.snackbar("Error","Something went wrong: $e");
       }
     }
  }
}