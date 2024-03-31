import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'dart:math' as math;

class ClipPaths extends StatefulWidget {
  const ClipPaths({super.key});

  @override
  State<ClipPaths> createState() => _ClipPathsState();
}

class _ClipPathsState extends State<ClipPaths> {
  Color c1 = const Color(0xFFFFE0B2);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: (){
            Navigator.pop(context);
          },
          icon: Icon(
            Icons.arrow_back_ios_new,
            color: Colors.brown,
          ),
        ),
        backgroundColor: c1,
        title: Text("Clipper",style: TextStyle(
          color: Colors.brown
        ),),
      ),
      body: Container(
        child: Stack(
          children: [
            Opacity(
              opacity: 1,
              child: ClipPath(
                clipper: WaveClipper(),
                child: Container(
                  color: Colors.deepOrangeAccent,
                  height: 300,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
class WaveClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    // TODO: implement getClip
    Path path =Path();
    path.lineTo(0, size.height*.7);
    path.lineTo(size.width*.5, size.height);
    path.lineTo(size.width, size.height*.7);
    path.lineTo(size.width, 0);
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    // TODO: implement shouldReclip
    return true;
  }
}
