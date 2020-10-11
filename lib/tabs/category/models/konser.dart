import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:json_annotation/json_annotation.dart';
part 'konser.g.dart';

@JsonSerializable(nullable: false)
class Konser {
  final String waktu;
  final String tanggal;
  final String namaKonser;
  final int harga;
  final String poster;
  final DateTime datetimeTanggal;
  final bool sudahBeli;
  final String deskripsi;

  Konser(
      {this.waktu,
      this.tanggal,
      this.namaKonser,
      this.datetimeTanggal,
      this.harga,
      this.poster,
      this.deskripsi,
      this.sudahBeli});
  factory Konser.fromJson(Map<String, dynamic> json) => _$KonserFromJson(json);
  factory Konser.fromFireStore(DocumentSnapshot doc) {
    Map data = doc.data();
    return Konser(
        waktu: data['genre'],
        tanggal: data['genre'],
        namaKonser: data['genre'],
        harga: data['g'],
        poster: data['genre'],
        sudahBeli: data['genre'],
        deskripsi: data['genre']);
  }
  Map<String, dynamic> toJson() => _$KonserToJson(this);
}
