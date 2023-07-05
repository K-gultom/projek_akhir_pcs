import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

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

  final _formKey = GlobalKey<FormState>();

  Future<void> _registerUser() async {
    String name = _nameController.text;
    String email = _emailController.text;
    String address = _addressController.text;
    String phone = _phoneController.text;
    String password = _passwordController.text;

    if (_formKey.currentState!.validate()) {
<<<<<<< HEAD
      var url = Uri.parse('http://192.168.3.16/db_sewa_ps/register.php');
=======
      var url = Uri.parse('http://192.168.94.203/db_sewa_ps/register.php');
>>>>>>> 9c5351291589dcaed1cb08e92cb3d3063ee34be4

     
      var emailCheckResponse = await http.post(
<<<<<<< HEAD
        Uri.parse('http://192.168.3.16/db_sewa_ps/check_email.php'),
=======
        Uri.parse('http://192.168.94.203/db_sewa_ps/check_email.php'),
>>>>>>> 9c5351291589dcaed1cb08e92cb3d3063ee34be4
        body: {'email': email},
      );

      if (emailCheckResponse.statusCode == 200) {
        if (emailCheckResponse.body == 'exists') {
          print('Email already registered');
          return;
        }
      } else {
        print('Email check failed: ${emailCheckResponse.body}');
        return; 
      }

<<<<<<< HEAD
      try {
          // Continue with the registration process if email is not registered
        var response = await http.post(
          url,
          body: {
            'name': name,
            'email': email,
            'address': address,
            'phone': phone,
            'password': password,
          },
        );
=======
      
      var response = await http.post(
        url,
        body: {
          'name': name,
          'email': email,
          'address': address,
          'phone': phone,
          'password': password,
        },
      );
>>>>>>> 9c5351291589dcaed1cb08e92cb3d3063ee34be4

        if (response.statusCode == 200) {
          print('Registration successful');
          Navigator.pushReplacementNamed(context, '/login');
        } else {
          print('Registration failed: ${response.body}');
        }
      } catch (e) {
        print(e);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Register'),
        backgroundColor: Colors.blue,
      ),
      body: Padding(
        padding: EdgeInsets.all(20.0),
        child: SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextFormField(
                  controller: _nameController,
                  decoration: InputDecoration(
                    labelText: 'Name',
                    border: OutlineInputBorder(),
                    prefixIcon: Icon(Icons.person),
                  ),
                  style: TextStyle(fontSize: 16.0),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Please enter your name';
                    }
                    return null;
                  },
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
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Please enter your email';
                    }
                    return null;
                  },
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
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Please enter your address';
                    }
                    return null;
                  },
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
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Please enter your phone number';
                    }
                    return null;
                  },
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
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Please enter a password';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 30.0),
                ElevatedButton(
                  onPressed: _registerUser,
                  child: Text(
                    'Register',
                    style: TextStyle(fontSize: 18.0),
                  ),
                  style: ElevatedButton.styleFrom(
                    padding:
                        EdgeInsets.symmetric(horizontal: 40.0, vertical: 15.0),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
