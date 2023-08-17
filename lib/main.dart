import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.amber,
      ),
      home: const MyHomePage(title: 'BMI Calculator'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  TextEditingController _heightController = TextEditingController();
  TextEditingController _weightController = TextEditingController();
  double _bmiResult = 0;
  String _textResult = "";

  void onCalculate() {
    double _h = double.parse(_heightController.text);
    double _w = double.parse(_weightController.text);


    setState(() {
      _bmiResult = _w / (_h * _h);

    if(_bmiResult > 25){
      _textResult = "Over Weight";
    }else if(_bmiResult > 18 && _bmiResult < 25 ){
      _textResult = "Normal Weight";
    }else{
      _textResult = "Under weight";
    }  
    });
    
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: 20,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                  width: 130,
                  child: TextField(
                    controller: _heightController,
                    style: TextStyle(fontSize: 42,fontWeight: FontWeight.w300),
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      labelText: 'Height',
                    ),
                  ),
                ),
                Container(
                  width: 130,
                  child: TextField(
                    controller: _weightController,
                    
                    style: TextStyle(fontSize: 42,fontWeight: FontWeight.w300),
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      // hintText: 'weight',
                      labelText: 'weight',
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 30,),
            Container(
            
              child: TextButton(
                onPressed: onCalculate,
                child: Text("Calculate", style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold),),
                ),
            ),
            SizedBox(height: 30,),
            Container(
              child: Text(_bmiResult.toStringAsFixed(2),style: TextStyle(fontSize: 90),
              ),
            ),
            SizedBox(height: 30,),
            Container(
              child: Text(_textResult, style: TextStyle(fontSize: 32,fontWeight: FontWeight.w400),
              ),
            ),
          ],
        ),
        ),
      );
  }
}
