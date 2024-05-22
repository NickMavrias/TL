import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'statistics.dart'; // Assume the statistics page is in this file

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Real Time Table Management',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: const FloorPlanPage(),
    );
  }
}

class FloorPlanPage extends StatefulWidget {
  const FloorPlanPage({Key? key}) : super(key: key);

  @override
  _FloorPlanPageState createState() => _FloorPlanPageState();
}

class _FloorPlanPageState extends State<FloorPlanPage> {
  // Map to keep track of each section's table availability status
  Map<String, Map<String, Color>> sections = {
    'mainSpace': {
      'Π1': Colors.green, 'Π2': Colors.red, 'Π3': Colors.yellow, 'Π4': Colors.green, 'Π5': Colors.green,
      'Κ1': Colors.red, 'Κ2': Colors.red, 'Κ3': Colors.yellow, 'Κ4': Colors.yellow, 'Κ5': Colors.yellow,
    },
    'noTalkZone': {
      'Σ1': Colors.green, 'Σ2': Colors.green, 'Σ3': Colors.green, 'Σ4': Colors.green, 'Σ5': Colors.green,
    },
    'bar': {
      'Μ1': Colors.green, 'Μ2': Colors.red, 'Μ3': Colors.yellow, 'Μ4': Colors.green, 'Μ5': Colors.green,
    }
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Διαχείριση real time'),
      ),
      body: Column(
        children: [
          Expanded(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  flex: 3,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      buildTableSection('Κύριος χώρος', sections['mainSpace']!),
                      buildTableSection('No-talk zone', sections['noTalkZone']!),
                      buildTableSection('Μπαρ', sections['bar']!),
                    ],
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: buildRequestsArea(),
                ),
              ],
            ),
          ),
          Center(child: SvgPicture.asset('assets/images/logo_telikoCOLOURED-02.svg', width: 200)),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              FloatingActionButton(
                heroTag: "btn1",
                onPressed: () {
                  // Navigate to the statistics screen
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => StatisticsPage()),
                  );
                },
                child: const Icon(Icons.pie_chart),
              ),
              const SizedBox(width: 16),
              FloatingActionButton(
                heroTag: "btn2",
                onPressed: () {
                  // Settings logic here
                },
                child: const Icon(Icons.settings),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget buildTableSection(String title, Map<String, Color> tables) {
    return Container(
      margin: const EdgeInsets.all(10),
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.red, width: 3),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(title, style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
          Wrap(
            spacing: 8.0,
            runSpacing: 8.0,
            children: tables.keys.map((id) => buildTable(id, tables[id]!)).toList(),
          ),
        ],
      ),
    );
  }

  Widget buildTable(String id, Color color) {
    return GestureDetector(
      onTap: () {
        setState(() {
          sections.forEach((key, section) {
            if (section.containsKey(id)) {
              section[id] = section[id] == Colors.green ? Colors.yellow :
                             section[id] == Colors.yellow ? Colors.red :
                             Colors.green;
            }
          });
        });
      },
      child: Container(
        width: 50,
        height: 50,
        decoration: BoxDecoration(
          color: color,
          shape: BoxShape.circle,
          border: Border.all(color: Colors.grey),
        ),
        child: Center(
          child: Text(id),
        ),
      ),
    );
  }

  Widget buildRequestsArea() {
    return Container(
      margin: const EdgeInsets.all(10),
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.red, width: 3),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text('Αιτήματα', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
          InkWell(
            onTap: () {
              print('EurG1 - Άμεσα clicked');
            },
            child: Container(
              padding: EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: Colors.orange,
                borderRadius: BorderRadius.circular(5),
              ),
              child: const Text('EurG1 - Άμεσα', style: TextStyle(fontSize: 16)),
            ),
          ),
          InkWell(
            onTap: () {
              print('EurG2 - Αύριο 16:00 clicked');
            },
            child: Container(
              padding: EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: Colors.yellow,
                borderRadius: BorderRadius.circular(5),
              ),
              child: const Text('EurG2 - Αύριο 16:00', style: TextStyle(fontSize: 16)),
            ),
          ),
        ],
      ),
    );
  }
}
