import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:latihan_1/login.dart';

class Register extends StatelessWidget {
  const Register({super.key});

  @override
  Widget build(BuildContext context) {
    // Implementasi untuk halaman pendaftaran, misalnya:
    return Scaffold(
      appBar: AppBar(
        title: const Text("Register"),
        backgroundColor: Colors.green,
      ),
      body: const Center(child: Text('Halaman Pendaftaran')),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Register"),
        backgroundColor: Colors.green,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Text(
              "Sign up",
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const Text(
              "Create your account",
              style: TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 30), // Jarak antara informasi dan TextField
            TextField(
              decoration: InputDecoration(
                prefixIcon: Icon(Icons.person),
                labelText: 'User Name',
                hintText: 'Masukkan nama Anda',
                border: OutlineInputBorder(),
              ),
              onChanged: (text) {
                // Aksi yang dijalankan ketika teks berubah
              },
            ),
            const SizedBox(height: 15), // Jarak antara TextField yang satu dan yang lainnya
            TextField(
              decoration: InputDecoration(
                prefixIcon: Icon(Icons.email),
                labelText: 'Email',
                hintText: 'Masukkan Email Anda',
                border: OutlineInputBorder(),
              ),
              onChanged: (text) {
                // Aksi yang dijalankan ketika teks berubah
              },
            ),
            const SizedBox(height: 15), // Jarak antara TextField yang satu dan yang lainnya
            TextField(
              obscureText: true, // Menyembunyikan teks input
              decoration: InputDecoration(
                prefixIcon: Icon(Icons.lock),
                labelText: 'Password',
                hintText: 'Masukkan password Anda',
                border: OutlineInputBorder(),
              ),
              onChanged: (text) {
                // Aksi yang dijalankan ketika teks berubah
              },
            ),
            const SizedBox(height: 15), // Jarak antara TextField yang satu dan yang lainnya
            TextField(
              obscureText: true, // Menyembunyikan teks input
              decoration: InputDecoration(
                prefixIcon: Icon(Icons.lock),
                labelText: 'Confirm Password',
                hintText: 'Confirm password Anda',
                border: OutlineInputBorder(),
              ),
              onChanged: (text) {
                // Aksi yang dijalankan ketika teks berubah
              },
            ),
            const SizedBox(height: 20), // Jarak antara TextField dan tombol
            ElevatedButton(
              onPressed: () {
                // Aksi pendaftaran di sini
              },
              style: ElevatedButton.styleFrom(
                padding: EdgeInsets.symmetric(horizontal: 50, vertical: 15),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
              ),
              child: const Text(
                'Sign up',
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.black,
                ),
              ),
            ),
            const SizedBox(height: 20), // Jarak antara tombol dan baris "OR"
            Row(
              children: <Widget>[
                Expanded(
                  child: Container(
                    margin: const EdgeInsets.only(right: 10.0),
                    child: Divider(
                      color: Colors.black,
                      thickness: 1.0,
                    ),
                  ),
                ),
                const Text('OR'),
                Expanded(
                  child: Container(
                    margin: const EdgeInsets.only(left: 10.0),
                    child: Divider(
                      color: Colors.black,
                      thickness: 1.0,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20), // Jarak antara baris "OR" dan tombol Google
            ElevatedButton(
              onPressed: () {
                // Aksi login dengan Google di sini
              },
              style: ElevatedButton.styleFrom(
                padding: EdgeInsets.symmetric(horizontal: 50, vertical: 15),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
                // primary: Colors.white, // Warna latar belakang tombol
                side: BorderSide(color: Colors.grey.shade300), // Border
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const SizedBox(width: 10),
                  const Text(
                    'Login with Google',
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.black,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20), // Jarak antara tombol Google dan tautan
            TextButton(
              onPressed: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => const loginPage()),
                );
              },
              child: const Text(
                'Already have an account? Log in here',
                style: TextStyle(color: Colors.blue),
              ),
            ),
          ],
        ),
      ),
    );
  }
}