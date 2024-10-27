import 'package:flutter/material.dart';
import 'package:latihan_1/login_page.dart';
import 'package:latihan_1/register_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Eksplora Rental',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(20.0),
                child: Image.network(
                  'https://th.bing.com/th/id/OIP.GUBn5VOsfnTKkQluSqLKKgHaCE?w=860&h=241&rs=1&pid=ImgDetMain',
                  height: 110.0, //merubah ukuran gambar
                  width: 400.0, //mengatur kecil besarnya gambar
                  fit: BoxFit.cover,
                ),
              ),
              const SizedBox(height: 20.0),
              const Text(
                'Hai, Selamat Datang Di Eksplora Rental',
                style: TextStyle(
                  fontSize: 18.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 20.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => const loginPage()),
                      );
                    },
                    child: const Text('Login'),
                  ),
                  const SizedBox(width: 20.0), // Jarak antara tombol Login dan Register
                  ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const MyHomePage(), // Halaman RegisterPage
                        ),
                      );
                    },
                    child: const Text('Register'),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}