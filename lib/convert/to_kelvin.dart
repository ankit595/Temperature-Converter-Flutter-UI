import 'package:flutter/material.dart';

class Kelvin extends StatefulWidget {
  const Kelvin({Key? key}) : super(key: key);

  @override
  _KelvinState createState() => _KelvinState();
}

class _KelvinState extends State<Kelvin> {
  Color c1 = const Color(0xFFFFE0B2);
  String? _temperatureItems;

  String holder = '';
  String holder1 = '';
  late double input;
  String output = '0';
  final TextEditingController controller1 = TextEditingController(text: '');

  void process() {
    setState(() {
      if (holder == '') {
        output = 'Choose Unit';
      }
      holder = _temperatureItems!;
      input = double.tryParse(controller1.text) ?? 0;

      if (holder == 'Kelvin') {
        output = input.toString();
      } else if (holder == 'Degree Celsius') {
        output = (input + 273.15).toString();
      } else if (holder == 'Degree Fahrenheit') {
        output = ((((input - 32) * 5) / 9) + 273.15).toString();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(
            Icons.arrow_back_ios_new_rounded,
            color: Colors.brown,
          ),
        ),
        backgroundColor: c1,
        title: const Text(
          "To Kelvin",
          style: TextStyle(
            color: Colors.brown,
            fontFamily: "Itim",
            fontSize: 22,
            fontWeight: FontWeight.w500,
          ),
        ),
        actions: const [],
      ),
      body: Column(
        children: <Widget>[
          ClipPath(
              clipper: WaveClipper(),
              child: Container(
                color: Colors.orange[300],
                height: 200,
                child: Column(children: <Widget>[
                  Container(
                    padding: const EdgeInsets.all(20.0),
                    width: 390,
                    child: TextField(
                      textAlign: TextAlign.right,
                      decoration: const InputDecoration(
                        labelText: 'Enter Value',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(
                            Radius.circular(10.0),
                          ),
                        ),
                      ),
                      keyboardType: TextInputType.number,
                      controller: controller1,
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.only(left: 10),
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: Colors.black,
                        width: 1,
                      ),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: DropdownButton<String>(
                      items: const [
                        DropdownMenuItem<String>(
                          value: 'Degree Fahrenheit',
                          child: Text('°F',style: TextStyle(
                        color: Colors.black
                    ),),
                        ),
                        DropdownMenuItem<String>(
                          value: 'Degree Celsius',
                          child: Text('°C',style: TextStyle(
                              color: Colors.black
                          ),),
                        )
                      ],
                      onChanged: (String? value) {
                        setState(() {
                          _temperatureItems = value;
                        });
                      },
                      hint: const Text('Select',style: TextStyle(
                          color: Colors.black
                      ),),
                      value: _temperatureItems,
                    ),
                  ),
                ]),
              )),
          Container(
            padding: const EdgeInsets.all(20.0),
            width: 390,
            child: TextField(
              textAlign: TextAlign.right,
              decoration: InputDecoration(
                labelText: 'Output: $output',
                labelStyle: const TextStyle(color: Colors.black),
                border: const OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.black, width: 2),
                  borderRadius: BorderRadius.all(
                    Radius.circular(10.0),
                  ),
                ),
              ),
              keyboardType: TextInputType.number,
              enabled: false,
            ),
          ),
          Container(
            padding: const EdgeInsets.only(left: 10),
            decoration: BoxDecoration(
              border: Border.all(
                color: Colors.black,
                width: 1,
              ),
              borderRadius: BorderRadius.circular(10),
            ),
            child: SizedBox(
              width: size.width * .2,
              child: const Text(
                "K",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.w700),
                textAlign: TextAlign.center,
              ),
            ),
          ),
          ElevatedButton(
            onPressed: process,
            style: ElevatedButton.styleFrom(
              foregroundColor: Colors.brown, backgroundColor: Colors.orange[500],
              elevation: 5,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15),
              ),
            ),
            child: const Text('Process'),
          ),
          const Expanded(
            child: Stack(children: [
              Positioned(
                top: 50,
                child: Image(
                  image: AssetImage(
                    "assets/wave.png",
                  ),
                  fit: BoxFit.fill,
                  height: 250,
                  width: 500,
                  // Set the desired height for the image
                ),
              ),
            ]),
          ),
        ],
      ),
    );
  }
}

class WaveClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    // TODO: implement getClip
    Path path = Path();
    path.moveTo(0, 0);
    path.lineTo(0, size.height * .6);
    path.lineTo(size.width * .5, size.height);
    path.lineTo(size.width, size.height * .6);
    path.lineTo(size.width, 0);
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    // TODO: implement shouldReclip
    return true;
  }
}
