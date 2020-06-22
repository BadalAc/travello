import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:travello/screens/home.dart';
import 'package:travello/shared/constants.dart';

class SignIn extends StatefulWidget {
  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {

  String email = '';
  String password = '';
  bool hidePassword = true;

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: Color(0xfff9f9f9),
      body: SingleChildScrollView(
        child: SafeArea(
          child: Column(
            children: <Widget>[
              Stack(
                overflow: Overflow.visible,
                alignment: Alignment.center,
                children: <Widget>[
                  Container(
                      child: Image.asset('assets/images/signIn.jpg')
                  ),
                  Positioned(
                    bottom: -35,
                    child: Container(
                      decoration: BoxDecoration(
                          color: Color(0xfff9f9f9),
                        borderRadius: BorderRadius.only(topLeft: Radius.circular(15), topRight: Radius.circular(15))
                      ),
                      width: MediaQuery.of(context).size.width,
                      child: Center(
                          child: Padding(
                            padding: const EdgeInsets.only(top: 10),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: <Widget>[
                                Container(height: 40, width: 40,child: SvgPicture.asset('assets/icons/icon.svg',)),
                                SizedBox(width: 10,),
                                Align(
                                  alignment: Alignment.bottomCenter,
                                  child: Text(
                                      'Travello',
                                    style: GoogleFonts.zhiMangXing(
                                      textStyle: TextStyle(
                                        fontSize: 35,
                                        letterSpacing: 1
                                      )
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          )),
                    ),
                  )
                ],
              ),
              SizedBox(height: 50,),
              Container(
                width: MediaQuery.of(context).size.width/1.05,
                // this constant decoration is for curved border radius of a container
                decoration: boxDecoration.copyWith(color: Colors.white, boxShadow: [
                  BoxShadow(
                    color: Colors.grey,
                    spreadRadius: 2,
                    blurRadius: 10,
                  ),
                ],),
                child: Padding(
                  padding: const EdgeInsets.all(10),
                  child: Form(
                    key: _formKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.only(left: 10),
                          child: Text(
                              'Email:',
                              style: GoogleFonts.rubik(
                                textStyle: TextStyle(
                                    color: Colors.black,
                                    fontSize: 16
                                ),
                              )
                          ),
                        ),
                        SizedBox(height: 10,),
                        TextFormField(
                            onEditingComplete: () => FocusScope.of(context).nextFocus(),
                            validator: (value) => value.isEmpty ? 'Enter you email' : null,
                            cursorColor: Color(0xff003893),
                            textInputAction: TextInputAction.done,
                            onChanged: (value) {
                              setState(() {
                                email = value;
                              });
                            },
                            style: GoogleFonts.rubik(
                              textStyle: TextStyle(
                                fontSize: 18,
                              ),
                            ),
                            decoration: textInputDecoration.copyWith(hintText: 'abc@gmail.com',fillColor: Colors.grey[100])
                        ),
                        SizedBox(height: 20,),
                        Padding(
                          padding: const EdgeInsets.only(left: 10),
                          child: Text(
                              'Password:',
                              style: GoogleFonts.rubik(
                                textStyle: TextStyle(
                                    color: Colors.black,
                                    fontSize: 16
                                ),
                              )
                          ),
                        ),
                        SizedBox(height: 10,),
                        Stack(
                          alignment: Alignment.centerRight,
                          children: <Widget>[
                            TextFormField(
                                validator: (value) => value.length < 6 ? 'Enter 6+ characters password' : null,
                                cursorColor: Color(0xff003893),
                                textInputAction: TextInputAction.done,
                                obscureText: hidePassword ? true : false,
                                onChanged: (value) {
                                  setState(() {
                                    password = value;
                                  });
                                },
                                style: GoogleFonts.rubik(
                                  textStyle: TextStyle(
                                    fontSize: 18,
                                  ),
                                ),
                                decoration: textInputDecoration.copyWith(hintText: '*********', fillColor: Colors.grey[100])
                            ),
                            Positioned(
                              top: 20,
                              right: 20,
                              child: InkWell(
                                onTap: () {
                                  setState(() {
                                    hidePassword = !hidePassword;
                                  });
                                },
                                child: Icon(hidePassword ? Icons.visibility_off : Icons.visibility),
                              ),
                            )
                          ],
                        ),
                        SizedBox(height: 10,),
                        Align(
                          alignment: Alignment.centerRight,
                          child: Padding(
                            padding: const EdgeInsets.all(10),
                            child: InkWell(
                              onTap: () {},
                              child: Text(
                                'Forgot Password?',
                                style: GoogleFonts.rubik(
                                    textStyle: TextStyle(
                                        fontSize: 15,
                                        color: Color(0xffDC143C)
                                    )
                                ),
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(height: 20,),
              MaterialButton(
                height: 55,
                minWidth:240,
                elevation: 0,
                color: Color(0xff003893),
                onPressed: () {
                  if(_formKey.currentState.validate()){
                    Navigator.push(context, MaterialPageRoute(
                        builder: (context) {
                          return Home();
                        }
                    ));
                  }
                },
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(30))),
                child: Text(
                  'Sign In',
                  style: GoogleFonts.rubik(
                      textStyle: TextStyle(
                          color: Colors.white,
                          fontSize: 15
                      )
                  ),
                ),
              ),
              SizedBox(height: 10,),
              Center(
                child: Text(
                  'or',
                  style: GoogleFonts.rubik(),
                ),
              ),
              SizedBox(height: 10,),
              MaterialButton(
                elevation: 0,
                height: 55,
                minWidth:240,
                color: Colors.white,
                onPressed: () {},
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(30))),
                child: Container(
                  width: 200,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Container(
                        height: 30,
                        width: 30,
                        child: SvgPicture.asset('assets/icons/google.svg', fit: BoxFit.contain,),
                      ),
                      SizedBox(width: 20,),
                      Text(
                        'Sign In with Google',
                        style: GoogleFonts.rubik(
                            textStyle: TextStyle(
                                color: Colors.black,
                                fontSize: 15
                            )
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 20,),
            ],
          ),
        ),
      ),
    );
  }
}