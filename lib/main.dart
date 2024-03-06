import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_app/providers/counter_provider.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => CounterProvider(),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Provider Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Increment/Decrement'),
    );
  }
}

// => MultiProvider(
//       providers: [
//         ChangeNotifierProvider(
//           create: (context) => CounterProvider(),
//         ),
//       ],
//       child: MaterialApp(
//         title: 'Provider Counter',
//         theme: ThemeData(
//           colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
//           useMaterial3: true,
//         ),
//         home: const MyHomePage(title: 'Increment/Decrement w/ Provider'),
//       ),
//     );

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'You have pushed the button this many times:',
            ),
            Consumer<CounterProvider>(
              builder: (context, value, child) {
                return Text('${value.count}');
              },
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                FloatingActionButton(
                  // onPressed: () => counterProvider.increment(),
                  // onPressed: () => context.read<CounterProvider>().increment(),
                  // onPressed: () => counterProvider.increment(),
                  onPressed: () {
                    var provider = context.read<CounterProvider>();
                    provider.increment();
                  },
                  tooltip: 'Increment',
                  child: const Icon(Icons.add),
                ),
                FloatingActionButton(
                  // onPressed: () => counterProvider.decrement(),
                  // onPressed: () => context.read<CounterProvider>().decrement(),
                  // onPressed: () => counterProvider.decrement(),
                  onPressed: () {
                    var provider = context.read<CounterProvider>();
                    provider.decrement();
                  },
                  tooltip: 'Decrement',
                  child: const Icon(Icons.remove),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
