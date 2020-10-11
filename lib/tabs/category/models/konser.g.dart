// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'konser.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Konser _$KonserFromJson(Map<String, dynamic> json) {
  return Konser(
    waktu: json['waktu'] as String,
    tanggal: json['tanggal'] as String,
    namaKonser: json['namaKonser'] as String,
    datetimeTanggal: DateTime.parse(json['datetimeTanggal'] as String),
    harga: json['harga'] as int,
    poster: json['poster'] as String,
    deskripsi: json['deskripsi'] as String,
  );
}

Map<String, dynamic> _$KonserToJson(Konser instance) => <String, dynamic>{
      'waktu': instance.waktu,
      'tanggal': instance.tanggal,
      'namaKonser': instance.namaKonser,
      'harga': instance.harga,
      'poster': instance.poster,
      'datetimeTanggal': instance.datetimeTanggal.toIso8601String(),
      'deskripsi': instance.deskripsi,
    };
