import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:untitled1/signup_page.dart';
import 'package:get/get.dart';

import 'auth_controller.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {

  var _emailController = TextEditingController();
  var _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    double w = MediaQuery.of(context).size.width;
    double h = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 252, 247, 247),
      body: Column(
        children: [
          Container(
            width: w,
            height: h * 0.3,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage("img/loginimg.png"
                 ),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Container(
            margin: const EdgeInsets.only(left: 20,right: 20),
            width: w,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                "Hello",
                  style: TextStyle(
                    fontSize: 73,
                    fontWeight: FontWeight.bold,

                  ),
                ),
                Text(
                  "sign into your account",
                  style: TextStyle(
                    fontSize: 20,
                      color: Colors.grey[600],

                  ),
                ),
                SizedBox(height: 50,),
                Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                   borderRadius: BorderRadius.circular(30),
                    boxShadow:[ BoxShadow(
                     blurRadius: 10,
                     offset: Offset(1,1),
                     color: Colors.grey.withOpacity(0.2)
                     )
                    ]
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
                        borderSide: BorderSide(
                          color: Colors.white,
                          width: 1.0
                        )
                      ),
                        enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(30),
                            borderSide: BorderSide(
                                color: Colors.white,
                                width: 1.0
                            )
                        ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30)
                      )
                    ),
                  ),
                ),
                SizedBox(height: 12,),
                Container(
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(30),
                      boxShadow:[ BoxShadow(
                          blurRadius: 10,
                          offset: Offset(1,1),
                          color: Colors.grey.withOpacity(0.2)
                      )
                      ]
                  ),
                  child: TextField(
                    controller: _passwordController,
                    obscureText: true,
                    decoration: InputDecoration(
                        hintText: "Password",
                        prefixIcon: Icon(
                          Icons.password,
                          color: Colors.deepOrangeAccent,
                        ),
                        focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(30),
                            borderSide: BorderSide(
                                color: Colors.white,
                                width: 1.0
                            )
                        ),
                        enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(30),
                            borderSide: BorderSide(
                                color: Colors.white,
                                width: 1.0
                            )
                        ),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(30)
                        )
                    ),
                  ),
                ),
                SizedBox(height: 12,),
                Row(
                  children: [
                    Expanded(child: Container(),),
                    Text(
                      "sign into your account",
                      style: TextStyle(
                        color: Colors.grey[600],
                        fontSize: 20,

                      ),
                    )

                  ],
                ),


              ],
            ),

          ),
          SizedBox(height: 50,),
          GestureDetector(
          onTap: (){
            AuthController.instance.login(
                _emailController.text.trim(), _passwordController.text.trim());

          }
          ,
            child: Container(
              width: w*0.5,
              height: h * 0.08,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30),
                image: DecorationImage(
                  image: AssetImage("img/loginbtn.png"
                  ),
                  fit: BoxFit.cover,
                ),
              ),
              child: Center(
                child: Text(
                  "Sign in",
                  style: TextStyle(
                    fontSize: 36,
                    color: Colors.white,
                    fontWeight: FontWeight.bold

                  ),
                ),
              )
              ,
            ),
          ),
          SizedBox(height: w*0.2,),
          RichText(text: TextSpan(
              text: "Don\'t have an account ?",
            style: TextStyle(
              color: Colors.grey[600],
              fontSize: 20
            ),
            children: [
              TextSpan(
              text: " Create",
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 20,
                fontWeight: FontWeight.bold
              ),
              recognizer: TapGestureRecognizer()..onTap=()=>Get.to(()=>SignUpPage())
              )
            ]
          ))

        ],
      ),
    );
  }
}