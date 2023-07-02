// import 'package:flutter/material.dart';

// void main() {
//   runApp(MyApp());
// }

// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Aplikasi Pemesanan',
//       theme: ThemeData(
//         primarySwatch: Colors.blue,
//       ),
//       home: HomeScreen(),
//     );
//   }
// }

// class HomeScreen extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Beranda'),
//       ),
//       body: Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             Text(
//               'Selamat datang di halaman beranda',
//               style: TextStyle(fontSize: 24),
//             ),
//             Image.asset('assets/images/ps cover.jpg'), // Gambar untuk beranda
//             ElevatedButton(
//               onPressed: () {
//                 // Aksi yang akan dijalankan saat tombol "Pesan Sekarang" ditekan
//                 Navigator.push(
//                   context,
//                   MaterialPageRoute(builder: (context) => OrderScreen()),
//                 );
//               },
//               child: Text('Pesan Sekarang'),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

// class OrderScreen extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Pemesanan'),
//       ),
//       body: Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             Text(
//               'Selamat datang di halaman pemesanan',
//               style: TextStyle(fontSize: 24),
//             ),
//             Image.asset('assets/images/ps cover.jpg'), // Gambar untuk halaman pemesanan
//             ElevatedButton(
//               onPressed: () {
//                 // Aksi yang akan dijalankan saat tombol "Pesan Sekarang" ditekan
//                 print('Tombol Pesan Sekarang ditekan');
//               },
//               child: Text('Pesan Sekarang'),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }