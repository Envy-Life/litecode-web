import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class landingside2 extends StatefulWidget {
  @override
  _landingside2State createState() => _landingside2State();
}

class _landingside2State extends State<landingside2> {
  @override
  Widget build(BuildContext context) {
    return Positioned(
        height: MediaQuery.of(context).size.height,
        child: Column(
          children: [SvgPicture.asset('assets/Pair programming-amico 1.svg')],
        ));
  }
}
