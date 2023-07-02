import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:projek_pcs/home.dart';
import 'dart:convert';
import 'register.dart';
import 'package:projek_pcs/home.dart';



class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  // TextEditingController _emailController = TextEditingController();
  // TextEditingController _passwordController = TextEditingController();

  // Future<void> _loginUser() async {
  //   String email = _emailController.text;
  //   String password = _passwordController.text;

  //   var url = Uri.parse('http://192.168.1.21/db_sewa_ps/login.php');
  //   var response = await http.post(
  //     url,
  //     body: {
  //       'email': email,
  //       'password': password,
  //     },
  //   );

  //   if (response.statusCode == 200) {
  //     var data = json.decode(response.body);
  //     if (data == 'success') {
  //       // Login berhasil
  //       Navigator.pushReplacementNamed(context, '/home');
  //     } else {
  //       // Login gagal
  //       showDialog(
  //         context: context,
  //         builder: (BuildContext context) {
  //           return AlertDialog(
  //             title: Text('Login Failed'),
  //             content: Text('Invalid email or password'),
  //             actions: [
  //               TextButton(
  //                 child: Text('OK'),
  //                 onPressed: () {
  //                   Navigator.of(context).pop();
  //                 },
  //               ),
  //             ],
  //           );
  //         },
  //       );
  //     }
  //   } else {
  //     showDialog(
  //       context: context,
  //       builder: (BuildContext context) {
  //         return AlertDialog(
  //           title: Text('Error'),
  //           content: Text('Failed to connect to server'),
  //           actions: [
  //             TextButton(
  //               child: Text('OK'),
  //               onPressed: () {
  //                 Navigator.of(context).pop();
  //               },
  //             ),
  //           ],
  //         );
  //       },
  //     );
  //   }
  // }

  // void _goToRegisterPage() {
  //   Navigator.push(
  //     context,
  //     MaterialPageRoute(builder: (context) => RegisterPage()),
  //   );
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   backgroundColor: Colors.blue,
      //   title: Text('Rudi PS'),
      // ),
      body: Padding(
        padding: EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextFormField(
              // controller: _emailController,
              decoration: InputDecoration(labelText: 'Username'),
              style: TextStyle(fontSize: 16.0),
            ),
            SizedBox(height: 20.0),
            TextFormField(
              // controller: _passwordController,
              decoration: InputDecoration(
                labelText: 'Password',
              ),
              style: TextStyle(fontSize: 16.0),
              obscureText: true,
            ),
            SizedBox(height: 30.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  // onPressed: _loginUser,
                  onPressed: () {
                    Navigator.pushNamed(context, '/home');
                  },
                  child: Text(
                    'Login',
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
          ],
        ),
      ),
    );
  }
}
