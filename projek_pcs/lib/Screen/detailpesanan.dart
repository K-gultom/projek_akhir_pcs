import 'package:flutter/material.dart';

class DetailPesanan extends StatelessWidget {
  final String idProduk;
  final String namaProduk;
  final String namaCustomer;
  final int lamaSewa;
  final String jaminan;
  final double totalHarga;

  DetailPesanan({
    required this.idProduk,
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
      body: Container(
        padding: EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Align(
              alignment: Alignment.center,
              child: Text(
                'Nota Sewa Playstation',
                style: TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold),
              ),
            ),
            SizedBox(height: 20.0),
            Text(
              'ID Produk:',
              style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
            ),
            Text(
              idProduk,
              style: TextStyle(fontSize: 18.0),
            ),
            SizedBox(height: 10.0),
            Text(
              'Nama Produk:',
              style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
            ),
            Text(
              namaProduk,
              style: TextStyle(fontSize: 18.0),
            ),
            SizedBox(height: 10.0),
            Text(
              'Nama Customer:',
              style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
            ),
            Text(
              namaCustomer,
              style: TextStyle(fontSize: 18.0),
            ),
            SizedBox(height: 10.0),
            Text(
              'Lama Sewa (Hari):',
              style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
            ),
            Text(
              lamaSewa.toString(),
              style: TextStyle(fontSize: 18.0),
            ),
            SizedBox(height: 10.0),
            Text(
              'Jaminan:',
              style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
            ),
            Text(
              jaminan,
              style: TextStyle(fontSize: 18.0),
            ),
            SizedBox(height: 10.0),
            Text(
              'Total Harga:',
              style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
            ),
            Text(
              'Rp ${totalHarga.toStringAsFixed(0)}',
              style: TextStyle(fontSize: 18.0),
            ),
            SizedBox(height: 40.0),
            Align(
              alignment: Alignment.center,
              child: Text(
                'Terima kasih atas pesanan Anda!',
                style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
              ),
            ),
            Spacer(),
            Align(
              alignment: Alignment.center,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/home');
                },
                style: ElevatedButton.styleFrom(
                  padding:
                      EdgeInsets.symmetric(horizontal: 40.0, vertical: 16.0),
                  primary: Colors.blue,
                  textStyle: TextStyle(fontSize: 20.0),
                ),
                child: Text('Kembali ke Home'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
