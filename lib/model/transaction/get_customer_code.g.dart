// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_customer_code.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetCustomerCode _$GetCustomerCodeFromJson(Map<String, dynamic> json) =>
    GetCustomerCode(
      code_pelanggan: json['pelanggan_code'] as String?,
      nama_usaha: json['nama_usaha'] as String?,
      nama_pj: json['nama_pj'] as String?,
      jabatan_pj: json['jabatan_pj'] as String?,
      phone_number: json['phone_number'] as String?,
      provinsi: json['provinsi'] == null
          ? null
          : ProvinceName.fromJson(json['provinsi'] as Map<String, dynamic>),
      provinsi_id: json['provinsi_id'] as String?,
      kabupaten_kota: json['kabupaten_kota'] == null
          ? null
          : KabKotaName.fromJson(
              json['kabupaten_kota'] as Map<String, dynamic>),
      kabupaten_kota_id: json['kabupaten_kota_id'] as String?,
      kecamatan: json['kecamatan'] == null
          ? null
          : KecamatanName.fromJson(json['kecamatan'] as Map<String, dynamic>),
      kecamatan_id: json['kecamatan_id'] as String?,
      alamat: json['alamat'] as String?,
      kategori: json['category'] == null
          ? null
          : CategoryTitle.fromJson(json['category'] as Map<String, dynamic>),
      kategoriBisnis: json['category_bussines'] == null
          ? null
          : CategoryBusinessTitle.fromJson(
              json['category_bussines'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$GetCustomerCodeToJson(GetCustomerCode instance) =>
    <String, dynamic>{
      'pelanggan_code': instance.code_pelanggan,
      'nama_usaha': instance.nama_usaha,
      'nama_pj': instance.nama_pj,
      'jabatan_pj': instance.jabatan_pj,
      'phone_number': instance.phone_number,
      'provinsi': instance.provinsi,
      'provinsi_id': instance.provinsi_id,
      'kabupaten_kota': instance.kabupaten_kota,
      'kabupaten_kota_id': instance.kabupaten_kota_id,
      'kecamatan': instance.kecamatan,
      'kecamatan_id': instance.kecamatan_id,
      'alamat': instance.alamat,
      'category': instance.kategori,
      'category_bussines': instance.kategoriBisnis,
    };

ProvinceName _$ProvinceNameFromJson(Map<String, dynamic> json) => ProvinceName(
      json['provinsi_name'] as String?,
    );

Map<String, dynamic> _$ProvinceNameToJson(ProvinceName instance) =>
    <String, dynamic>{
      'provinsi_name': instance.province_name,
    };

KabKotaName _$KabKotaNameFromJson(Map<String, dynamic> json) => KabKotaName(
      json['kabupaten_kota_name'] as String?,
    );

Map<String, dynamic> _$KabKotaNameToJson(KabKotaName instance) =>
    <String, dynamic>{
      'kabupaten_kota_name': instance.kab_kota_name,
    };

KecamatanName _$KecamatanNameFromJson(Map<String, dynamic> json) =>
    KecamatanName(
      json['kecamatan_name'] as String?,
    );

Map<String, dynamic> _$KecamatanNameToJson(KecamatanName instance) =>
    <String, dynamic>{
      'kecamatan_name': instance.kecamatan_name,
    };

CategoryTitle _$CategoryTitleFromJson(Map<String, dynamic> json) =>
    CategoryTitle(
      json['title'] as String?,
    );

Map<String, dynamic> _$CategoryTitleToJson(CategoryTitle instance) =>
    <String, dynamic>{
      'title': instance.category_title,
    };

CategoryBusinessTitle _$CategoryBusinessTitleFromJson(
        Map<String, dynamic> json) =>
    CategoryBusinessTitle(
      json['title'] as String?,
    );

Map<String, dynamic> _$CategoryBusinessTitleToJson(
        CategoryBusinessTitle instance) =>
    <String, dynamic>{
      'title': instance.category_business_title,
    };
