import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:projek_pcs/Screen/order.dart';
import 'package:http/http.dart' as http;

class HomePage extends StatefulWidget {
  const HomePage({Key? key});

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Map<String, dynamic>> _get = [];

  @override
  void initState() {
    super.initState();
    _getData();
  }

  Future<void> _getData() async {
    try {
      final response = await http.get(Uri.parse("http://192.168.1.7/db_sewa_ps/getdata.php"));
          
    print(response);

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);

        setState(() {

          _get = List<Map<String, dynamic>>.from(data);

        });
        
      }
    } catch (e) {
      print(e);
    }
    
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Home',
          style: TextStyle(
            color: Colors.white,
          ),
        ),
        backgroundColor: Colors.blue,
      ),
      body: _get.isNotEmpty ?
          ListView.builder(
            itemCount: _get.length,
            itemBuilder: (context, index) {
              return Card(
                elevation: 2,
                margin: EdgeInsets.symmetric(horizontal: 16, vertical: 13),
                child: ListTile(
                  leading: Icon(Icons.videogame_asset),
                  title: Text(
                    '${_get[index]['nama_produk']}', // Mengakses properti 'nama_produk'
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                  ),
                  subtitle: Text(
                    'Harga Sewa: Rp ${_get[index]['harga']} per Hari', // Mengakses properti 'harga'
                    style: TextStyle(fontSize: 14),
                  ),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => OrderPage(
                          id: _get[index]['id'],
                        ),
                      ),
                    );
                  },
                ),
              );
            },
          )
        : const Center(
              child: Text(
                "No Data Available",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
        
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.history),
            label: 'Riwayat Order',
          ),
        ],
        onTap: (int index) {
          // Handle navigation based on index
          if (index == 0) {
            // Navigate to Home screen
            // Navigator.pushReplacementNamed(context, '/home');
            Navigator.pushNamed(context, '/home');
          } else if (index == 1) {
            // Navigate to Riwayat Order screen
            // Navigator.pushNamed(context, '/home');
          }
        },
      ),
    );
  }
}
