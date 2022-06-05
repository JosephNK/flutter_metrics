import 'package:flutter/material.dart';
import 'package:flutter_metrics/flutter_metrics.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await MetricsApp.ensureInitialized();

  runApp(
    MetricsApp(
      child: const MyApp(),
      defaultMetric: const Metric(1.0),
      metrics: const [
        Metric(0.5),
        Metric(1.0),
        Metric(2.0),
      ],
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(
        title: 'Flutter Metrics Demo',
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              const Text(
                'Not Apply Metric Text',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              const Text(
                'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book',
              ),
              const SizedBox(height: 10.0),
              const Text(
                'Apply Metric Text',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              Text(
                'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book',
                textScaleFactor: context.metric.value,
              ),
            ],
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            FloatingActionButton(
              onPressed: () {
                context.setMetric(const Metric(0.5));
              },
              child: const Text('0.5'),
            ),
            FloatingActionButton(
              onPressed: () {
                context.setMetric(const Metric(1.0));
              },
              child: const Text('1.0'),
            ),
            FloatingActionButton(
              onPressed: () {
                context.setMetric(const Metric(2.0));
              },
              child: const Text('2.0'),
            )
          ],
        ),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
