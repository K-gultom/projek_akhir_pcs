import 'package:flutter/material.dart';
import 'package:projek_pcs/Screen/login.dart';
import 'Screen/register.dart';
import 'Screen/home.dart';
import 'Screen/detailpesanan.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  get totalHarga => totalHarga;


  @override
  Widget build(BuildContext context) {
    var lamaSewa;
    return MaterialApp(
      title: 'My App',
      debugShowCheckedModeBanner: false, 
      initialRoute: '/login', 
      routes: {
        '/login': (context) => LoginPage(),
        '/home': (context) => HomePage(),
        '/register': (context) => RegisterPage(),
        '/detail_pesanan': (context) => DetailPesanan (idProduk: 'idProduk', jaminan: 'jaminan', lamaSewa: lamaSewa , namaCustomer: 'namaCustomer', totalHarga: totalHarga, namaProduk: '',),
      },
    );
  }
}

