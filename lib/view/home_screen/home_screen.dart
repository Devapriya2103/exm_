import 'package:exm_/view/login_screen/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _BottomNavbarScreenState();
}

class _BottomNavbarScreenState extends State<HomeScreen> {
    int selectindex=0;

  @override
  Widget build(BuildContext context) {
     return Scaffold(
      body:  Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
         children: [
          Text("Home Screen",
          style: TextStyle(
            fontSize: 30,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
          ),
          SizedBox(height: 10),
          ElevatedButton(
            style:  ElevatedButton.styleFrom(
              backgroundColor:Colors.white
            ),
              onPressed: () async { 
                SharedPreferences prefs=await SharedPreferences.getInstance();
                await prefs.remove('username');
                await prefs.remove('password');
                Navigator.pushReplacement( 
                  context,
                   MaterialPageRoute(
                   builder:  (context) => LoginScreen(),
                   ),
                );
               },
               child: Text("Logout"),
               ),
           ],
         ),
      ),
    );
  }
}