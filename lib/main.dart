import 'package:flutter/material.dart';

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
      home:Scaffold(
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
            Center(
              child: ClickGood(),
            ),

          ],

        ),

      ),

    );
  }

  Widget _printItem(){
    return Container(
      child: ListTile(
        title: InputName(),
      )
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


class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      // This call to setState tells the Flutter framework that something has
      // changed in this State, which causes it to rerun the build method below
      // so that the display can reflect the updated values. If we changed
      // _counter without calling setState(), then the build method would not be
      // called again, and so nothing would appear to happen.
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
      ),
      body: Center(
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.
        child: Column(
          // Column is also a layout widget. It takes a list of children and
          // arranges them vertically. By default, it sizes itself to fit its
          // children horizontally, and tries to be as tall as its parent.
          //
          // Invoke "debug painting" (press "p" in the console, choose the
          // "Toggle Debug Paint" action from the Flutter Inspector in Android
          // Studio, or the "Toggle Debug Paint" command in Visual Studio Code)
          // to see the wireframe for each widget.
          //
          // Column has various properties to control how it sizes itself and
          // how it positions its children. Here we use mainAxisAlignment to
          // center the children vertically; the main axis here is the vertical
          // axis because Columns are vertical (the cross axis would be
          // horizontal).
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headline4,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
