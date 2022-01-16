import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'PigCalculator.dart';
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Pig Weight Calculator',
      theme: ThemeData(
        primarySwatch: Colors.pink,
      ),
      home: HomePage(),
    );
  }
}

class HomePage extends StatelessWidget{
  HomePage({Key? key}) : super(key: key);

  final TextEditingController _controller1 = TextEditingController();
  final TextEditingController _controller2 = TextEditingController();

  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        constraints: BoxConstraints.expand(),
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/bg.jpg'),
            fit: BoxFit.cover,
          ),
        ),
        child: Container(
          child: Center(
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 50.0, bottom: 50),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text('PIG WEIGHT', style: TextStyle(fontSize: 30.0, color: Colors.pinkAccent),),
                        Text('CALCULATOR', style: TextStyle(fontSize: 30.0, color: Colors.pinkAccent),),
                        Image.asset('assets/images/pig.png', width: 300,),
                      ],
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(width:20.0),
                      Expanded(
                        child: SizedBox(
                          child: Container(
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(5.0),
                              boxShadow: [
                                BoxShadow(
                                color: Colors.black,
                                offset: const Offset(5.0, 5.0),
                                blurRadius: 5.0,
                                spreadRadius: 0.5,
                                ),
                              ],
                            ),
                            child: Column(
                              children: [
                                Text('LENGTH', style: TextStyle(fontSize: 30.0),),
                                Text('(cm)', style: TextStyle(fontSize: 25.0),),
                                SizedBox(height: 20,),
                                Padding(
                                  padding: const EdgeInsets.only(left: 20.0, right: 20.0),
                                  child: TextField(
                                    textAlign: TextAlign.center,
                                    style: TextStyle(),
                                    controller: _controller1,
                                    decoration: InputDecoration(
                                      hintText: 'Enter length',
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          width: 250,
                          height: 150,
                        ),
                      ),
                      SizedBox(width: 20.0,),
                      Expanded(
                        child: SizedBox(
                          child: Container(
                            child: Column(
                              children: [
                                Text('GIRTH', style: TextStyle(fontSize: 30.0),),
                                Text('(cm)', style: TextStyle(fontSize: 25.0),),
                                SizedBox(height: 20,),
                                Padding(
                                  padding: const EdgeInsets.only(left: 20.0, right: 20.0),
                                  child: TextField(
                                    textAlign: TextAlign.center,
                                    controller: _controller2,
                                    decoration: InputDecoration(
                                      hintText: 'Enter girth',
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(5.0),
                              boxShadow: [
                                BoxShadow(
                                color: Colors.black,
                                offset: const Offset(5.0, 5.0),
                                blurRadius: 5.0,
                                spreadRadius: 0.5,
                              ),
                            ],
                            ),
                          ),
                          width: 250,
                          height: 150,
                        ),
                      ),
                      SizedBox(width: 20.0,)
                    ],
                  ),
                  Expanded(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SizedBox(
                          width: 200,
                          height: 50,
                          child: ElevatedButton(
                              onPressed: () {
                                var input1 = _controller1.text;
                                var input2 = _controller2.text;

                                var length = double.tryParse(input1);
                                var girth = double.tryParse(input2);

                                if (length == null || girth == null) {
                                  showDialog(
                                      context: context,
                                      barrierDismissible: false,
                                      builder: (BuildContext context,) {
                                        return AlertDialog(
                                          title: Text('ERROR'),
                                          content: Text('Invalid input'),

                                          actions: [
                                            ElevatedButton(onPressed: () {
                                              Navigator.of(context).pop();
                                            }, child: Text('OK'))
                                          ],
                                        );
                                      });
                                } else {
                                  PigCalculator pigCal = PigCalculator(length, girth);
                                  showDialog(
                                      context: context,
                                      barrierDismissible: false,
                                      builder: (BuildContext context,) {
                                        return AlertDialog(
                                          title: Row(
                                            children: [
                                              Image.asset('assets/images/ic_pig.png', width: 40.0,),
                                              Text(' Result'),
                                            ],
                                          ),
                                          content: Text('Weigth: ${pigCal.calMinus().round()} - ${pigCal.calPlus().round()} kg\nPrice: ${pigCal.minusPrice().round()} - ${pigCal.plusPrice().round()} baht'),

                                          actions: [
                                            ElevatedButton(onPressed: () {
                                              Navigator.of(context).pop();
                                            }, child: Text('OK'))
                                          ],
                                        );
                                      });
                                }
                              },
                              child: Text('CALCULATE', style: TextStyle(fontSize: 30.0),)
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
          ),

        ),
      ),
    );
  }
}
