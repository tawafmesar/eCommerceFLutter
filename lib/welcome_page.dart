import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'auth_controller.dart';

class WelcomePage extends StatelessWidget {
  String email;
  WelcomePage({Key? key ,required this.email}) : super(key: key);

  @override
  Widget build(BuildContext context) {

      List images =[
        "g.png",
        "t.png",
        "f.png"
      ];

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
                  image: AssetImage("img/signup.png"),
                  fit: BoxFit.cover,
                ),
              ),
              child: Column(
                children: [
                  SizedBox(
                    height: h * 0.16,
                  ),
                  CircleAvatar(
                    backgroundColor: Colors.white70,
                    radius: 50,
                    backgroundImage: AssetImage("img/profile1.png"),
                  )
                ],
              ),
            ),

            SizedBox(
              height: 50,
            ),
            Container(
              width: w,
              margin: const EdgeInsets.only(left: 20,  bottom: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                              Text(
                "Welcome",
                style: TextStyle(
                  fontSize: 36,
                  fontWeight: FontWeight.bold,
                  color: Colors.deepOrangeAccent
            
                ),
              ),
            
                      Text(
                        email,
              style: TextStyle(
                  fontSize: 26,
                  color: Colors.grey[400]),
                      ),
                ],
            
              ),
            ),

            SizedBox(height: 200,),
            GestureDetector(
              onTap: (){
                AuthController.instance.logOut();
              }
            ,
              child: Container(
                width: w * 0.5,
                height: h * 0.08,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                  image: DecorationImage(
                    image: AssetImage("img/loginbtn.png"),
                    fit: BoxFit.cover,
                  ),
                ),
                child: Center(
                  child: Text(
                    "Sign out",
                    style: TextStyle(
                        fontSize: 36,
                        color: Colors.white,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: w * 0.2,
            ),
           


          ],
        ),
      );
    }
  }
