import 'package:flutter/material.dart';
import 'package:latihan_1/setting.dart';

class Beranda extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home Page'),
        backgroundColor: Colors.blueAccent,
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            const DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.blueAccent,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CircleAvatar(
                    radius: 40,
                    backgroundImage: AssetImage('assets/profile.jpg'),
                  ),
                  SizedBox(height: 10),
                  Text(
                    'User Name',
                    style: TextStyle(color: Colors.white, fontSize: 18),
                  ),
                ],
              ),
            ),
            ListTile(
              leading: Icon(Icons.home),
              title: Text('Home'),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: Icon(Icons.settings),
              title: Text('Settings'),
              onTap: () {
                Navigator.pop(context);
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Setting()),
                );
              },
            ),
            ListTile(
              leading: Icon(Icons.logout),
              title: Text('Logout'),
              onTap: () {
                Navigator.popUntil(context, (route) => route.isFirst);
              },
            ),
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Eksplora Rental',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            Row(
              children: [
                Expanded(
                  child: DropdownButtonFormField<String>(
                    decoration: const InputDecoration(
                      labelText: 'Pilih Mobil',
                      border: OutlineInputBorder(),
                    ),
                    items: const [
                      DropdownMenuItem(
                        child: Text("Toyota Avanza"),
                        value: "Toyota Avanza",
                      ),
                      DropdownMenuItem(
                        child: Text("Honda Brio"),
                        value: "Honda Brio",
                      ),
                      DropdownMenuItem(
                        child: Text("Suzuki Ertiga"),
                        value: "Suzuki Ertiga",
                      ),
                      DropdownMenuItem(
                        child: Text("Kia Sportsage"),
                        value: "Kia Sportsage",
                      ),
                    ],
                    onChanged: (value) {
                      // Aksi ketika mobil dipilih
                    },
                  ),
                ),
                SizedBox(width: 10),
                Expanded(
                  child: TextFormField(
                    decoration: const InputDecoration(
                      labelText: 'Waktu (jam)',
                      border: OutlineInputBorder(),
                    ),
                    keyboardType: TextInputType.number,
                    onChanged: (value) {
                      // Aksi ketika waktu diubah
                    },
                  ),
                ),
              ],
            ),
            SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'Harga per jam: Rp20,000',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
                ElevatedButton(
                  onPressed: () {
                    // Aksi ketika tombol "Sewa" ditekan
                  },
                  child: Text('Sewa'),
                ),
              ],
            ),
            SizedBox(height: 20),

            const Text(
              'Semua Jenis Mobil',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            Expanded( // Membungkus GridView dengan Expanded
              child: GridView.count(
                crossAxisCount: 2,
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
                children: [
                  _buildCarCard(
                    imageUrl:
                        'https://th.bing.com/th/id/OIP.0hrjSxYEPq7PMBf_eFIbOwHaEu?rs=1&pid=ImgDetMain',
                    title: 'Toyota Avanza',
                  ),
                  _buildCarCard(
                    imageUrl:
                        'https://th.bing.com/th/id/OIP.AcvftCIVnYDwnfEtWmfMYAHaFj?rs=1&pid=ImgDetMain',
                    title: 'Honda Brio',
                  ),
                  _buildCarCard(
                    imageUrl:
                        'https://th.bing.com/th/id/OIP.Y84esykEmsh_JriI0bB7nQHaEK?rs=1&pid=ImgDetMain',
                    title: 'Suzuki Ertiga',
                  ),
                  _buildCarCard(
                    imageUrl:
                        'https://th.bing.com/th/id/OIP.d6yHD7Rb9bNzorH4OfdsowHaFj?rs=1&pid=ImgDetMain',
                    title: 'Kia Sportage',
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: const BottomAppBar(
        color: Colors.blueAccent,
        shape: CircularNotchedRectangle(),
        child: Padding(
          padding: EdgeInsets.all(5.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(Icons.call, color: Colors.white),
                  Text('Hubungi Kami', style: TextStyle(color: Colors.white)),
                ],
              ),
              Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(Icons.location_on, color: Colors.white),
                  Text('Lokasi', style: TextStyle(color: Colors.white)),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildCarCard({required String imageUrl, required String title}) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            height: 100, // Atur ukuran gambar sesuai kebutuhan
            width: double.infinity,
            child: ClipRRect(
              borderRadius: const BorderRadius.vertical(top: Radius.circular(15)),
              child: Image.network(
                imageUrl,
                fit: BoxFit.cover,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              title,
              style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
          ),
        ],
      ),
    );
  }
}
