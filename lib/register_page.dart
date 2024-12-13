import 'package:LATIHAN_1/home_page.dart';
import 'package:flutter/material.dart';
class Register extends StatelessWidget {
  const Register({super.key});

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmpasswordController =
      TextEditingController();

  void _tampil() {
    String username = _usernameController.text;
    String email = _emailController.text;
    String password = _passwordController.text;
    String confirm = _confirmpasswordController.text;

    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text("Data Akun"),
            content: Text(
                "Username: $username, email: $email, password: $password, confirm: $confirm"),
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Register"),
        backgroundColor: Colors.blueAccent,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
         child: Center(
          child: SingleChildScrollView(
          child: Column(
           mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              "Silahkan Masukkan Data Diri Anda",
              style: TextStyle(
               fontSize: 24,
               fontWeight: FontWeight.bold
               ),
            ),
            const SizedBox(height: 30), // Jarak antara informasi dan TextField
            TextField(
              controller: _usernameController,
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
            const SizedBox(
                height:
                    15), // Jarak antara TextField yang satu dan yang lainnya
            TextField(
              controller: _emailController,
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
            const SizedBox(
                height:
                    15), // Jarak antara TextField yang satu dan yang lainnya
            TextField(
              controller: _passwordController,
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
            const SizedBox(
                height:
                    15), // Jarak antara TextField yang satu dan yang lainnya
            TextField(
              controller: _confirmpasswordController,
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
                String username = _usernameController.text;
                String email = _emailController.text;
                String password = _passwordController.text;
                String confirm = _confirmpasswordController.text;

                if (username.isEmpty ||
                    email.isEmpty ||
                    password.isEmpty ||
                    confirm.isEmpty) {
                } else {
                  // Tambahkan logika navigasi di sini
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) =>
                            Beranda()), // Ganti dengan halaman yang sesuai
                  );
                }
              },
              style: ElevatedButton.styleFrom(
                padding:
                    const EdgeInsets.symmetric(horizontal: 50, vertical: 15),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
              ),
              child: const Text(
                'Register',
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
            const SizedBox(
                height: 20), // Jarak antara baris "OR" dan tombol Google
            ElevatedButton(
              onPressed: () {
                // Aksi login dengan Google di sini
              },
              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 15),
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
          ],
        ),
      ),
      ),
      ),
    );
  }
}


