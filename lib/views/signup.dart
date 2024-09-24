import 'package:chatappsaibhandari1999/services/auth.dart';
import 'package:chatappsaibhandari1999/widgets/widget.dart';
import 'package:flutter/material.dart';

class SignUp extends StatefulWidget {
  @override
  _SignState createState() => _SignState();
}

class _SignState extends State<SignUp> {
  bool isloading = false;
  AuthMethods authMethods = new AuthMethods();

  final formkey =GlobalKey<FormState>();

  TextEditingController usernameTEC= new TextEditingController();
  TextEditingController emailTEC= new TextEditingController();
  TextEditingController passwordTEC= new TextEditingController();

  signMeUp(){
    if(formkey.currentState.validate()){
      setState(() {
        isloading = true;
      });
      authMethods.signInWithEmailAndPassword(emailTEC.text, passwordTEC.text).then((val){
        print(val);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBarMain(context),
      body: isloading ? Container(
        child: Center(child: CircularProgressIndicator()),
      ) : SingleChildScrollView(
        child: Container(
          height: MediaQuery.of(context).size.height-50,
          alignment: Alignment.bottomCenter,
          padding: EdgeInsets.symmetric(horizontal: 24),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Form(
                key: formkey,
                child: Column(
                  children: <Widget>[
                    TextFormField(
                      validator: (val){
                        return val.isEmpty || val.length<4 ? "Please provide the Valid username" : null;
                      },
                      controller: usernameTEC,
                      style: simpleTextStyle(),
                      decoration: textFieldInputDecoration("username"),
                    ),
                    TextFormField(
                      validator: (val){
                        return RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+").hasMatch(val) ? null : "Please provide valid Email";
                      },
                      controller: emailTEC,
                      style: simpleTextStyle(),
                      decoration: textFieldInputDecoration("email"),
                    ),
                    TextFormField(
                      obscureText: true,
                      validator: (val){
                        return val.length>6 ?  null: "please provide 6+ character password";
                      },
                      controller: passwordTEC,
                      style: simpleTextStyle(),
                      decoration: textFieldInputDecoration("password"),
                    )
                  ],
                ),
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
              GestureDetector(
                onTap: (){
                  signMeUp();
                },
                child: Container(
                  alignment: Alignment.center,
                  width: MediaQuery.of(context).size.width,
                  padding: EdgeInsets.symmetric(vertical: 20),
                  decoration: BoxDecoration(gradient: LinearGradient(colors:[const Color(0xff007EF4),const Color(0xff2A75BC)]),
                      borderRadius: BorderRadius.circular(30)
                  ),
                  child: Text("Sign Up",style: mediumTextStyle()),
                ),
              ),
              SizedBox(height: 16,),
              Container(
                alignment: Alignment.center,
                width: MediaQuery.of(context).size.width,
                padding: EdgeInsets.symmetric(vertical: 20),
                decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(30)),
                child: Text("Sign Up with Google",style: TextStyle(color: Colors.black87,fontSize: 17),),
              ),
              SizedBox(height: 16,),

              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text("Already have account? ",style: mediumTextStyle(),),
                  Text("Sign in now",style: TextStyle(fontSize: 17,color: Colors.white,decoration: TextDecoration.underline),),
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
