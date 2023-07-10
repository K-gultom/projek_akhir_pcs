import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class RiwayatOrder extends StatefulWidget {
  const RiwayatOrder({Key? key}) : super(key: key);

  @override
  State<RiwayatOrder> createState() => _RiwayatOrderState();
}

class _RiwayatOrderState extends State<RiwayatOrder> {
  List<Map<String, dynamic>> _get = [];

  @override
  void initState() {
    super.initState();
    _getriwayatorder();
  }

  Future<void> _getriwayatorder() async {
    try {
      final response =
          await http.get(Uri.parse("http://192.168.1.11/db_sewa_ps/getriwayatorder.php"));

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
          'Riwayat Order',
          style: TextStyle(
            color: Colors.white,
          ),
        ),
        backgroundColor: Colors.blue,
      ),
      body: _get.isNotEmpty
          ? ListView.builder(
              itemCount: _get.length,
              itemBuilder: (context, index) {
                return Card(
                  elevation: 2,
                  margin: EdgeInsets.symmetric(horizontal: 16, vertical: 13),
                  child: ListTile(
                    leading: Icon(Icons.videogame_asset),
                    title: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          '${_get[index]['nama_produk']}', // Mengakses properti 'nama_produk'
                          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                        ),
                        SizedBox(height: 5),
                        Text(
                          'Nama Costumer: ${_get[index]['nama_customer']}', // Menampilkan 'nama_costumer'
                          style: TextStyle(fontSize: 14),
                        ),
                        Text(
                          'Harga Sewa: Rp ${_get[index]['harga']} per Hari', // Mengakses properti 'harga'
                          style: TextStyle(fontSize: 14),
                        ),
                        Text(
                          'Lama Sewa: ${_get[index]['lama_sewa']} Hari', // Menampilkan 'lama_sewa'
                          style: TextStyle(fontSize: 14),
                        ),
                        Text(
                          'Jaminan: ${_get[index]['jaminan']}', // Menampilkan 'jaminan'
                          style: TextStyle(fontSize: 14),
                        ),
                        Text(
                          'Total Harga: Rp ${_get[index]['total_harga']}', // Menampilkan 'total_harga'
                          style: TextStyle(fontSize: 14),
                        ),
                      ],
                    ),
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
                BottomNavigationBarItem(
                  icon: Icon(Icons.logout),
                  label: 'Logout',
                ),
              ],
              selectedItemColor: Colors.blue, // Menentukan warna item yang dipilih
              currentIndex: 1, // Indeks dari item yang dipilih, di sini kita gunakan 1 untuk 'Riwayat Order'
              onTap: (int index) {
                // Handle navigation based on index
                if (index == 0) {
                  // Navigate to Home screen
                  Navigator.pushReplacementNamed(context, '/home');
                } else if (index == 1) {
                  // Navigate to Riwayat Order screen
                  Navigator.pushNamed(context, '/riwayatorder');
                } else if (index == 2) {
                  // Perform logout
                  Navigator.pushReplacementNamed(context, '/login');
                }
              },
            ),
      );
  }
}