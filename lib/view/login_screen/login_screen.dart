import 'package:exm_/view/global_widget/custom_button.dart';
import 'package:exm_/view/registration_screen/registration_screen.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

final emailController = TextEditingController();
final passController = TextEditingController();

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool isChecked = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Icon(Icons.arrow_back),
      ),
      body: Padding(
        padding: const EdgeInsets.all(18.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text(
              "Sign in to Your Account",
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
              controller: passController,
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
            Row(
              children: [
                Checkbox(
                  value: isChecked,
                  onChanged: (bool? value) {
                    setState(() {
                      isChecked = value!;
                    });
                  },
                ),
                Text("Remember me",
                style: TextStyle(
                  fontSize: 12,
                  color: Colors.black
                  ),
                ),
                Spacer(),
                Text(
                  "Forgot Password",
                  style: TextStyle(
                    fontSize: 12,
                    color: Colors.blue
                    ),
                )
              ],
            ),
            SizedBox(height: 20),
            CustomButton(
              buttonText: "Sign In",
              onButtonPressed: () async{
                String email = emailController.text;
                String password = passController.text;

               if (email.isNotEmpty && password.isNotEmpty) {
               SharedPreferences prefs = await SharedPreferences.getInstance();
               await prefs.setString('email', email);
               await prefs.setString('password', password);
    
              Navigator.pushReplacement(
               context,
                MaterialPageRoute(builder: (context) => RegistrationScreen()),
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
   },
  ),
            Spacer(),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("Don't have an account?",
                style: TextStyle(
                  fontSize: 12,
                  color: Colors.black,
                ),
                ),
                Text(
                  " Sign Up",
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