import 'package:flutter/material.dart';

void main() {
  runApp(TemperatureConverterApp());
}

class TemperatureConverterApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Temperature Converter',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: TemperatureConverterScreen(),
    );
  }
}

class TemperatureConverterScreen extends StatefulWidget {
  @override
  _TemperatureConverterScreenState createState() =>
      _TemperatureConverterScreenState();
}

class _TemperatureConverterScreenState
    extends State<TemperatureConverterScreen> {
  double celsius = 0.0;
  double fahrenheit = 32.0;
  double kelvin = 273.15;

  void _convertCelsiusToOthers(double value) {
    setState(() {
      celsius = value;
      fahrenheit = (value * 9 / 5) + 32;
      kelvin = value + 273.15;
    });
  }

  void _convertFahrenheitToOthers(double value) {
    setState(() {
      fahrenheit = value;
      celsius = (value - 32) * 5 / 9;
      kelvin = (value + 459.67) * 5 / 9;
    });
  }

  void _convertKelvinToOthers(double value) {
    setState(() {
      kelvin = value;
      celsius = value - 273.15;
      fahrenheit = (value * 9 / 5) - 459.67;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Temperature Converter'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            TextFormField(
              keyboardType: TextInputType.number,
              onChanged: (value) {
                if (value.isEmpty) {
                  _convertCelsiusToOthers(0.0);
                } else {
                  _convertCelsiusToOthers(double.parse(value));
                }
              },
              decoration: InputDecoration(
                labelText: 'Celsius',
              ),
            ),
            TextFormField(
              keyboardType: TextInputType.number,
              onChanged: (value) {
                if (value.isEmpty) {
                  _convertFahrenheitToOthers(32.0);
                } else {
                  _convertFahrenheitToOthers(double.parse(value));
                }
              },
              decoration: InputDecoration(
                labelText: 'Fahrenheit',
              ),
            ),
            TextFormField(
              keyboardType: TextInputType.number,
              onChanged: (value) {
                if (value.isEmpty) {
                  _convertKelvinToOthers(273.15);
                } else {
                  _convertKelvinToOthers(double.parse(value));
                }
              },
              decoration: InputDecoration(
                labelText: 'Kelvin',
              ),
            ),
          ],
        ),
      ),
    );
  }
}
