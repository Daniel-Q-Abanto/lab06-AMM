import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Calendario Noviembre 2024'),
          centerTitle: true,
          backgroundColor: Colors.teal, 
        ),
        body: const SimpleCalendar(),
      ),
    );
  }
}

class SimpleCalendar extends StatelessWidget {
  const SimpleCalendar({super.key});

  final int selectedDay = 17; 

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: [
          
          Text(
            'Noviembre 2024',
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: Colors.teal[800], 
            ),
          ),
          const SizedBox(height: 20),
          
          Row(
            children: const [
              Expanded(child: Center(child: Text('Dom', style: TextStyle(fontWeight: FontWeight.bold)))),
              Expanded(child: Center(child: Text('Lun', style: TextStyle(fontWeight: FontWeight.bold)))),
              Expanded(child: Center(child: Text('Mar', style: TextStyle(fontWeight: FontWeight.bold)))),
              Expanded(child: Center(child: Text('Mie', style: TextStyle(fontWeight: FontWeight.bold)))),
              Expanded(child: Center(child: Text('Jue', style: TextStyle(fontWeight: FontWeight.bold)))),
              Expanded(child: Center(child: Text('Vie', style: TextStyle(fontWeight: FontWeight.bold)))),
              Expanded(child: Center(child: Text('Sab', style: TextStyle(fontWeight: FontWeight.bold)))),
            ],
          ),
          const SizedBox(height: 10),
          // Filas de los días del mes
          Expanded(
            child: Column(
              children: [
                _buildWeek([1, 2, 3, 4, 5, 6, 7]),
                _buildWeek([8, 9, 10, 11, 12, 13, 14]),
                _buildWeek([15, 16, 17, 18, 19, 20, 21]),
                _buildWeek([22, 23, 24, 25, 26, 27, 28]),
                _buildWeek([29, 30, 0, 0, 0, 0, 0]),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildWeek(List<int> week) {
    return Expanded(
      child: Row(
        children: week.map((day) {
          return Expanded(
            child: Container(
              margin: const EdgeInsets.all(4.0),
              decoration: BoxDecoration(
                color: day == selectedDay
                    ? Colors.teal.withOpacity(0.5) 
                    : Colors.grey[200], 
                borderRadius: BorderRadius.circular(8.0),
                border: day != 0
                    ? Border.all(color: Colors.teal[300]!) 
                    : null, 
              ),
              child: Center(
                child: Text(
                  day != 0 ? day.toString() : '', 
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: day == selectedDay ? Colors.teal[900] : Colors.black87, 
                  ),
                ),
              ),
            ),
          );
        }).toList(),
      ),
    );
  }
}
