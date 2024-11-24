import 'package:exm_/view/global_widget/custom_button.dart';
import 'package:exm_/view/home_screen/home_screen.dart';
import 'package:exm_/view/login_screen/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class RegistrationScreen extends StatefulWidget {
  const RegistrationScreen({super.key});

  @override
  State<RegistrationScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegistrationScreen> {

  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController passConfirmController = TextEditingController();

  String username = "";
  String password = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) => LoginScreen(),),);
          },
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(18.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text(
              "Sign Up for Free",
              style: TextStyle(
              fontSize: 25,
              fontWeight: FontWeight.bold, 
             ),
            ),
            SizedBox(height: 30),
            TextField(
              controller: emailController,
              decoration: InputDecoration(
                labelText: 'Your Email Address',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),
            SizedBox(height: 20),
            TextField(
              controller: passwordController,
              obscureText: true,
              decoration: InputDecoration(
                labelText: "Your Password",
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                suffixIcon: Icon(Icons.remove_red_eye_outlined),
              ),
            ),
            SizedBox(height: 20),
            TextField(
              controller: passConfirmController,
              obscureText: true,
              decoration: InputDecoration(
                labelText: "Your Confirm Password",
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                suffixIcon: Icon(Icons.remove_red_eye_outlined),
              ),
            ),
            SizedBox(height: 20),
            CustomButton(
              buttonText: "Sign Up",
              onButtonPressed: () async {
                String email = emailController.text;
                String password = passwordController.text;
                String confirmPassword = passConfirmController.text;

                SharedPreferences prefs = await SharedPreferences.getInstance();
                await prefs.setString('email', email);
                await prefs.setString('password', password);

               if (email.isNotEmpty || password.isNotEmpty || confirmPassword.isNotEmpty) {

                Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => HomeScreen()),
              );
             } else {
                showDialog(
               context: context,
               builder: (context) {
               return AlertDialog(
               title: Text("Error"),
               content: Text("Please enter email and password."),
               actions: <Widget>[
                 TextButton(
                   child: Text("OK"),
                   onPressed: () {
                   Navigator.pop(context); 
                },
              ),
            ],
          );
        },
      );
    }
            if (password == confirmPassword) {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => HomeScreen()),
              );
            } else {
              showDialog(
               context: context,
               builder: (context) {
               return AlertDialog(
               title: Text("Error"),
               content: Text("Incorrect password."),
               actions: <Widget>[
                 TextButton(
                   child: Text("OK"),
                   onPressed: () {
                   Navigator.pop(context); 
                },
              ),
            ],
          );
        },
      );
      }
     },
     ),
            Spacer(),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("Already have an account?",
                  style: TextStyle(
                  fontSize: 12,
                  color: Colors.black,
                 ),
                ),
                Text("Sign In",
                    style: TextStyle(
                    fontSize: 12,
                   color: Colors.blue,
                 ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}