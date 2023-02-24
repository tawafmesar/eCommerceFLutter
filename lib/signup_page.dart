import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:untitled1/auth_controller.dart';

class SignUpPage extends StatelessWidget {
   final TextEditingController _emailController = TextEditingController();
   final TextEditingController _passController = TextEditingController();

  @override
  Widget build(BuildContext context) {

    double w = MediaQuery.of(context).size.width;
    double h = MediaQuery.of(context).size.height;

    return Scaffold(
      body: Column(
        children: [
          Container(
            margin: const EdgeInsets.only(left: 20, right: 20,top: 150),
            width: w,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 50,
                ),

                Container(
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(30),
                      ),
                  child: TextField(
                    controller: _emailController,
                    decoration: InputDecoration(
                        hintText: "Email",
                        prefixIcon: Icon(
                          Icons.email,
                          color: Colors.deepOrangeAccent,
                        ),
                        focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(30),
                            borderSide:
                                BorderSide(color: Colors.white, width: 1.0)),),
                  ),
                ),

                SizedBox(
                  height: 12,
                ),

                Container(
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(30),
                      ),
                 
                  child: TextField(
                    controller: _passController,
                    obscureText: true,
                    decoration: InputDecoration(
                        hintText: "Password",
                        prefixIcon: Icon(
                          Icons.password,
                          color: Colors.deepOrangeAccent,
                        ),
                        focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(30),
                            borderSide:
                                BorderSide(color: Colors.white, width: 1.0)),
                          ),
                  ),
                ),

                SizedBox(
                  height: 12,
                ),

              ],
            ),
          ),
          SizedBox(
            height: 50,
          ),
          GestureDetector(
            onTap: () {
              AuthController.instance.register(
                  _emailController.text.trim(), _passController.text.trim());
            },
              child: Center(
                child: Text(
                  "Sign up",
                  style: TextStyle(
                      fontSize: 36,
                      backgroundColor: Colors.amberAccent,
                      color: Colors.black,
                      fontWeight: FontWeight.bold),
                ),
              ),
            ),
      
        ],
      ),
    );
  }
}
