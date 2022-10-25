import 'package:brasil_fields/brasil_fields.dart';

class Validate {
  static String? validatePassword(password) {
    if (password == null || password.isEmpty) {
      return 'Preencha a senha';
    } else if (password.length < 6) {
      return 'A senha deve conter no mínimo 6 caracteres!';
    }

    String hasUppercase =
        password.contains(RegExp(r'[A-Z]')) ? '' : 'letras maiúsculas,';

    String hasDigits = password.contains(RegExp(r'[0-9]')) ? '' : 'números,';

    String hasLowercase =
        password.contains(RegExp(r'[a-z]')) ? '' : 'letras minúsculas,';

    String hasSpecialCharacters =
        password.contains(RegExp(r'[!@#$%^&*(),.?":{}|<>]'))
            ? ''
            : 'caractere especial,';
    String? result =
        '$hasUppercase$hasDigits$hasLowercase$hasSpecialCharacters';

    result = (result.isNotEmpty) ? "Deve conter: $result" : null;

    return result;
  }

  static String? validateMail(String? value) {
    String regex =
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';

    RegExp regExp = RegExp(regex);

    if (value == null || value.isEmpty) {
      return 'Preencha o e-mail';
    } else if (!regExp.hasMatch(value)) {
      return 'E-mail não é válido!';
    }
    return null;
  }

  static String? enterValue(String? value,name) {
    if (value == null || value.isEmpty) {
      return 'Preencha $name';
    }

    return null;
  }

  static String? preenchaTelefone(String? value) {
    if (value == null || value.isEmpty) {
      return 'Preencha o telefone';
    }
    return null;
  }

  static String? validaCpf(String? value) {
    if (value == null || value.isEmpty) {
      return 'Preencha o cpf';
    }
    if (!CPFValidator.isValid(value)) {
      return 'CPF inválido!';
    }
    return null;
  }

  static String? validateConfPassword(String? value, String? password) {
    if (value == null || value.isEmpty) {
      return 'Confirme a senha!';
    }
    if (password !=value) {
      return 'Senha diferentes!';
    }
    

    return null;
  }
}
