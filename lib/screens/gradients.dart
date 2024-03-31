import 'package:flutter/material.dart';

class WaveGradient extends StatefulWidget {
  const WaveGradient({super.key});

  @override
  State<WaveGradient> createState() => _WaveGradientState();
}

class _WaveGradientState extends State<WaveGradient> {
  Color c1 = const Color(0xFFFFE0B2);
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Gradient",
          style: TextStyle(color: Colors.brown),
        ),
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(Icons.arrow_back_ios_new_rounded, color: Colors.brown),
        ),
        backgroundColor: c1,
      ),
      body: Container(
        child: Stack(children: [
          Positioned(
            top: size.height * .55,
            child: Container(
              alignment: Alignment.bottomCenter,
              child: Image(
                image: AssetImage(
                  "assets/wave.png",
                ),
                fit: BoxFit.fill,
                width: 500, // Set the desired width for the image
                height: 350, // Set the desired height for the image
              ),
            ),
          ),
        ]),
      ),
    );
  }
}
