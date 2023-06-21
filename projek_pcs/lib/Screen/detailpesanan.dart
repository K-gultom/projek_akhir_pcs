import 'package:flutter/material.dart';

class RentalOrderDetail extends StatelessWidget {
  final String gameTitle;
  final String rentalDuration;
  final double totalCost;

  RentalOrderDetail({
    required this.gameTitle,
    required this.rentalDuration,
    required this.totalCost,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Detail Pesanan Sewa'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Judul Game: $gameTitle',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            Text(
              'Durasi Sewa: $rentalDuration',
              style: TextStyle(fontSize: 18),
            ),
            SizedBox(height: 10),
            Text(
              'Total Biaya: \$ $totalCost',
              style: TextStyle(fontSize: 18),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // Tambahkan logika untuk menyimpan pesanan dan melakukan pembayaran di sini
                // ...
              },
              child: Text('Bayar Sekarang'),
            ),
          ],
        ),
      ),
    );
  }
}

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Rental PS',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: RentalOrderDetail(
        gameTitle: 'FIFA 2023',
        rentalDuration: '2 jam',
        totalCost: 25.0,
      ),
    );
  }
}
