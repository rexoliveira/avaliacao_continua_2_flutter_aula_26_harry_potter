import '../models/address_model.dart';
import 'zip_code_repository.dart';

class ZipCodeController {
  final ZipCodeRepository repository;

  const ZipCodeController({required this.repository});

  Future<List<Address>> getCep({required String cep}) async {
    try {
      final response = await repository.getCep(cep: cep);
      return response;
    } catch (e) {
      rethrow;
    }
  }
}
