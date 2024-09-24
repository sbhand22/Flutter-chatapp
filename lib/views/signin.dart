import 'package:chatappsaibhandari1999/widgets/widget.dart';
import 'package:flutter/material.dart';

class SignIn extends StatefulWidget {
  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBarMain(context),
      body: SingleChildScrollView(
        child: Container(
          height: MediaQuery.of(context).size.height-50,
            alignment: Alignment.bottomCenter,
            padding: EdgeInsets.symmetric(horizontal: 24),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                TextField(
                  style: simpleTextStyle(),
                  decoration: textFieldInputDecoration("email"),
                ),
                TextField(
                  style: simpleTextStyle(),
                  decoration: textFieldInputDecoration("password"),
                  ),
                SizedBox(height: 8,),
                Container(
                  alignment: Alignment.centerRight,
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 16,vertical: 8),
                    child: Text("Forget Password?",style: simpleTextStyle(),),
                  ),
                ),
                SizedBox(height: 8,),
                Container(
                  alignment: Alignment.center,
                  width: MediaQuery.of(context).size.width,
                  padding: EdgeInsets.symmetric(vertical: 20),
                  decoration: BoxDecoration(gradient: LinearGradient(colors:[const Color(0xff007EF4),const Color(0xff2A75BC)]),
                      borderRadius: BorderRadius.circular(30)
                  ),
                  child: Text("Sign in",style: mediumTextStyle()),
                ),
                SizedBox(height: 16,),
                Container(
                  alignment: Alignment.center,
                  width: MediaQuery.of(context).size.width,
                  padding: EdgeInsets.symmetric(vertical: 20),
                  decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(30)),
                  child: Text("Sign in with Google",style: TextStyle(color: Colors.black87,fontSize: 17),),
                ),
                SizedBox(height: 16,),

                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text("Don't have account? ",style: mediumTextStyle(),),
                    Text("Register now",style: TextStyle(fontSize: 17,color: Colors.white,decoration: TextDecoration.underline),),
                  ],
                ),

                SizedBox(height: 50,),



              ],

            ),
          ),
      ),


    );
  }
}
