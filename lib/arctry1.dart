import 'package:flutter/material.dart';
import 'dart:math' as math;

// class MyArc extends StatelessWidget {
//   final double diameter;

//   const MyArc({required Key key, this.diameter = 200}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return CustomPaint(
//       painter: MyPainter(),
//       size: Size(diameter, diameter),
//     );
//   }
// }

// // This is the Painter class
// class MyPainter extends CustomPainter {
//   @override
//   void paint(Canvas canvas, Size size) {
//     Paint paint = Paint()..color = Colors.blue;
//     canvas.drawArc(
//       Rect.fromCenter(
//         center: Offset(size.height / 2, size.width / 2),
//         height: size.height,
//         width: size.width,
//       ),
//       math.pi,
//       math.pi,
//       false,
//       paint,
//     );
//   }

//   @override
//   bool shouldRepaint(CustomPainter oldDelegate) => false;
// }

class myarc extends StatelessWidget {
  final double diameter;

  myarc({this.diameter = 200});

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      painter: MyPainter(),
      size: MediaQuery.of(context).size,
    );
  }
}

// This is the Painter class
class MyPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()..color = Color(0xFFD1E4FF);
    canvas.drawArc(
      Rect.fromCenter(
        center: Offset(size.width - 100, size.height / 2),
        height: size.width,
        width: size.width,
      ),
      math.pi,
      2 * math.pi,
      false,
      paint,
    );
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}
