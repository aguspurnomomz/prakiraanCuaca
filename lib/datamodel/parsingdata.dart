class dataKota {
  final String kota;
  final String deskripsi;

  dataKota({ this.kota, this.deskripsi});

  dataKota.fromJson(Map json) : kota = json['name'], deskripsi = json['description'];
}