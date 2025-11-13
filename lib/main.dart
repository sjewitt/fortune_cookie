import 'dart:math'; // did this auto-import??
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

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

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override // and we override this function to set the State of this new Widget...
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  Text test = const Text("I am a constant text!");
  // int _counter = 0;
  // String _currFortune = "UNOVERRIDDEN";
  // String _rndFortune = "UNOVERRIDDEN";

  // final _fortuneStrings = <String>[
  //   "When its dark, put the cat out",
  //   "Never eat yellow snow",
  //   "Fuck the monks!",
  //   "Fish for sardines",
  //   "Ride your motorbike",
  //   "Sausages for breakfast...",
  //   "Sausages for tea...",
  //   "Crivens!!",
  // ];

  // // can I do this?
  // final rnd = Random();

  // void _incrementCounter() {
  //   setState(() {
  //     _counter++;
  //   });
  // }

  // void _decrementCounter() {
  //   setState(() {
  //     _counter--;
  //   });
  // }

  // void _setSequentialFortune() {
  //   setState(() {
  //     _currFortune = _fortuneStrings[_counter % _fortuneStrings.length];
  //   });
  // }

  // void _setRandomFortune() {
  //   setState(() {
  //     _rndFortune = _fortuneStrings[rnd.nextInt(_fortuneStrings.length)];
  //   });
  // }

  // void _triggerAddMethods() {
  //   _incrementCounter();
  //   _setSequentialFortune();
  //   _setRandomFortune();
  // }

  // void _triggerSubtractMethods() {
  //   _decrementCounter();
  //   _setSequentialFortune();
  //   _setRandomFortune();
  // }

  // void _resetCounter() {
  //   setState(() {
  //     _counter = 0;
  //   });
  // }

  // the build method is called whenever a setState() is triggered, thus redrawing the widget
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
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

      persistentFooterButtons: <Widget>[
        TextButton(
          onPressed: _triggerSubtractMethods,
          child: const Icon(Icons.remove),
        ),
        TextButton(onPressed: _triggerAddMethods, child: const Icon(Icons.add)),
      ],

      // floatingActionButton property can accept other than FloatingActionButton:
      floatingActionButton: Row(
        // possibly a badly named property?
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
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
    );
  }
}
