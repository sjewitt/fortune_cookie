import 'dart:math'; // did this auto-import??

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
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      home:
          MyHomePage(), // this is key. MyHomePage() is a stateful widget defined below...
    );
  }
}

// NOTE: `this` can be omitted if there is no ambiguity:
// https://stackoverflow.com/questions/64324559/what-does-mean-of-using-the-this-keyword-in-dart
class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  // this widget is the home of the application

  @override // and we override this function to set the State of this new Widget...
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  // and THIS is where the stateful props for MyHomePage() are generated
  //  - note that State is cast to type <MyHomePage>
  // see https://www.tops-int.com/blog/mastering-stateless-and-stateful-widgets-in-flutter

  // check reusibility of a const Text()
  Text test = const Text("I am a constant text...");

  // THESE are the stateful properties:
  int _counter = 0;

  // for ex #6, fortune cookie:
  String _currFortune = "UNOVERRIDDEN";

  // for ex #6, fortune cookie:
  String _rndFortune = "UNOVERRIDDEN";

  // use this in place of the button pushed message
  // this is not stateful, but is needed in the setState() calls below.
  final _fortuneStrings = <String>[
    "When its dark, put the cat out",
    "Never eat yellow snow",
    "Fuck the monks!",
    "Fish for sardines",
    "Ride your motorbike",
    "Sausages for breakfast...",
    "Sausages for tea...",
    "Crivens!!",
  ];

  // can I do this?
  final rnd = Random();

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  void _decrementCounter() {
    setState(() {
      _counter--;
    });
  }

  void _setSequentialFortune() {
    // 6.1: this updates a STATEFUL widget property. Aside: IF a given widget has the SAME property name,
    // would this outer scope function update both independently?
    // let's see...
    setState(() {
      _currFortune = _fortuneStrings[_counter % _fortuneStrings.length];
    });
  }

  void _setRandomFortune() {
    setState(() {
      // see https://stackoverflow.com/questions/13318207/how-to-get-a-random-number-from-range-in-dart
      _rndFortune = _fortuneStrings[rnd.nextInt(_fortuneStrings.length)];
      print("New fortune: $_rndFortune");
    });
    // setState(() {
    //   _rndFortune = "$_rndFortune XXX";
    // });
  }

  void _triggerAddMethods() {
    _incrementCounter();
    _setSequentialFortune();
    _setRandomFortune();
  }

  void _triggerSubtractMethods() {
    _decrementCounter();
    _setSequentialFortune();
    _setRandomFortune();
  }

  void _resetCounter() {
    setState(() {
      _counter = 0;
    });
  }

  // the build method is called whenever a setState() is triggered, thus redrawing the widget
  @override
  Widget build(BuildContext context) {
    print("rebuilding MyHomePage widget");
    // `Scaffold` is the root of the display hierarchy
    return Scaffold(
      appBar: AppBar(
        // he removes this in # 5.9
        // backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        // title: Text("Fortune Cookies!"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            test,
            test,
            // 5.10 - adding an image:
            Image.asset(
              "assets/images/snaggletooth.jpg",
              width: 80,
              height: 80,
              fit: BoxFit.cover,
            ),
            // He says:
            Text(
              "Your fortune is:",
              style: TextStyle(fontFamily: "monospace", fontSize: 22),
            ),

            // NOTE he mentions that `ctrl/.` will open a context menu. It doesnt...
            // UPDATE: This is actually a conflict with key combo defined for another application (no idea which),
            // so I updated VS Code keybindings to use CTRL+SHIFT+Q

            // https://stackoverflow.com/questions/71997823/ctrl-dot-makes-e-appear-instead-of-showing-suggestions-in-vscode-on-gnome
            // It's 'Quick fix' from command pallette - offers - um - quick fixes (here, to wrap the widget in another widget)
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Card(
                child: Text(_currFortune), // from setState instead.
              ),
            ),
            Card(
              child: Text(_rndFortune), // from setState instead.
            ),
            Card(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  '$_counter',
                  // can obviously use different styles here...
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
              ),
            ),
            // 5.9: He's also adding an ElevatedButton:
            ElevatedButton(onPressed: _resetCounter, child: Text("Reset")),
          ],
        ),
      ),

      // https://medium.com/codechai/drawer-and-persistent-footer-buttons-in-flutter-d406601fbfa7
      persistentFooterButtons: <Widget>[
        TextButton(
          onPressed: _triggerSubtractMethods,
          child: const Icon(Icons.remove),
        ),
        TextButton(onPressed: _triggerAddMethods, child: const Icon(Icons.add)),
      ],

      // https://stackoverflow.com/questions/55166999/how-to-make-two-floating-action-buttons-in-flutter
      // floatingActionButton property can accept other than FloatingActionButton:
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // and HERE we can put FloatingActionButtons
          FloatingActionButton(
            onPressed: _triggerSubtractMethods,
            tooltip: 'Decrement',
            child: const Icon(Icons.remove),
          ),
          FloatingActionButton(
            onPressed: _triggerAddMethods,
            tooltip: 'Increment',
            child: const Icon(Icons.add),
          ),
        ],
      ),
      // Can only actually be ONE floatingActionButton property! Hence the above..
    );
  }
}
