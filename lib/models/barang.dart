class Barang {
  final String id;
  final String kdBarang;
  final String nama;
  final String merek;
  final String harga;
  final String stok;
  final String image;

  Barang({
    required this.id,
    required this.kdBarang,
    required this.nama,
    required this.merek,
    required this.harga,
    required this.stok,
    required this.image,
  });

  factory Barang.fromJson(Map<String, dynamic> json) {
    return Barang(
      id: json['id'] ?? '',
      kdBarang: json['kd_barang'] ?? '',
      nama: json['nama'] ?? '',
      merek: json['merek'] ?? '',
      harga: json['harga']?.toString() ?? '',
      stok: json['stok']?.toString() ?? '',
      image: json['image'] ?? 'no-image.jpg',
    );
  }
}
