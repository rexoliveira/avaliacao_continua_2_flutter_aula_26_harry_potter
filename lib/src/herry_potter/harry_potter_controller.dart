import 'package:breaking_bad_api/src/herry_potter/harry_potter_repository.dart';

import '../models/harry_potter.dart';

class HerryPotterController {
  final HerryPotterRepository repository;

  const HerryPotterController({required this.repository});

  Future<List<HarryPotter>> getHarryPotter() async {
    try {
      final response = await repository.getHarryPotter();
      return response;
    } catch (e) {
      rethrow;
    }
  }
}
