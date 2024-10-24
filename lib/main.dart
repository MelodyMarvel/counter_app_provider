import 'package:counter_app_with_provider/provider/counter_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(create: (_) => Counter(),
     child: MaterialApp(     
      home: const MyHomePage(),
    )
    );
   
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  // int _counter = 0;

  // void _incrementCounter() {
  //   setState(() {
  //     _counter++;
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    // final counterProvider = Provider.of<Counter>(context);
    return Consumer<Counter>(builder: (context, value, child){
      return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: Center(
        child: Column(  
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
             
                Text(
                  'Welcome ${value.name}',
                ),
            
              SizedBox(
                height: 20,
              ),
              ElevatedButton(
                  onPressed: () => value.updateName(),
                  child: Text('Click')),
            const Text(
              'You have pushed the button this many times:',
            ),
            Text(
              value.count.toString(),
              style: Theme.of(context).textTheme.headlineMedium,
            ),
           
          ],
        ),
      ),
     
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          FloatingActionButton(
            onPressed: () => value.increment(),
            tooltip: 'Increment',
            child: const Icon(Icons.add),
          ),
          SizedBox(width: 5,),

           FloatingActionButton(
        onPressed: () => value.decrement(),
        tooltip: 'Decrement',
        child: const Icon(Icons.exposure_minus_1),
      ),
        ],
      ), 
       // This trailing comma makes auto-formatting nicer for build methods.
    );
    }
    );
    
  }
}