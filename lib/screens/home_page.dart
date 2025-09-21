import 'package:flutter/material.dart';
import 'package:resto/screens/signin_page.dart';
import 'package:resto/screens/signup_page.dart';



class RestoShopHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Color(0xFF6771D6),
        appBar: AppBar(
          backgroundColor: Color(0xFF724AA0),
          title: Text('RestoShop',
          style: TextStyle(fontFamily: 'Suwannaphum', color: Colors.white)),
        ), 
        body: Center(
          child: Padding(
            padding: const EdgeInsets.only(top: 16, bottom: 16),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(15)),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black26,
                          blurRadius: 8,
                          offset: Offset(2, 2),
                        ),
                      ],
                      ),
                      clipBehavior: Clip.antiAlias,
                      margin: EdgeInsets.all(5),
                      width: 230,
                      child: Image.network(
                        "https://fastly.picsum.photos/id/0/5000/3333.jpg?hmac=_j6ghY5fCfSD6tvtcV74zXivkJSPIfR9B8w34XeQmvU"),
                    ),
                    Container(
                      margin: EdgeInsets.all(5),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(15)),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black26,
                          blurRadius: 8,
                          offset: Offset(2, 2),
                        ),
                      ],
                      ),
                      clipBehavior: Clip.antiAlias,
                      width: 230,
                      child: Image.asset("asset/images/201-5000x3333.jpg"),
                    ),
                  ],
              ),
              Padding(
                padding: const EdgeInsets.only(top: 16, bottom: 16),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ElevatedButton(onPressed: () {
                      Navigator.push(context, MaterialPageRoute(builder: ( context) {
                        return  SignInScreen();
                      }));
                    },
                    style: ElevatedButton.styleFrom(
                      elevation: 5,
                      shadowColor: Colors.black.withOpacity(0.8),
                    ),
                    child: Text("Sign In",
                    style: TextStyle(fontFamily: 'Suwannaphum', color: Color(0xFF9032E7), fontWeight: FontWeight.bold),)),
                    SizedBox(width: 20),
                    ElevatedButton(onPressed: () {
                      Navigator.push(context, MaterialPageRoute(builder: ( context) {
                        return  SignUpScreen();
                      }));
                    },
                    style: ElevatedButton.styleFrom(
                      elevation: 5,
                      shadowColor: Colors.black.withOpacity(0.8),
                    ),
                    child: Text("Sign Up",
                    style: TextStyle(fontFamily: 'Suwannaphum', color: Color(0xFF9032E7), fontWeight: FontWeight.bold),)),
                  ],
                            
                ),
              )
              ],
              
            ),
          )
        ),
      ),
      debugShowCheckedModeBanner: false,
    );
  }
}