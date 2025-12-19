import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Варіант 1: Конфігуратор',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        useMaterial3: true,
      ),
      home: const ContainerConfigurator(),
    );
  }
}

class ContainerConfigurator extends StatefulWidget {
  const ContainerConfigurator({super.key});

  @override
  State<ContainerConfigurator> createState() => _ContainerConfiguratorState();
}

class _ContainerConfiguratorState extends State<ContainerConfigurator> {
  double _width = 150.0;
  double _height = 150.0;
  double _topRightRadius = 0.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Конфігуратор Контейнера'),
        backgroundColor: Colors.blue[100],
      ),
      body: Column(
        children: [

          Expanded(
            child: Center(
              child: Container(
                width: _width,
                height: _height,
                decoration: BoxDecoration(
                  color: Colors.red,
                  borderRadius: BorderRadius.only(

                    topRight: Radius.circular(_topRightRadius),
                  ),
                ),

                alignment: Alignment.center,
                child: Text(
                  '${_width.toInt()} x ${_height.toInt()}\nR: ${_topRightRadius.toInt()}',
                  textAlign: TextAlign.center,
                  style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
                ),
              ),
            ),
          ),

          Container(
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              color: Colors.grey[200],
              borderRadius: const BorderRadius.vertical(top: Radius.circular(20)),
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Text("Панель налаштувань", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                const Divider(),


                _buildControlRow(
                  label: "Ширина",
                  value: _width,
                  min: 50,
                  max: 300,
                  onChanged: (val) {
                    setState(() {
                      _width = val;
                    });
                  },
                ),

                _buildControlRow(
                  label: "Висота",
                  value: _height,
                  min: 50,
                  max: 300,
                  onChanged: (val) {
                    setState(() {
                      _height = val;
                    });
                  },
                ),

                _buildControlRow(
                  label: "Радіус (верх-право)",
                  value: _topRightRadius,
                  min: 0,
                  max: 150,
                  onChanged: (val) {
                    setState(() {
                      _topRightRadius = val;
                    });
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildControlRow({
    required String label,
    required double value,
    required double min,
    required double max,
    required ValueChanged<double> onChanged,
  }) {
    return Row(
      children: [
        SizedBox(
          width: 80,
          child: Text("$label:\n${value.toInt()}", style: const TextStyle(fontSize: 12)),
        ),
        Expanded(
          child: Slider(
            value: value,
            min: min,
            max: max,
            activeColor: Colors.red,
            onChanged: onChanged,
          ),
        ),
      ],
    );
  }
}