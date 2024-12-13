// import 'package:flutter/material.dart';
// import 'package:shared_preferences/shared_preferences.dart';

// class Setting extends StatelessWidget {
//   const Setting({super.key});

//  @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       debugShowCheckedModeBanner: false,
//       home: ColorChangerScreen(),
//     );
//   }
// }

// class ColorChangerScreen extends StatefulWidget {
//   @override
//   _ColorChangerScreenState createState() => _ColorChangerScreenState();
// }

// class _ColorChangerScreenState extends State<ColorChangerScreen> {
//   Color _backgroundColor = Colors.white;

//   @override
//   void initState() {
//     super.initState();
//     _loadBackgroundColor();
//   }

//   // Memuat warna latar belakang dari SharedPreferences
//   Future<void> _loadBackgroundColor() async {
//     SharedPreferences prefs = await SharedPreferences.getInstance();
//     int? colorValue = prefs.getInt('background_color');
//     if (colorValue != null) {
//       setState(() {
//         _backgroundColor = Color(colorValue);
//       });
//     }
//   }

//   // Menyimpan warna latar belakang ke SharedPreferences
//   Future<void> _saveBackgroundColor(Color color) async {
//     SharedPreferences prefs = await SharedPreferences.getInstance();
//     await prefs.setInt('background_color', color.value);
//   }

//   // Mengganti warna latar belakang
//   void _changeBackgroundColor(Color color) {
//     setState(() {
//       _backgroundColor = color;
//     });
//     _saveBackgroundColor(color);
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: _backgroundColor,
//       appBar: AppBar(
//         title: Text("Change Background Color"),
//       ),
      
//       body: Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             Text(
//               'Pilih warna latar belakang:',
//               style: TextStyle(fontSize: 18),
//             ),
//             SizedBox(height: 20),
//             Wrap(
//               spacing: 10,
//               children: [
//                 ColorButton(color: Colors.red, onPressed: () => _changeBackgroundColor(Colors.red)),
//                 ColorButton(color: Colors.green, onPressed: () => _changeBackgroundColor(Colors.green)),
//                 ColorButton(color: Colors.blue, onPressed: () => _changeBackgroundColor(Colors.blue)),
//                 ColorButton(color: Colors.yellow, onPressed: () => _changeBackgroundColor(Colors.yellow)),
//                 ColorButton(color: Colors.orange, onPressed: () => _changeBackgroundColor(Colors.orange)),
//                 ColorButton(color: Colors.purple, onPressed: () => _changeBackgroundColor(Colors.purple)),
//               ],
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

// // Widget untuk tombol warna
// class ColorButton extends StatelessWidget {
//   final Color color;
//   final VoidCallback onPressed;

//   ColorButton({required this.color, required this.onPressed});

//   @override
//   Widget build(BuildContext context) {
//     return ElevatedButton(
//       onPressed: onPressed,
//       style: ElevatedButton.styleFrom(
//         backgroundColor: color,
//         shape: CircleBorder(),
//         padding: EdgeInsets.all(20),
//       ),
//       child: Container(),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Setting extends StatelessWidget {
  const Setting({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SettingScreen(),
    );
  }
}

class SettingScreen extends StatefulWidget {
  @override
  _SettingScreenState createState() => _SettingScreenState();
}

class _SettingScreenState extends State<SettingScreen> {
  Color _backgroundColor = Colors.blue;
  String _name = '';
  String _email = '';

  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _loadSettings();
  }

  Future<void> _loadSettings() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    int? colorValue = prefs.getInt('background_color');
    String? name = prefs.getString('name');
    String? email = prefs.getString('email');

    setState(() {
      _backgroundColor = colorValue != null ? Color(colorValue) : Colors.white;
      _name = name ?? '';
      _email = email ?? '';
      _nameController.text = _name;
      _emailController.text = _email;
    });
  }

  Future<void> _saveSettings() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    // await prefs.setInt('background_color', _backgroundColor.value);
    await prefs.setString('name', _nameController.text);
    await prefs.setString('email', _emailController.text);
  }

  // void _changeBackgroundColor(Color color) {
  //   setState(() {
  //     _backgroundColor = color;
  //   });
  //   _saveSettings();
  // }

  @override

  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: _backgroundColor,
      appBar: AppBar(
        title: Text("Settings"),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Edit Profile',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            TextField(
              controller: _nameController,
              decoration: InputDecoration(
                labelText: 'Name',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 10),
            TextField(
              controller: _emailController,
              decoration: InputDecoration(
                labelText: 'Email',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                setState(() {
                  _name = _nameController.text;
                  _email = _emailController.text;
                });
                _saveSettings();
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text('Profile updated successfully!')),
                );
              },
              child: Text('Save Profile'),
            ),
            SizedBox(height: 30),
            // Text(
            //   'Change Background Color',
            //   style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            // ),
            SizedBox(height: 10),
            // Wrap(
            //   spacing: 10,
            //   children: [
            //     ColorButton(color: Colors.red, onPressed: () => _changeBackgroundColor(Colors.red)),
            //     ColorButton(color: Colors.green, onPressed: () => _changeBackgroundColor(Colors.green)),
            //     ColorButton(color: Colors.blue, onPressed: () => _changeBackgroundColor(Colors.blue)),
            //     ColorButton(color: Colors.yellow, onPressed: () => _changeBackgroundColor(Colors.yellow)),
            //     ColorButton(color: Colors.orange, onPressed: () => _changeBackgroundColor(Colors.orange)),
            //     ColorButton(color: Colors.purple, onPressed: () => _changeBackgroundColor(Colors.purple)),
            //   ],
            // ),
          ],
        ),
      ),
    );
  }
}

// Widget untuk tombol warna
class ColorButton extends StatelessWidget {
  final Color color;
  final VoidCallback onPressed;

  ColorButton({required this.color, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: color,
        shape: CircleBorder(),
        padding: EdgeInsets.all(20),
      ),
      child: Container(),
    );
  }
}