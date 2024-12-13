import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import '../models/barang.dart';

class BarangProvider with ChangeNotifier {
  List<Barang> _barangList = [];
  bool _isLoading = false;

  List<Barang> get barangList => _barangList;
  bool get isLoading => _isLoading;

  Future<void> fetchBarang() async {
    _isLoading = true;
    notifyListeners();

    const url =
        'https://latihan-json.aksi-pintar.com/api/barang'; // Sesuaikan URL API
    try {
      final response = await http.get(Uri.parse(url));
      if (response.statusCode == 200) {
        final responseData = json.decode(response.body);
        if (responseData['status'] == 'success') {
          final List<dynamic> data = responseData['data'];
          _barangList = data.map((item) => Barang.fromJson(item)).toList();
        }
      } else {
        print('Failed to fetch data: ${response.statusCode}');
      }
    } catch (error) {
      print('Error fetching barang: $error');
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  Future<bool> addBarang({
    required String kdBarang,
    required String nama,
    required String merek,
    required int harga,
    required int stok,
  }) async {
    const url =
        'https://latihan-json.aksi-pintar.com/api/tambah-barang'; // Sesuaikan URL API Anda
    try {
      final response = await http.post(
        Uri.parse(url),
        headers: {'Content-Type': 'application/json'},
        body: json.encode({
          'kd_barang': kdBarang,
          'nama': nama,
          'merek': merek,
          'kd_user': 3,
          'harga': harga,
          'stok': stok,
        }),
      );

      final responseData = json.decode(response.body);
      if (response.statusCode == 201 && responseData['status'] == 'success') {
        // Refresh data barang setelah berhasil menambah barang
        await fetchBarang();
        return true;
      } else {
        print('Error: ${responseData['message']}');
        return false;
      }
    } catch (error) {
      print('Error adding barang: $error');
      return false;
    }
  }

  Future<bool> editBarang({
    required String id,
    required String kdBarang,
    required String nama,
    required String merek,
    required int harga,
    required int stok,
  }) async {
    const url =
        'https://latihan-json.aksi-pintar.com/api/update-barang'; // Sesuaikan URL API
    try {
      final response = await http.post(
        Uri.parse('https://latihan-json.aksi-pintar.com/api/update-barang'),
        headers: {'Content-Type': 'application/json'},
        body: json.encode({
          'id': id,
          'kd_barang': kdBarang,
          'nama': nama,
          'merek': merek,
          'kd_user': 3,
          'harga': harga,
          'stok': stok,
        }),
      );

      final responseData = json.decode(response.body);
      if (response.statusCode == 200 && responseData['status'] == 'success') {
        // Refresh data barang setelah berhasil mengedit
        await fetchBarang();
        return true;
      } else {
        print('Error: ${responseData['message']}');
        return false;
      }
    } catch (error) {
      print('Error editing barang: $error');
      return false;
    }
  }

  Future<bool> deleteBarang(String id) async {
    const urlBase =
        'https://latihan-json.aksi-pintar.com/api/hapus-barang'; // Sesuaikan URL API
    try {
      final url = Uri.parse('$urlBase/$id'); // Kirim ID barang di URL
      final response = await http.delete(url);

      if (response.statusCode == 200) {
        final responseData = json.decode(response.body);
        if (responseData['status'] == 'success') {
          // Refresh data barang setelah berhasil menghapus
          await fetchBarang();
          return true;
        } else {
          print('Error: ${responseData['message']}');
          return false;
        }
      } else {
        print('Failed to delete barang: ${response.statusCode}');
        return false;
      }
    } catch (error) {
      print('Error deleting barang: $error');
      return false;
    }
  }
}
