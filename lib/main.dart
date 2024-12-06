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
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
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
  TextEditingController weightController = TextEditingController();
  TextEditingController heightController = TextEditingController();
  double result = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text('BMI CALCULATOR'),
      ),
      body: Column(children: [
        const SizedBox(
          height: 20,
        ),
        TextField(
          controller: weightController,
          decoration: InputDecoration(
            labelText: "Enter your weight kg(s)",
          ),
        ),
        const SizedBox(
          height: 20,
        ),
        TextField(
          controller: heightController,
          decoration: InputDecoration(
            labelText: "Enter your height in m(s)",
          ),
        ),
        const SizedBox(
          height: 20,
        ),
        ElevatedButton(
          onPressed: () {
            double weight = double.parse(weightController.text);
            double height = double.parse(heightController.text);
            result = weight / (height * height);
            print("weight:$weight");
            print("height:$height");
            print("result:$result");
            setState(() {});
          },
          child: Text("Calculated BMI"),
        ),
        const SizedBox(
          height: 20,
        ),
        result == 0 
        ? const Text("Your BMI isNot calculated yet")
        :result <18.5
        ? const Text("Your BMI is underweight")
        :result <25
        ? const Text("Your BMI is Normal")
        :result <30
        ? const Text("Your BMI is OverWeight")
        :const Text("Your BMI is obese"),
        
        Container(
          height: 100,
          width: 100,
          color: Colors.amber,
          child:  Center(child: Text("BMI score :${result.toStringAsFixed(2)}")),
        ),
        
      ]),
    );
  }
}
