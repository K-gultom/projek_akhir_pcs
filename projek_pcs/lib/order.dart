import 'package:flutter/material.dart';
import 'package:projek_pcs/Screen/detailpesanan.dart';

class OrderPage extends StatefulWidget {
  @override
  _OrderPageState createState() => _OrderPageState();
}

class _OrderPageState extends State<OrderPage> {
  int? _rentalDuration = 1; // Default rental duration

  void _handleRentalDurationChange(int? value) {
    setState(() {
      _rentalDuration = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Order'),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Card(
              elevation: 2.0,
              child: Container(
                height: 200.0,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('assets/images/ps6.jpeg'),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'PS 6',
                    style: TextStyle(
                      fontSize: 18.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 8.0),
                  Text(
                    'Price: Rp 20.000/day ',
                    style: TextStyle(fontSize: 16.0),
                  ),
                  SizedBox(height: 16.0),

                  TextFormField(
                    initialValue: '$_rentalDuration',
                    keyboardType: TextInputType.number,
                    onChanged: (value) {
                      setState(() {
                        _rentalDuration = int.tryParse(value) ?? _rentalDuration;
                      });
                    },
                    decoration: InputDecoration(
                      hintText: 'Masukkan Durasi Rental',
                      labelText: 'Durasi Rental (dalam hari)',
                    ),
                  ),
                  SizedBox(height: 16.0),
                  Text(
                    'Opsi Peminjaman:',
                    style: TextStyle(fontSize: 16.0),
                  ),
                  SizedBox(height: 8.0),
                  RadioListTile(
                    title: Text('Ambil Sendiri'),
                    value: 1,
                    groupValue: _rentalDuration,
                    onChanged: _handleRentalDurationChange,
                  ),
                  RadioListTile(
                    title: Text('Diantar'),
                    value: 2,
                    groupValue: _rentalDuration,
                    onChanged: _handleRentalDurationChange,
                  ),
                  SizedBox(height: 24.0),
                  ElevatedButton(
                    onPressed: () {
                      // Perform rent operation
                       Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => RentalOrderDetail(namaPerangkat: 'PS 6', rentalDuration: '5', totalCost: 100.000, ),
                        ),
                      );
                    },
                    child: Text('Sewa Sekarang'),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
