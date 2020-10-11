import 'package:flutter/material.dart';

class Konser {
  final String waktu;
  final String tanggal;
  final String namaKonser;
  final String harga;
  final String poster;
  final String deskripsi;
  final String listArtis;
  final String hargaDenganKonser;

  Konser(
      {this.waktu,
      this.tanggal,
      this.namaKonser,
      this.harga,
      this.hargaDenganKonser,
      this.poster,
      this.deskripsi,
      this.listArtis});
}
