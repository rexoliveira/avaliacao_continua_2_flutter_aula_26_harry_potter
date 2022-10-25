// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class Address {
  final String logradouro;
  final String complemento;
  final String bairro;
  final String localidade;
  final String uf;
  final String cep;

  Address({
    required this.logradouro,
    required this.complemento,
    required this.bairro,
    required this.localidade,
    required this.uf,
    required this.cep,
  });

  Address copyWith({
    String? logradouro,
    String? complemento,
    String? bairro,
    String? localidade,
    String? uf,
    String? cep,
  }) {
    return Address(
      logradouro: logradouro ?? this.logradouro,
      complemento: complemento ?? this.complemento,
      bairro: bairro ?? this.bairro,
      localidade: localidade ?? this.localidade,
      uf: uf ?? this.uf,
      cep: cep ?? this.cep,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'logradouro': logradouro,
      'complemento': complemento,
      'bairro': bairro,
      'localidade': localidade,
      'uf': uf,
      'cep': cep,
    };
  }

  factory Address.fromMap(Map<String, dynamic> map) {
    return Address(
      logradouro: map['logradouro'] as String,
      complemento: map['complemento'] as String,
      bairro: map['bairro'] as String,
      localidade: map['localidade'] as String,
      uf: map['uf'] as String,
      cep: map['cep'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory Address.fromJson(String source) => Address.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'Address(logradouro: $logradouro, complemento: $complemento, bairro: $bairro, localidade: $localidade, uf: $uf, cep: $cep)';
  }

  @override
  bool operator ==(covariant Address other) {
    if (identical(this, other)) return true;
  
    return 
      other.logradouro == logradouro &&
      other.complemento == complemento &&
      other.bairro == bairro &&
      other.localidade == localidade &&
      other.uf == uf &&
      other.cep == cep;
  }

  @override
  int get hashCode {
    return logradouro.hashCode ^
      complemento.hashCode ^
      bairro.hashCode ^
      localidade.hashCode ^
      uf.hashCode ^
      cep.hashCode;
  }
}
