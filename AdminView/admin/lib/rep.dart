import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class RepScreen extends StatelessWidget {
  const RepScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(height: 40),
              SvgPicture.asset('assets/images/logo_telikoCOLOURED-02.svg', height: 120),
              const SizedBox(height: 40),
              _buildMenuButton(context, 'Επίβλεψη report'),
              _buildMenuButton(context, 'Επίβλεψη block'),
              _buildMenuButton(context, 'Εντοπισμός περίεργου υλικού από AI'),
              _buildMenuButton(context, 'Λίστα αποκλεισμένων χρηστών'),
              const Padding(
                padding: EdgeInsets.only(top: 30, bottom: 20),
                child: Text(
                  'Προβολή διαχειριστή',
                  style: TextStyle(color: Colors.grey, fontStyle: FontStyle.italic),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildMenuButton(BuildContext context, String title) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: ElevatedButton(
        onPressed: () => _showDialog(context, title),
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.orange[900],
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        ),
        child: Text(title, style: const TextStyle(color: Colors.white)),
      ),
    );
  }

  void _showDialog(BuildContext context, String title) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          backgroundColor: Colors.orange[900],
          title: Text(title, style: const TextStyle(color: Colors.white)),
          content: SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: ConstrainedBox(
              constraints: BoxConstraints(minWidth: MediaQuery.of(context).size.width),
              child: DataTable(
                columns: const [
                  DataColumn(label: Text('ID', style: TextStyle(color: Colors.white))),
                  DataColumn(label: Text('Όνομα', style: TextStyle(color: Colors.white))),
                  DataColumn(label: Text('Φορές', style: TextStyle(color: Colors.white))),
                  DataColumn(label: Text('Expand', style: TextStyle(color: Colors.white))), // New column for expand
                ],
                rows: [
                  _buildDataRow(context, '934', 'Alex Turner', '7'),
                  _buildDataRow(context, '935', 'Jack White', '5'),
                  _buildDataRow(context, '936', 'Miles Kane', '2'),
                  _buildDataRow(context, '937', 'Jamie Cook', '3'),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  DataRow _buildDataRow(BuildContext context, String id, String name, String reports) {
    return DataRow(
      cells: [
        DataCell(Text(id)),
        DataCell(Text(name)),
        DataCell(Text(reports)),
        DataCell(IconButton(
          icon: Icon(Icons.expand_more, color: Colors.white),
          onPressed: () => _showBanDetails(context, name),
        )),
      ],
    );
  }

  void _showBanDetails(BuildContext context, String userName) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          backgroundColor: Colors.orange[900],
          title: Text("Ban Details for $userName", style: TextStyle(color: Colors.white)),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text("Reasons for Ban", style: TextStyle(color: Colors.white)),
              Text("Harassing", style: TextStyle(color: Colors.white)),
              Text("Spamming", style: TextStyle(color: Colors.white)),
              Text("Using offensive language", style: TextStyle(color: Colors.white)),
              Text("Other violations", style: TextStyle(color: Colors.white)),
            ],
          ),
          actions: <Widget>[
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).pop(); // close the dialog
                // Implement ban logic here
                print("$userName has been banned.");
              },
              style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
              child: const Text('Ban', style: TextStyle(color: Colors.white)),
            ),
          ],
        );
      },
    );
  }
}
