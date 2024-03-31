import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:temp_convertor/convert/to_celsius.dart';
import 'package:temp_convertor/convert/to_fahrenheit.dart';
import 'package:temp_convertor/convert/to_kelvin.dart';


class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Color c1 = const Color(0xFFFFE0B2);
  var pi =360;
  final List<String> imagesList = [
    'assets/cel.png',
    'assets/fah.png',
    'assets/k.png',
  ];
  final List<String> NameList = [
    'To Celsius',
    'To Fahrenheit',
    'To Kelvin',
  ];
  get convert=>[
    Celsius(),
    Fahrenheit(),
    Kelvin()
  ];

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        leading: Icon(Icons.list_outlined, color: Colors.brown),
        backgroundColor: c1,
        title: Text(
          "Temperature Converter",
          style: TextStyle(
            color: Colors.brown,
            fontFamily: "Itim",
            fontSize: 22,
            fontWeight: FontWeight.w500,
          ),
        ),
        actions: [
        ],
      ),
      body: Column(children: [
        Expanded(
          flex: 2,
          child: Stack(children: [
            Positioned(
              top: -250,
              left: -20,
              child: Transform.rotate(
                angle: 360,
                child: Container(
                  alignment: Alignment.bottomCenter,
                  child: Image(
                    image: AssetImage(
                      "assets/wave.png",
                    ),
                    fit: BoxFit.fill,
                    width: 500, // Set the desired width for the image
                    height: 450, // Set the desired height for the image
                  ),
                ),
              ),
            ),
            Expanded(
              child: Container(
                padding: EdgeInsets.only(top: 100),
                child: CarouselSlider(
                  options: CarouselOptions(
                    height: 400,
                    autoPlay: true,
                  ),
                  items: imagesList.asMap().entries.map(
                        (entry) {
                      int index = entry.key; // Get the index of the current entry
                      String item = entry.value; // Get the current item
                      String name =
                      NameList[index]; // Get the corresponding name from NameList

                      return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Card(
                          color: Colors.white,
                          margin: EdgeInsets.only(
                            top: 10.0,
                            bottom: 10.0,
                          ),
                          elevation: 6.0,

                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30.0),
                          ),
                          child: ClipRRect(
                            borderRadius: BorderRadius.all(
                              Radius.circular(30.0),
                            ),
                            child: Stack(
                              children: <Widget>[
                                Image.asset(
                                  item,
                                  fit: BoxFit.fill,
                                  width: double.infinity,
                                  // height: double.infinity,
                                ),
                                Container(
                                  padding: EdgeInsets.all(5),
                                  alignment: Alignment.bottomCenter,
                                  child: SizedBox(
                                    width: size.width * .4,
                                    child: ElevatedButton(

                                      style: ElevatedButton.styleFrom(
                                          foregroundColor: Colors.brown, backgroundColor: Colors.orange[500],
                                          elevation: 5,
                                          shape: RoundedRectangleBorder(
                                              borderRadius:
                                              BorderRadius.circular(15))),
                                      onPressed: () {
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(builder: (context) => convert[index]),
                                        );
                                      },
                                      child: Text(name,style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 17,
                                          fontWeight: FontWeight.w500
                                      ),), // Use the name variable here
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      );
                    },
                  ).toList(),
                ),
              ),
            ),
          ]),
        ),
        Expanded(
            child: Stack(children: [
              // Positioned(
              //   top: -100,
              //   left: 10,
              //   child: Container(
              //       height: size.width * .5,
              //       width: size.width * .6,
              //       decoration: BoxDecoration(
              //           image: DecorationImage(
              //               image: AssetImage("assets/img_1.png"),
              //               alignment: Alignment.center,
              //               fit: BoxFit.cover),
              //           shape: BoxShape.circle)),
              // ),
              Positioned(
                top: 20,
                left: 0,
                child:Container(
                  alignment: Alignment.bottomCenter,
                  child: Image(
                    image: AssetImage(
                      "assets/wave.png",
                    ),
                    fit: BoxFit.fill,
                    width: 600, // Set the desired width for the image
                    height: 350, // Set the desired height for the image
                  ),
                ),
              ),
            ])),
        // ElevatedButton(onPressed: (){
        //   Navigator.push(context, MaterialPageRoute(builder: (context)=>ClipPaths()));
        // }, child: Text("Clip"))
      ]),
    );
  }
}