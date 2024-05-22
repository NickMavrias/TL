import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class StatisticsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: const Text(
          'Στατιστικά',
          style: TextStyle(color: Colors.black),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.calendar_today, color: Colors.orange),
            onPressed: () {
              // Calendar button action
            },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            const Text(
              'Εβδομάδας 00/00',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.w300),
            ),
            const SizedBox(height: 8),
            Expanded(
              child: GridView.count(
                crossAxisCount: 2,
                crossAxisSpacing: 8,
                mainAxisSpacing: 8,
                children: [
                  _buildChartContainer(
                    'Ώρες αιχμής',
                    _buildBarChart(),
                  ),
                  _buildChartContainer(
                    'Μέρες αιχμής',
                    _buildBarChart2(),
                  ),
                  _buildChartContainer(
                    'Μ. Χρόνος session',
                    _buildSessionChart(),
                  ),
                  _buildChartContainer(
                    'Αξιολογήσεις',
                    _buildRatingChart(),
                  ),
                ],
              ),
            ),
            SvgPicture.asset('assets/images/logo_telikoCOLOURED-02.svg', width: 80),
          ],
        ),
      ),
    );
  }

  Widget _buildChartContainer(String title, Widget chart) {
    return Container(
      padding: const EdgeInsets.all(4.0),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.orange[900]!, width: 3),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        children: [
          Text(
            title,
            style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          ),
          Expanded(child: chart),
        ],
      ),
    );
  }

  Widget _buildBarChart() {
    return SfCartesianChart(
      backgroundColor: Colors.transparent,
      primaryXAxis: CategoryAxis(
        labelStyle: TextStyle(fontSize: 10),
      ),
      primaryYAxis: NumericAxis(
        labelStyle: TextStyle(fontSize: 10),
      ),
      series: <ChartSeries>[
        ColumnSeries<ChartData, String>(
          color: Colors.orange[900],
          dataSource: _generateChartData(),
          xValueMapper: (ChartData data, _) => data.x,
          yValueMapper: (ChartData data, _) => data.y,
        ),
      ],
    );
  }

  Widget _buildBarChart2() {
    return SfCartesianChart(
      backgroundColor: Colors.transparent,
      primaryXAxis: CategoryAxis(
        labelStyle: TextStyle(fontSize: 10),
      ),
      primaryYAxis: NumericAxis(
        labelStyle: TextStyle(fontSize: 10),
      ),
      series: <ChartSeries>[
        ColumnSeries<ChartData, String>(
          color: Colors.orange[900],
          dataSource: _generateChartData2(),
          xValueMapper: (ChartData data, _) => data.x,
          yValueMapper: (ChartData data, _) => data.y,
        ),
      ],
    );
  }

  Widget _buildSessionChart() {
    return SfCartesianChart(
      backgroundColor: Colors.transparent,
      primaryXAxis: CategoryAxis(
        labelStyle: TextStyle(fontSize: 10),
      ),
      primaryYAxis: NumericAxis(
        labelStyle: TextStyle(fontSize: 10),
      ),
      series: <ChartSeries>[
        BarSeries<ChartData, String>(
          color: Colors.orange[900],
          dataSource: _generateSessionData(),
          xValueMapper: (ChartData data, _) => data.x,
          yValueMapper: (ChartData data, _) => data.y,
        ),
      ],
    );
  }

  Widget _buildRatingChart() {
    return SfCartesianChart(
      backgroundColor: Colors.transparent,
      primaryXAxis: CategoryAxis(
        labelStyle: TextStyle(fontSize: 10),
      ),
      primaryYAxis: NumericAxis(
        labelStyle: TextStyle(fontSize: 10),
      ),
      series: <ChartSeries>[
        BarSeries<ChartData, String>(
          color: Colors.orange[900],
          dataSource: _generateRatingData(),
          xValueMapper: (ChartData data, _) => data.x,
          yValueMapper: (ChartData data, _) => data.y,
        ),
      ],
    );
  }

  List<ChartData> _generateChartData() {
    return [
      ChartData('9', 5),
      ChartData('11', 15),
      ChartData('13', 10),
      ChartData('15', 12),
      ChartData('17', 20),
      ChartData('19', 25),
      ChartData('21', 10),
    ];
  }

  List<ChartData> _generateChartData2() {
    return [
      ChartData('Δ', 5),
      ChartData('T', 8),
      ChartData('T', 10),
      ChartData('Π', 15),
      ChartData('Π', 20),
      ChartData('Σ', 25),
      ChartData('K', 30),
    ];
  }

  List<ChartData> _generateSessionData() {
    return [
      ChartData('Πρωι. (9-15)', 3),
      ChartData('Απογ. (15-21)', 6),
    ];
  }

  List<ChartData> _generateRatingData() {
    return [
      ChartData('Καφές', 3),
      ChartData('Φαγητό', 5),
      ChartData('Σέρβις', 4),
      ChartData('Καθαρότητα', 4),
      ChartData('Άνεση', 3),
      ChartData('Συνολικά', 4),
    ];
  }
}

class ChartData {
  final String x;
  final double y;

  ChartData(this.x, this.y);
}
