import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:projek_pcs/Screen/detailpesanan.dart';

class OrderPage extends StatefulWidget {
  final String id;
  final String namaProduk;
  final String harga;

  OrderPage({required this.id, required this.namaProduk, required this.harga});

  @override
  _OrderPageState createState() => _OrderPageState();
}

class _OrderPageState extends State<OrderPage> {
  String _selectedJaminan = '';
  List<int> _listLamaSewa = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]; // Daftar nilai lama sewa

  final _formKey = GlobalKey<FormState>();
  final TextEditingController _namaController = TextEditingController();
  int? _selectedLamaSewa; // Nilai lama sewa yang dipilih

  double calculateTotalHarga() {
    if (_selectedLamaSewa != null) {
      int lamaSewa = _selectedLamaSewa!;
      double harga = double.tryParse(widget.harga) ?? 0.0;
      return lamaSewa * harga;
    }
    return 0.0;
  }

Future<void> sendDataToMySQL() async {
  if (_formKey.currentState!.validate()) {
    String idProduk = widget.id;
    String namaCustomer = _namaController.text;
    int lamaSewa = _selectedLamaSewa!;
    String jaminan = _selectedJaminan;
    double totalHarga = calculateTotalHarga();

    try {
      final response = await http.post(
        Uri.parse('http://192.168.1.11/db_sewa_ps/pesanan.php'),
        body: {
          'id': idProduk,
          'id_produk': widget.id,
          'nama_customer': namaCustomer,
          'lama_sewa': lamaSewa.toString(),
          'jaminan': jaminan,
          'total_harga': totalHarga.toString(),
        },
      );

      if (response.statusCode == 200) {
        print('Data sent to MySQL successfully');
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => DetailPesanan(
              idProduk: idProduk,
              namaProduk: widget.namaProduk,
              namaCustomer: namaCustomer,
              lamaSewa: lamaSewa,
              jaminan: jaminan,
              totalHarga: totalHarga,
            ),
          ),
        );
      } else {
        print('Error sending data to MySQL. Status code: ${response.statusCode}');
      }
    } catch (error) {
      print('Error sending data to MySQL: $error');
    }
  }
}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Order Page'),
      ),
      body: Padding(
        padding: EdgeInsets.all(20.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Card(
                elevation: 2,
                margin: EdgeInsets.symmetric(horizontal: 16, vertical: 13),
                child: Padding(
                  padding: EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Nama Produk',
                        style: TextStyle(
                          fontSize: 16.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 5.0),
                      Text(
                        widget.namaProduk,
                        style: TextStyle(fontSize: 16.0),
                      ),
                      SizedBox(height: 20.0),
                    ],
                  ),
                ),
              ),
              Card(
                elevation: 2,
                margin: EdgeInsets.symmetric(horizontal: 16, vertical: 13),
                child: Padding(
                  padding: EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Harga',
                        style: TextStyle(
                          fontSize: 16.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 5.0),
                      Text(
                        'Rp ${widget.harga}',
                        style: TextStyle(fontSize: 16.0),
                      ),
                      SizedBox(height: 20.0),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 20.0),
              TextFormField(
                controller: _namaController,
                decoration: InputDecoration(
                  labelText: 'Nama Customer',
                  border: OutlineInputBorder(),
                ),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Nama Customer is required';
                  }
                  return null;
                },
              ),
              SizedBox(height: 20.0),
              DropdownButtonFormField<int>(
                value: _selectedLamaSewa,
                decoration: InputDecoration(
                  labelText: 'Lama Sewa per Hari',
                  border: OutlineInputBorder(),
                ),
                items: _listLamaSewa.map((int value) {
                  return DropdownMenuItem<int>(
                    value: value,
                    child: Text(value.toString()),
                  );
                }).toList(),
                onChanged: (int? value) {
                  setState(() {
                    _selectedLamaSewa = value;
                  });
                },
                validator: (value) {
                  if (value == null) {
                    return 'Lama Sewa per Hari is required';
                  }
                  return null;
                },
              ),
              SizedBox(height: 20.0),
              Text(
                'Jaminan',
                style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),
              ),
              RadioListTile(
                title: Text('KTP'),
                value: 'KTP',
                groupValue: _selectedJaminan,
                onChanged: (value) {
                  setState(() {
                    _selectedJaminan = value.toString();
                  });
                },
              ),
              RadioListTile(
                title: Text('SIM'),
                value: 'SIM',
                groupValue: _selectedJaminan,
                onChanged: (value) {
                  setState(() {
                    _selectedJaminan = value.toString();
                  });
                },
              ),
              SizedBox(height: 30.0),
              Align(
                alignment: Alignment.center,
                child: ElevatedButton(
                  onPressed: sendDataToMySQL,
                  child: Text('Submit'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
