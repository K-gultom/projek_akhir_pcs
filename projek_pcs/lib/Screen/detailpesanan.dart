import 'package:flutter/material.dart';

class RentalOrderDetail extends StatelessWidget {
  final String namaPerangkat;
  final String rentalDuration;
  final double totalCost;

  RentalOrderDetail({
    required this.namaPerangkat,
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
              'Perangkat: $namaPerangkat',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            Text(
              'Durasi Sewa: $rentalDuration',
              style: TextStyle(fontSize: 18),
            ),
            SizedBox(height: 10),
            Text(
              'Total Biaya: Rp $totalCost',
              style: TextStyle(fontSize: 18),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // Tambahkan logika untuk menyimpan pesanan dan melakukan pembayaran di sini
                // ...
                // Navigator.of(context).pushNamedAndRemoveUntil('/', (route) => false);
                Navigator.pushNamed(context, '/home');
              },
              child: Text('Home'),
            ),
          ],
        ),
      ),
    );
  }
}
