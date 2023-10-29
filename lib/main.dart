//Paola Andrea Guzmán Aristizábal

import 'package:percent_indicator/percent_indicator.dart';

import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Contador de Calorías',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.lightBlueAccent),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Contador de Calorías'),
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
  int _counter = 0;
  final _pasos = TextEditingController();
  double _calorias = 0.0;
  double _kilometros = 0.0;
  double _porcentaje = 0.0;

  void _calcular() {
    setState(() {
      _kilometros = double.parse(_pasos.text) * 74 / 100000;
      _calorias = double.parse(_pasos.text) * 40 / 1000;
      _porcentaje = double.parse(_pasos.text) / 10000;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              const Text(
                textAlign: TextAlign.center,
                softWrap: true,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                ),
                'Cumplimiento de objetivo \nde pasos diarios',
              ),
              const SizedBox(
                height: 20.0,
              ),
              CircularPercentIndicator(
                animation: true,
                animationDuration: 1000,
                addAutomaticKeepAlive: true,
                radius: 100.0,
                lineWidth: 30.0,
                percent: _porcentaje,
                center: Text(
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 35,
                    ),
                    "${(_porcentaje * 100).toStringAsFixed(1)}%"),
                progressColor: Colors.lightBlueAccent.shade400,
                backgroundColor: Colors.lightBlueAccent.shade100,
              ),
              const SizedBox(
                height: 20.0,
              ),
              const Text(
                textAlign: TextAlign.center,
                softWrap: true,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 14,
                ),
                'Objetivo pasos por día \nsegún  la OMS: 10.000',
              ),
              const SizedBox(
                height: 20.0,
              ),
              TextFormField(
                controller: _pasos,
                keyboardType: TextInputType.number,
                cursorColor: Colors.lightBlueAccent,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.lightBlueAccent,
                      width: 4.0,
                    ),
                  ),
                  labelText: "Ingresa los pasos que diste hoy",
                ),
              ),
              const SizedBox(
                height: 20.0,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  const Icon(
                    Icons.local_fire_department,
                    color: Colors.deepOrange,
                    size: 30.0,
                  ),
                  const SizedBox(
                    width: 8.0,
                  ),
                  Text(
                    textAlign: TextAlign.center,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    ),
                    'Quemaste ${_calorias.toStringAsFixed(1)} calorías',
                  ),
                ],
              ),
              const SizedBox(
                height: 20.0,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  const Icon(
                    Icons.route,
                    color: Colors.black,
                    size: 30.0,
                  ),
                  const SizedBox(
                    width: 8.0,
                  ),
                  Text(
                    textAlign: TextAlign.center,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    ),
                    'Recorriste ${_kilometros.toStringAsFixed(1)} kilómetros',
                  ),
                ],
              ),
              const SizedBox(
                height: 20.0,
              ),
              ElevatedButton(
                style: TextButton.styleFrom(
                  textStyle: const TextStyle(fontSize: 20.0),
                ),
                onPressed: () {
                  _calcular();
                },
                child: const Text(
                    textAlign: TextAlign.center,
                    softWrap: true,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    ),
                    "Calcular"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
