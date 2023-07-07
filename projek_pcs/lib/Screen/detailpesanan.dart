import 'package:flutter/material.dart';

class DetailPesanan extends StatelessWidget {
  final String id;
  final String namaProduk;
  final String namaCustomer;
  final int lamaSewa;
  final String jaminan;
  final double totalHarga;

  DetailPesanan({
    required this.id,
    required this.namaProduk,
    required this.namaCustomer,
    required this.lamaSewa,
    required this.jaminan,
    required this.totalHarga,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Detail Pesanan'),
      ),
      body: Padding(
        padding: EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'ID Pesanan: $id',
              style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10.0),
            Text(
              'Nama Produk: $namaProduk',
              style: TextStyle(fontSize: 16.0),
            ),
            SizedBox(height: 10.0),
            Text(
              'Nama Customer: $namaCustomer',
              style: TextStyle(fontSize: 16.0),
            ),
            SizedBox(height: 10.0),
            Text(
              'Lama Sewa: $lamaSewa hari',
              style: TextStyle(fontSize: 16.0),
            ),
            SizedBox(height: 10.0),
            Text(
              'Jaminan: $jaminan',
              style: TextStyle(fontSize: 16.0),
            ),
            SizedBox(height: 10.0),
            Text(
              'Total Harga: Rp $totalHarga',
              style: TextStyle(fontSize: 16.0),
            ),
          ],
        ),
      ),
    );
  }
}
