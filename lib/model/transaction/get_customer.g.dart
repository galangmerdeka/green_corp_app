// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_customer.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetCustomer _$GetCustomerFromJson(Map<String, dynamic> json) => GetCustomer(
      id: json['id'] as String?,
      nama_usaha: json['nama_usaha'] as String?,
      code_pelanggan: json['pelanggan_code'] as String?,
      nama_pj: json['nama_pj'] as String?,
      jabatan_pj: json['jabatan_pj'] as String?,
      phone_number: json['phone_number'] as String?,
      alamat: json['alamat'] as String?,
    );

Map<String, dynamic> _$GetCustomerToJson(GetCustomer instance) =>
    <String, dynamic>{
      'id': instance.id,
      'nama_usaha': instance.nama_usaha,
      'pelanggan_code': instance.code_pelanggan,
      'nama_pj': instance.nama_pj,
      'jabatan_pj': instance.jabatan_pj,
      'phone_number': instance.phone_number,
      'alamat': instance.alamat,
    };
