import 'package:flutter/material.dart';
import 'second.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    int _numberOfPeople = 5;
    return MaterialApp(
      title: 'Bowling',
      routes: <String, WidgetBuilder> {
        '/home': (BuildContext context) => new MainPage(),
        '/subpage': (BuildContext context) => new SubPage()
      },
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.red,
      ),
      home: MainPage(),
    );
  }
}


class MainPage extends StatelessWidget{
  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: Text("Bowling App"),
      ),
      body: ListView(
        children: [
          SliderClass(),

          InputName(),
          InputName(),
          InputName(),
          InputName(),
          InputName(),
          InputName(),
          Container(
            padding: EdgeInsets.all(32.0),
            child: Center(
              child: Column(
                children: <Widget>[
                  RaisedButton(onPressed: () => Navigator.of(context).pushNamed("/subpage"), child: new Text('スタート'),)
                ],
              ),
            ),
          ),

        ],

      ),

    );
  }
}

class SliderClass extends StatefulWidget{
  @override
  _SliderClassState createState() => _SliderClassState();
}


class _SliderClassState extends State<SliderClass>{
  double _value = 4;
  bool _touchedslider = false;

  void _changeSlider(double e) {
    setState(() {
      _value = e;
      _touchedslider = true;
    });
  }
  @override
  Widget build(BuildContext context){
    return Container(
        padding: const EdgeInsets.all(0.0),
        //color: _touchedslider ? Colors.grey : Colors.white,
        child: Row(
          children: [

            Text(
              "人数を入力",
              style: TextStyle(
                color: Colors.black45,
              ) ,
            ),
            Slider(
              label: '$_value',
              min: 1,
              max: 6,
              value: _value,
              activeColor: Colors.red,
              inactiveColor: Colors.grey,
              divisions: 5,
              onChanged: _changeSlider,
            ),

            Text(
                "人数: $_value"
            )
          ],

        )
    );
  }
}

class ClickGood extends StatefulWidget {
  @override
  _ClickGoodState createState() => _ClickGoodState();
}

class _ClickGoodState extends State<ClickGood> {
  bool _active = false;

  void _handleTap() {
    setState(() {
      _active = !_active;
    });
  }

  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: _handleTap,
        child: Container(

          child: Center(
            child: Text(
            "スタート",
            style: TextStyle(
                fontSize: 32.0,
                color: Colors.black
            ),
          ),
          ),
          width: 200.0,
          height: 50.0,
          decoration: BoxDecoration(
              color: Colors.orange
        ),
        ),
    );
  }
}



class InputName extends StatefulWidget{
  @override
  _InputNameState createState() => _InputNameState();
}

class _InputNameState extends State<InputName>{

  String _text = "";

  void _handleText(String e){
    setState(() {
      _text = e;
    });
  }
  @override
  Widget build(BuildContext context){
    return Container(
      padding: const EdgeInsets.all(5.0),
      child: Row(
        children: <Widget>[
          Text("名前"),
          Expanded(
            child: TextField(
              maxLength: 10,
              style: TextStyle(color: Colors.red),
              obscureText: false,
              maxLines: 1,
              enabled: true,
              decoration: const InputDecoration(
                icon: Icon(Icons.face),
                hintText: 'お名前を教えてください',
              ),
              onChanged: _handleText,
            ),
          ),
        ],
      ),
    );
  }
}
