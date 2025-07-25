import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todo_app_getx/ViewModel/LoginController/login_controller.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);
  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {

  final Controller = Get.put(LoginController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueAccent,
        title: Text(
          "Login",
          style: TextStyle(
            fontSize: 22,
            fontWeight: FontWeight.bold,
            fontFamily: 'Poppins',
            color: Colors.white,
          ),
        ),
        centerTitle: true,
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 100),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Obx(()=> TextFormField(
                  controller: Controller.emailController,
                  decoration: InputDecoration(
                    errorText: Controller.emailError.value,
                    hintText: "Email",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.black, width: 1),
                      borderRadius: BorderRadius.circular(5),
                    ),
                  ),
                )
              ),
              SizedBox(height: 17),
              Obx(()=> TextFormField(
                controller: Controller.passwordController,
                obscureText: true,
                decoration: InputDecoration(
                  errorText: Controller.passwordError.value,
                  hintText: "Password",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.black, width: 1),
                    borderRadius: BorderRadius.circular(5),
                  ),
                ),
              ),),
              SizedBox(height: 40),
             Obx(()=> Controller.isLoading.value ? CircularProgressIndicator() :
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blueAccent,
                  minimumSize: Size(100, 44),
                ),
                onPressed: () {
                  Controller.isLogin();
                },
                child: Text(
                  "Login",
                  style: TextStyle(
                    fontFamily: 'Poppins',
                    color: Colors.white,
                    fontSize: 17,
                  ),
                ),
              ),
             ),
            ],
          ),
        ),
      ),
    );
  }
}
