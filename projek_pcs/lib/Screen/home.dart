import 'package:flutter/material.dart';
import 'package:projek_pcs/Screen/order.dart';

// void main() {
//   runApp(MyApp());
// }

// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Halaman Home',
//       theme: ThemeData(
//         primarySwatch: Colors.blue,
//         visualDensity: VisualDensity.adaptivePlatformDensity,
//       ),
//       home: HomePage(),
//     );
//   }
// }

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final List<PlayStation> playStations = [
    PlayStation(name: 'PS4', price: 50),
    PlayStation(name: 'PS5', price: 80),
    PlayStation(name: 'PS4 Pro', price: 60),
    PlayStation(name: 'PS3', price: 40),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Halaman Home',
        style: TextStyle(
          color: Colors.white,
        ),),
        backgroundColor: Colors.blue,
      ),
      body: ListView.builder(
        itemCount: playStations.length,
        itemBuilder: (context, index) {
          return Card(
            elevation: 2,
            margin: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            child: ListTile(
              leading: Icon(Icons.videogame_asset),
              title: Text(
                playStations[index].name,
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
              ),
              subtitle: Text(
                'Harga Sewa: \$${playStations[index].price} per jam',
                style: TextStyle(fontSize: 16),
              ),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) =>OrderPage(),
                  ),
                );
                // showDialog(
                //   context: context,
                //   builder: (BuildContext context) {
                //     return AlertDialog(
                //       title: Text('Detail PS'),
                //       content: Text(
                //           'Anda telah memilih ${playStations[index].name}'),
                //       actions: [
                //         TextButton(
                //           onPressed: () {
                //             Navigator.of(context).pop();
                //           },
                //           child: Text('OK'),
                //         ),
                //       ],
                //     );
                //   },
                // );
              },
            ),
          );
        },
      ),
    );
  }
}

class PlayStation {
  final String name;
  final double price;

  PlayStation({required this.name, required this.price});
}
