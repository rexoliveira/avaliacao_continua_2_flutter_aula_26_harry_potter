// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';
import 'dart:developer';

import 'package:dio/dio.dart';

import 'package:breaking_bad_api/src/models/address_model.dart';

class ZipCodeRepository {
  Future<List<Address>> getCep({required String cep}) async {
    final Dio dio = Dio(
      BaseOptions(
        baseUrl: 'https://viacep.com.br/ws/$cep/json/',
        headers: {
          'Content-type': 'application/json',
        },
      ),
    );

    List<Address> dataList = [];
    try {
      final response = await dio.get('');

      final data = jsonDecode(response.toString());

      dataList.add(Address.fromMap(data));

      return dataList.toList();

    } catch (e) {
      if (e.toString().contains('Null')) {
        log('Cep inválido!');
      } else {
        log('Error: $e');
      }
      rethrow;
    }
  }
}
