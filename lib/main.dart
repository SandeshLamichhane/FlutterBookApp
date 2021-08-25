import 'package:flutter/material.dart';
 import 'package:jiban/HomePage/HomePage.dart';
  

void main()async {
  
  runApp(MyApp());
   
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        backgroundColor: Color(0xffDEEBF6),
        scaffoldBackgroundColor: Color(0xffDEEBF6),
        accentColor: Colors.brown,
         shadowColor: Colors.grey[900],
          primaryColor: Colors.blue[900],
          primaryColorDark: Colors.grey,
         
         textTheme:   const TextTheme(
      headline1: TextStyle(fontSize: 22.0, color: Colors.black, fontWeight: FontWeight.w800,letterSpacing: 1.1 ),
     headline2: TextStyle(fontSize: 22.0, color: Colors.black, fontWeight: FontWeight.w600,letterSpacing: 1.1 ),

      headline6: TextStyle(fontSize: 20.0, fontStyle: FontStyle.italic, ),
      bodyText2: TextStyle(fontSize: 18.0, fontFamily: 'Hind', fontWeight:FontWeight.w300, letterSpacing:1.2),
       bodyText1: TextStyle(fontSize: 15.0, fontFamily: 'Hind', color:Colors.grey, fontWeight:FontWeight.w800),
       headline5: TextStyle(fontSize: 13, color:Colors.grey, fontFamily:"Hind")
    ),
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: HomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key, required this.title}) : super(key: key);

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
      body:  LayoutBuilder(builder: (context, constraints){
        if (constraints.maxWidth > 600) 
         return Container(child:Center(child: Text("Fuck"),));
         return Container();
      }),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
