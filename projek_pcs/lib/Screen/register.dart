import 'package:flutter/material.dart';

class RegisterPage extends StatefulWidget {
  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  TextEditingController _nameController = TextEditingController();
  TextEditingController _emailController = TextEditingController();
  TextEditingController _addressController = TextEditingController();
  TextEditingController _phoneController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Register'),
        backgroundColor: Colors.blue, // Ubah warna latar belakang AppBar
      ),
      body: Padding(
        padding: EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextFormField(
              controller: _nameController,
              decoration: InputDecoration(
                labelText: 'Name',
                border: OutlineInputBorder(), // Tambahkan border ke input field
                prefixIcon: Icon(Icons.person), // Tambahkan ikon pada input field
              ),
              style: TextStyle(fontSize: 16.0), // Ubah ukuran font input field
            ),
            SizedBox(height: 20.0),
            TextFormField(
              controller: _emailController,
              decoration: InputDecoration(
                labelText: 'Email',
                border: OutlineInputBorder(),
                prefixIcon: Icon(Icons.email),
              ),
              style: TextStyle(fontSize: 16.0),
            ),
            SizedBox(height: 20.0),
            TextFormField(
              controller: _addressController,
              decoration: InputDecoration(
                labelText: 'Address',
                border: OutlineInputBorder(),
                prefixIcon: Icon(Icons.home),
              ),
              style: TextStyle(fontSize: 16.0),
            ),
            SizedBox(height: 20.0),
            TextFormField(
              controller: _phoneController,
              decoration: InputDecoration(
                labelText: 'Phone Number',
                border: OutlineInputBorder(),
                prefixIcon: Icon(Icons.phone),
              ),
              style: TextStyle(fontSize: 16.0),
            ),
            SizedBox(height: 20.0),
            TextFormField(
              controller: _passwordController,
              decoration: InputDecoration(
                labelText: 'Password',
                border: OutlineInputBorder(),
                prefixIcon: Icon(Icons.lock),
              ),
              style: TextStyle(fontSize: 16.0),
              obscureText: true,
            ),
            SizedBox(height: 30.0),
            ElevatedButton(
              onPressed: () {
                // Perform registration logic here
                String name = _nameController.text;
                String email = _emailController.text;
                String address = _addressController.text;
                String phone = _phoneController.text;
                String password = _passwordController.text;

                // Add your registration logic or API calls here

                // Navigate to home page after successful registration
                Navigator.pushReplacementNamed(context, '/home');
              },
              child: Text(
                'Register',
                style: TextStyle(fontSize: 18.0),
              ),
              style: ElevatedButton.styleFrom(
                padding: EdgeInsets.symmetric(horizontal: 40.0, vertical: 15.0), // Ubah padding tombol
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8.0), // Ubah radius border tombol
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
