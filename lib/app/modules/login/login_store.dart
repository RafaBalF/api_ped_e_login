import 'dart:convert';

import 'package:mobx/mobx.dart';
import 'package:ped/model/login_model.dart';
import 'package:http/http.dart' as http;

part 'login_store.g.dart';

class LoginStore = _LoginStoreBase with _$LoginStore;

abstract class _LoginStoreBase with Store {
  var client = Client();

  @computed
  bool get isValid {
    return validateLogin() == null && validateSenha() == null;
  }

  String? validateLogin() {
    if (client.login == '' || client.login.isEmpty) {
      return "este campo é obrigatorio";
    } else if (client.login.length < 6) {
      return "seu login precisa ter mais de 5 caracteres";
    }
    return null;
  }

  String? validateSenha() {
    if (client.senha == '' || client.senha.isEmpty) {
      return "este campo é obrigatorio";
    } else if (client.senha.length < 6) {
      return "sua senha precisa ter mais de 5 caracteres";
    }
    return null;
  }

  Future<LoginAutogenerated> login(String login, String senha) async {
    var request = http.MultipartRequest(
        'POST',
        Uri.parse(
            'https://leonardopolo.com.br/casca-api/bebidasonline-login.php'));
    request.fields.addAll({'usuario': login, 'senha': senha});

    http.StreamedResponse response = await request.send();
    var dados = jsonDecode(await response.stream.bytesToString());

    var data = LoginAutogenerated.fromJson(dados);

    return data;
  }
}

class LoginAutogenerated {
  String? status;
  String? mensagem;
  String? idPdv;

  LoginAutogenerated({this.status, this.mensagem, this.idPdv});

  LoginAutogenerated.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    mensagem = json['mensagem'];
    idPdv = json['id_pdv'];
  }
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['mensagem'] = this.mensagem;
    data['id_pdv'] = this.idPdv;
    return data;
  }
}