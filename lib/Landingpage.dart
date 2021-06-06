import 'dart:convert';
import 'dart:developer';
import 'dart:html';

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_sign_in_web/google_sign_in_web.dart';
import 'package:page_transition/page_transition.dart';
import 'package:web1/arctry1.dart';
import 'package:web1/landingside1.dart';
import 'package:web1/landingside2.dart';
import 'customshapeclipper.dart';
import 'myroom.dart';
import 'package:google_sign_in/google_sign_in.dart';

import 'package:http/http.dart' as http;

class Landingpage extends StatefulWidget {
  @override
  _LandingpageState createState() => _LandingpageState();
}

class _LandingpageState extends State<Landingpage>
    with SingleTickerProviderStateMixin {
  GoogleSignIn _googleSignIn = GoogleSignIn(
      // hostedDomain: ,
      clientId:
          '79632708781-h7uir0jnfribkmjdpiuaibq2a7h7o98p.apps.googleusercontent.com',
      signInOption: SignInOption.standard,
      scopes: [
        'https://www.googleapis.com/auth/userinfo.email',
        'https://www.googleapis.com/auth/userinfo.profile'
      ]);

  bool signuppressed = false;
  bool tncagreed = false;
  bool tncagreedpre = true;
  bool obscurepw = true;
  double signupopacity = 0;
  bool obscurepwpre = false;

  bool signinpressed = false;
  late AnimationController _controller;
  late Animation<double> _animation1;
  late Animation<Offset> _animation2;
  @override
  void initState() {
    _controller = AnimationController(
      vsync: this,
      duration: Duration(seconds: 1),

      // upperBound: 1,
    );
    _animation1 = Tween<double>(begin: 0, end: 1).animate(_controller);
    _animation2 = Tween<Offset>(begin: Offset(0.01, 0), end: Offset.zero)
        .animate(_controller);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    if (signuppressed &&
        obscurepwpre != obscurepw &&
        tncagreed != tncagreedpre) {
      _controller.value = 0;
      _controller.animateTo(1);
    }
    obscurepwpre = !obscurepw;
    tncagreedpre = !tncagreed;
    return Scaffold(
      body: Stack(
        children: [
          myarc(),
          // Container(
          //   height: MediaQuery.of(context).size.height,
          //   width: MediaQuery.of(context).size.width,
          //   color: Color(0xFFD1E4FF),
          // ),
          Positioned(
            child: SvgPicture.asset('assets/Pair programming-amico 1.svg'),
            left: MediaQuery.of(context).size.width * 0.60,
            bottom: MediaQuery.of(context).size.height * 0.35,
            // top: MediaQuery.of(context).size.height * 0.,
          ),
          Positioned(
            child: Text(
              '> \"Bro Lets Leetcode\" ',
              style: GoogleFonts.roboto(
                  fontWeight: FontWeight.w700,
                  fontSize: 26,
                  // height: 30,
                  color: Color(0xFF333333)),
            ),
            left: MediaQuery.of(context).size.width * 0.65,
            bottom: MediaQuery.of(context).size.height * 0.26,
          ),
          Positioned(
            child: Text(
              '>\“nah bro it’s too expensive, take lite\” ',
              style: GoogleFonts.roboto(
                  fontWeight: FontWeight.w700,
                  fontSize: 26,
                  // height: 30,
                  color: Color(0xFF333333)),
            ),
            left: MediaQuery.of(context).size.width * 0.65,
            bottom: MediaQuery.of(context).size.height * 0.26 - 40,
          ),
          Positioned(
            child: Text(
              '- avg bitsian, non-litecode user ',
              style: GoogleFonts.roboto(
                  fontWeight: FontWeight.w400,
                  fontSize: 24,
                  fontStyle: FontStyle.italic,

                  // height: 30,
                  color: Color(0xFF333333)),
            ),
            left: MediaQuery.of(context).size.width * 0.65,
            bottom: MediaQuery.of(context).size.height * 0.26 - 80,
          ),
          Positioned(
            child: Container(
              alignment: Alignment.center,
              child: Text(
                'lc',
                style: GoogleFonts.roboto(
                  fontWeight: FontWeight.w700,
                  fontSize: 48,
                ),
              ),
              width: 78,
              height: 78,
              decoration: BoxDecoration(
                color: Color(0xFFD1E4FF),
                borderRadius: BorderRadius.circular(10),
              ),
            ),
            top: 37,
            left: 39,
          ),
          Positioned(
            child: Container(
              padding: EdgeInsets.fromLTRB(0, 10, 0, 0),
              child: Text(
                'litecode',
                style: GoogleFonts.roboto(
                  fontWeight: FontWeight.w700,
                  fontSize: 48,
                ),
              ),
            ),
            top: 37,
            left: 39 + 25 + 78,
          ),
          !signuppressed
              ? Stack(
                  children: [
                    Positioned(
                      child: Text(
                        'Share Leetcode \npremium accounts.',
                        style: GoogleFonts.roboto(
                            fontWeight: FontWeight.w700, fontSize: 72),
                      ),
                      top: MediaQuery.of(context).size.height * 0.3,
                      left: 75,
                    ),
                    Positioned(
                      child: Text(
                        'Create an account. We match you with a \nroom of similar individuals',
                        style: GoogleFonts.roboto(
                            fontWeight: FontWeight.w500, fontSize: 32),
                      ),
                      top: MediaQuery.of(context).size.height * 0.3 + 180,
                      left: 75,
                    ),
                    Positioned(
                        top: MediaQuery.of(context).size.height * 0.3 + 320,
                        left: 75,
                        child: ElevatedButton(
                          child: Text(
                            'Get started',
                            style: GoogleFonts.roboto(
                                fontWeight: FontWeight.w700,
                                fontSize: 48,
                                color: Color(0xFF333333)),
                          ),
                          onPressed: () async {
                            // var user = await _googleSignIn.signIn();
                            // var user1 = await user!.authHeaders;
                            // print(user1['Authorization']);

                            // log(user.authHeaders.toString());
                            // log("done1");

                            // var whatever = await http.get(
                            //     Uri.parse(
                            //         "https://acm-litecode.herokuapp.com/users/me"),
                            //     headers: {
                            //       "Authorization":
                            //           user1['Authorization'].toString()
                            //     });
                            // print(whatever.toString());
                            // log("done2");

                            if (signuppressed) {
                              obscurepw = true;
                              obscurepwpre = true;
                              tncagreed = false;
                              tncagreedpre = false;
                            }
                            signuppressed = !signuppressed;
                            setState(() {
                              signupopacity = 1;
                            });

                            log(_controller.value.toString());
                          },
                          style: ButtonStyle(
                              fixedSize: MaterialStateProperty.resolveWith(
                                  (states) => Size(342, 88)),
                              shape: MaterialStateProperty.resolveWith(
                                  (states) => RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(44))),
                              backgroundColor:
                                  MaterialStateProperty.resolveWith(
                                      (states) => Color(0xFFD1E4FF))),
                        ))
                  ],
                )
              : !signinpressed
                  ? SlideTransition(
                      position: _animation2,
                      child: FadeTransition(
                        opacity: _animation1,
                        // duration: Duration(seconds: 4),
                        child: Stack(
                          children: [
                            Positioned(
                              child: Text(
                                "Signup for Litecode",
                                style: GoogleFonts.roboto(
                                  fontWeight: FontWeight.w700,
                                  fontSize: 36,
                                ),
                              ),
                              top: MediaQuery.of(context).size.height / 3.5,
                              left: MediaQuery.of(context).size.width / 15,
                            ),
                            Positioned(
                              child: Container(
                                  height: 500,
                                  width: 583,
                                  child: TextFormField(
                                    style: TextStyle(
                                      fontFamily: 'Helvetica',
                                      fontWeight: FontWeight.w400,
                                      fontSize: 26,
                                    ),
                                    expands: false,

                                    initialValue: "",
                                    // scrollPadding: EdgeInsets.fromLTRB(0, 0, 0, 10),
                                    cursorHeight: 30,
                                    cursorColor: Color(0xFFD1E4FF),

                                    decoration: InputDecoration(
                                        labelText: 'Mail',
                                        // labelStyle: TextStyle(color: Colors.blue[600]),
                                        alignLabelWithHint: true,
                                        floatingLabelBehavior:
                                            FloatingLabelBehavior.auto,
                                        prefixIcon:
                                            Icon(Icons.mail_outline_rounded),
                                        contentPadding:
                                            EdgeInsets.fromLTRB(10, 25, 0, 35),
                                        focusedBorder: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(15),
                                          borderSide: BorderSide(
                                              width: 2,
                                              color: Color(0xFFD1E4FF)),
                                        ),
                                        focusColor: Color(0xFFD1E4FF),
                                        border: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(15),
                                            borderSide: BorderSide(width: 2))),
                                  )),
                              top:
                                  MediaQuery.of(context).size.height / 3.5 + 65,
                              left: MediaQuery.of(context).size.width / 15,
                            ),
                            Positioned(
                              child: Container(
                                height: 500,
                                width: 583,
                                child: TextFormField(
                                    style: TextStyle(
                                      fontFamily: 'Helvetica',
                                      fontWeight: FontWeight.w400,
                                      fontSize: 26,
                                    ),
                                    expands: false,
                                    initialValue: "",
                                    // scrollPadding: EdgeInsets.fromLTRB(0, 0, 0, 10),
                                    cursorHeight: 30,
                                    cursorColor: Color(0xFFD1E4FF),
                                    decoration: InputDecoration(
                                      hintText: 'Username',
                                      focusedBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(15),
                                        borderSide: BorderSide(
                                            width: 2, color: Color(0xFFD1E4FF)),
                                      ),
                                      // labelText: 'Mail',
                                      fillColor: Color(0xFFD1E4FF),
                                      filled: true,
                                      alignLabelWithHint: true,
                                      floatingLabelBehavior:
                                          FloatingLabelBehavior.auto,
                                      prefixIcon: Icon(
                                        Icons.alternate_email,
                                        size: 30,
                                        color: Colors.black,
                                        // color: Colors.black,
                                      ),
                                      contentPadding:
                                          EdgeInsets.fromLTRB(0, 30, 0, 30),
                                      focusColor: Color(0xFFD1E4FF),
                                      hoverColor: Color(0xFFD1E4FF),
                                      border: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(15),
                                        borderSide: BorderSide(
                                            width: 2, color: Color(0xFFD1E4FF)),
                                      ),
                                    )),
                              ),
                              top: MediaQuery.of(context).size.height / 3.5 +
                                  165,
                              left: MediaQuery.of(context).size.width / 15,
                            ),
                            Positioned(
                              child: Container(
                                  height: 500,
                                  width: 583,
                                  child: TextFormField(
                                    style: TextStyle(
                                      fontFamily: 'Helvetica',
                                      fontWeight: FontWeight.w400,
                                      fontSize: 26,
                                    ),
                                    expands: false,

                                    initialValue: "",
                                    // scrollPadding: EdgeInsets.fromLTRB(0, 0, 0, 10),
                                    cursorHeight: 30,
                                    cursorColor: Color(0xFFD1E4FF),
                                    obscureText: obscurepw,

                                    decoration: InputDecoration(
                                        focusedBorder: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(15),
                                          borderSide: BorderSide(
                                              width: 2,
                                              color: Color(0xFFD1E4FF)),
                                        ),
                                        labelText: 'Password',
                                        alignLabelWithHint: true,
                                        floatingLabelBehavior:
                                            FloatingLabelBehavior.auto,
                                        suffixIcon: FocusableActionDetector(
                                          mouseCursor: SystemMouseCursors.basic,
                                          child: GestureDetector(
                                            onTap: () {
                                              setState(() {
                                                obscurepwpre = !obscurepw;
                                                obscurepw = !obscurepw;
                                              });
                                            },
                                            child: Padding(
                                              padding: EdgeInsets.fromLTRB(
                                                  0, 0, 5, 0),
                                              child: Icon(obscurepw
                                                  ? FontAwesomeIcons.eye
                                                  : FontAwesomeIcons.eyeSlash),
                                            ),
                                          ),
                                        ),
                                        prefixIcon: Icon(Icons.lock),
                                        contentPadding:
                                            EdgeInsets.fromLTRB(10, 25, 0, 35),
                                        focusColor: Color(0xFFD1E4FF),
                                        border: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(15),
                                            borderSide: BorderSide(width: 2))),
                                  )),
                              top: MediaQuery.of(context).size.height / 3.5 +
                                  265,
                              left: MediaQuery.of(context).size.width / 15,
                            ),
                            Positioned(
                              child: Row(children: [
                                Padding(
                                  padding:
                                      const EdgeInsets.fromLTRB(0, 0, 5, 3),
                                  child: Checkbox(
                                    // splashRadius: 100,

                                    activeColor: Colors.blue[400],
                                    materialTapTargetSize:
                                        MaterialTapTargetSize.padded,
                                    shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(4)),
                                    value: tncagreed,
                                    onChanged: (value) {
                                      setState(() {
                                        tncagreedpre = !tncagreed;
                                        tncagreed = !tncagreed;
                                      });
                                    },
                                  ),
                                ),
                                Text(
                                  "I agree to the terms & conditions.",
                                  style: TextStyle(
                                      fontFamily: 'Helvetica',
                                      fontWeight: FontWeight.w400,
                                      fontSize: 26),
                                )
                              ]),
                              top: MediaQuery.of(context).size.height / 3.5 +
                                  365,
                              left: MediaQuery.of(context).size.width / 15 + 50,
                            ),
                            Positioned(
                              child: ElevatedButton(
                                child: Container(
                                  alignment: Alignment.center,
                                  padding: EdgeInsets.fromLTRB(44, 15, 44, 15),
                                  child: Text(
                                    'Create your Litecode account',
                                    style: TextStyle(
                                        fontFamily: 'Helvetica',
                                        fontWeight: FontWeight.w700,
                                        color: Color(0xFF242424),
                                        fontSize: 32),
                                  ),
                                ),
                                onPressed: () {},
                                style: ButtonStyle(
                                    backgroundColor:
                                        MaterialStateProperty.resolveWith(
                                            (states) => Color(0xFFD1E4FF)),
                                    shape: MaterialStateProperty.resolveWith(
                                        (states) => RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(15))),
                                    fixedSize:
                                        MaterialStateProperty.resolveWith(
                                            (states) => Size(583, 79))),
                              ),
                              top: MediaQuery.of(context).size.height / 3.5 +
                                  420,
                              left: MediaQuery.of(context).size.width / 15,
                            ),
                            Positioned(
                              child: RichText(
                                text: TextSpan(children: [
                                  TextSpan(
                                      text: "Already have an account? ",
                                      style: TextStyle(
                                          fontFamily: 'Helvetica',
                                          fontWeight: FontWeight.w400,
                                          fontSize: 26)),
                                  TextSpan(
                                      recognizer: TapGestureRecognizer()
                                        ..onTap = () {
                                          obscurepw = true;
                                          obscurepwpre = false;

                                          tncagreed = false;
                                          tncagreedpre = true;

                                          signinpressed = !signinpressed;
                                          setState(() {});
                                        },
                                      text: "Login here.",
                                      style: TextStyle(
                                          fontFamily: 'Helvetica',
                                          fontWeight: FontWeight.w700,
                                          fontSize: 26))
                                ]),
                              ),
                              top: MediaQuery.of(context).size.height / 3.5 +
                                  520,
                              left: MediaQuery.of(context).size.width / 15 + 60,
                            )
                            // Positioned(child: Container(child: Text('hi')))
                          ],
                        ),
                      ),
                    )
                  : SlideTransition(
                      position: _animation2,
                      child: FadeTransition(
                        opacity: _animation1,
                        // duration: Duration(seconds: 4),
                        child: Stack(
                          children: [
                            Positioned(
                              child: Text(
                                "Login to Litecode",
                                style: GoogleFonts.roboto(
                                  fontWeight: FontWeight.w700,
                                  fontSize: 36,
                                ),
                              ),
                              top: MediaQuery.of(context).size.height / 3.5,
                              left: MediaQuery.of(context).size.width / 15,
                            ),

                            Positioned(
                              child: Container(
                                height: 500,
                                width: 583,
                                child: TextFormField(
                                    style: TextStyle(
                                      fontFamily: 'Helvetica',
                                      fontWeight: FontWeight.w400,
                                      fontSize: 26,
                                    ),
                                    expands: false,
                                    initialValue: "",
                                    // scrollPadding: EdgeInsets.fromLTRB(0, 0, 0, 10),
                                    cursorHeight: 30,
                                    cursorColor: Color(0xFFD1E4FF),
                                    decoration: InputDecoration(
                                      hintText: 'Username',
                                      focusedBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(15),
                                        borderSide: BorderSide(
                                            width: 2, color: Color(0xFFD1E4FF)),
                                      ),
                                      // labelText: 'Mail',
                                      fillColor: Color(0xFFD1E4FF),
                                      filled: true,
                                      alignLabelWithHint: true,
                                      floatingLabelBehavior:
                                          FloatingLabelBehavior.auto,
                                      prefixIcon: Icon(
                                        Icons.alternate_email,
                                        size: 30,
                                        color: Colors.black,
                                        // color: Colors.black,
                                      ),
                                      contentPadding:
                                          EdgeInsets.fromLTRB(0, 30, 0, 30),
                                      focusColor: Color(0xFFD1E4FF),
                                      hoverColor: Color(0xFFD1E4FF),
                                      border: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(15),
                                        borderSide: BorderSide(
                                            width: 2, color: Color(0xFFD1E4FF)),
                                      ),
                                    )),
                              ),
                              top:
                                  MediaQuery.of(context).size.height / 3.5 + 65,
                              left: MediaQuery.of(context).size.width / 15,
                            ),
                            Positioned(
                              child: Container(
                                  height: 500,
                                  width: 583,
                                  child: TextFormField(
                                    style: TextStyle(
                                      fontFamily: 'Helvetica',
                                      fontWeight: FontWeight.w400,
                                      fontSize: 26,
                                    ),
                                    expands: false,

                                    initialValue: "",
                                    // scrollPadding: EdgeInsets.fromLTRB(0, 0, 0, 10),
                                    cursorHeight: 30,
                                    cursorColor: Color(0xFFD1E4FF),
                                    obscureText: obscurepw,

                                    decoration: InputDecoration(
                                        focusedBorder: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(15),
                                          borderSide: BorderSide(
                                              width: 2,
                                              color: Color(0xFFD1E4FF)),
                                        ),
                                        labelText: 'Password',
                                        alignLabelWithHint: true,
                                        floatingLabelBehavior:
                                            FloatingLabelBehavior.auto,
                                        suffixIcon: FocusableActionDetector(
                                          mouseCursor: SystemMouseCursors.basic,
                                          child: GestureDetector(
                                            onTap: () {
                                              setState(() {
                                                obscurepw = !obscurepw;
                                              });
                                            },
                                            child: Padding(
                                              padding: EdgeInsets.fromLTRB(
                                                  0, 0, 5, 0),
                                              child: Icon(obscurepw
                                                  ? FontAwesomeIcons.eye
                                                  : FontAwesomeIcons.eyeSlash),
                                            ),
                                          ),
                                        ),
                                        prefixIcon: Icon(Icons.lock),
                                        contentPadding:
                                            EdgeInsets.fromLTRB(10, 25, 0, 35),
                                        focusColor: Color(0xFFD1E4FF),
                                        border: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(15),
                                            borderSide: BorderSide(width: 2))),
                                  )),
                              top: MediaQuery.of(context).size.height / 3.5 +
                                  165,
                              left: MediaQuery.of(context).size.width / 15,
                            ),

                            Positioned(
                              child: ElevatedButton(
                                child: Container(
                                  alignment: Alignment.center,
                                  padding: EdgeInsets.fromLTRB(44, 15, 44, 15),
                                  child: Text(
                                    'Login',
                                    style: TextStyle(
                                        fontFamily: 'Helvetica',
                                        fontWeight: FontWeight.w700,
                                        color: Color(0xFF242424),
                                        fontSize: 32),
                                  ),
                                ),
                                onPressed: () {
                                  Navigator.pushReplacement(
                                      context,
                                      PageTransition(
                                          child: myroom(),
                                          type: PageTransitionType.fade,
                                          duration: Duration(seconds: 1),
                                          childCurrent: this.widget,
                                          reverseDuration:
                                              Duration(seconds: 3)));
                                },
                                style: ButtonStyle(
                                    backgroundColor:
                                        MaterialStateProperty.resolveWith(
                                            (states) => Color(0xFFD1E4FF)),
                                    shape: MaterialStateProperty.resolveWith(
                                        (states) => RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(15))),
                                    fixedSize:
                                        MaterialStateProperty.resolveWith(
                                            (states) => Size(583, 79))),
                              ),
                              top: MediaQuery.of(context).size.height / 3.5 +
                                  270,
                              left: MediaQuery.of(context).size.width / 15,
                            ),
                            Positioned(
                              child: RichText(
                                text: TextSpan(children: [
                                  TextSpan(
                                      text: "New User? ",
                                      style: TextStyle(
                                          fontFamily: 'Helvetica',
                                          fontWeight: FontWeight.w400,
                                          fontSize: 26)),
                                  TextSpan(
                                      recognizer: TapGestureRecognizer()
                                        ..onTap = () {
                                          signinpressed = !signinpressed;
                                          setState(() {});
                                          log('HELLO');
                                        },
                                      text: "Signup",
                                      style: TextStyle(
                                          fontFamily: 'Helvetica',
                                          fontWeight: FontWeight.w700,
                                          fontSize: 26))
                                ]),
                              ),
                              top: MediaQuery.of(context).size.height / 3.5 +
                                  370,
                              left:
                                  MediaQuery.of(context).size.width / 15 + 180,
                            )
                            // Positioned(child: Container(child: Text('hi')))
                          ],
                        ),
                      ),
                    )
        ],
      ),
    );
  }

  Widget clipShape(context) {
    return Stack(children: <Widget>[
      Opacity(
        opacity: 0.75,
        child: ClipPath(
          clipper: CustomShapeClipper2(reverse: false, flip: true),
          child: Container(
            height: MediaQuery.of(context).size.height / 6,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [Colors.black87, Colors.black],
              ),
            ),
          ),
        ),
      ),
      Opacity(
        opacity: 0.5,
        child: ClipPath(
          clipper: CustomShapeClipper2(),
          child: Container(
            height: MediaQuery.of(context).size.height / 5,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [Colors.black, Colors.black87],
              ),
            ),
          ),
        ),
      )
    ]);
  }
}
