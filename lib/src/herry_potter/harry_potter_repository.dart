// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';
import 'dart:developer';

import 'package:dio/dio.dart';

import '../models/harry_potter.dart';

class HerryPotterRepository {
  Future<List<HarryPotter>> getHarryPotter() async {
    final Dio dio = Dio(
      BaseOptions(
        baseUrl: 'https://hp-api.herokuapp.com/api/characters',
        headers: {
          'Content-type': 'application/json',
        },
      ),
    );

    try {
      final response = await dio.get('');

     final data = List.from(response.data);

      final mapList = data.map((e) => Map<String, dynamic>.from(e)).toList();

      return mapList.map((e) => HarryPotter.fromMap(e)).toList();
    } catch (e) {
      if (e.toString().contains('Null')) {
        log('Erro ao processar!');
      } else {
        log('Error: $e');
      }
      rethrow;
    }
  }
}
