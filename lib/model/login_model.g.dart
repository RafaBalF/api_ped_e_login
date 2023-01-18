// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'login_model.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$Client on _ClientBase, Store {
  late final _$loginAtom = Atom(name: '_ClientBase.login', context: context);

  @override
  String get login {
    _$loginAtom.reportRead();
    return super.login;
  }

  @override
  set login(String value) {
    _$loginAtom.reportWrite(value, super.login, () {
      super.login = value;
    });
  }

  late final _$senhaAtom = Atom(name: '_ClientBase.senha', context: context);

  @override
  String get senha {
    _$senhaAtom.reportRead();
    return super.senha;
  }

  @override
  set senha(String value) {
    _$senhaAtom.reportWrite(value, super.senha, () {
      super.senha = value;
    });
  }

  late final _$statusAtom = Atom(name: '_ClientBase.status', context: context);

  @override
  int get status {
    _$statusAtom.reportRead();
    return super.status;
  }

  @override
  set status(int value) {
    _$statusAtom.reportWrite(value, super.status, () {
      super.status = value;
    });
  }

  late final _$mensagemAtom =
      Atom(name: '_ClientBase.mensagem', context: context);

  @override
  String get mensagem {
    _$mensagemAtom.reportRead();
    return super.mensagem;
  }

  @override
  set mensagem(String value) {
    _$mensagemAtom.reportWrite(value, super.mensagem, () {
      super.mensagem = value;
    });
  }

  late final _$id_pdvAtom = Atom(name: '_ClientBase.id_pdv', context: context);

  @override
  int get id_pdv {
    _$id_pdvAtom.reportRead();
    return super.id_pdv;
  }

  @override
  set id_pdv(int value) {
    _$id_pdvAtom.reportWrite(value, super.id_pdv, () {
      super.id_pdv = value;
    });
  }

  late final _$_ClientBaseActionController =
      ActionController(name: '_ClientBase', context: context);

  @override
  dynamic chaLogin(String value) {
    final _$actionInfo =
        _$_ClientBaseActionController.startAction(name: '_ClientBase.chaLogin');
    try {
      return super.chaLogin(value);
    } finally {
      _$_ClientBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic chaSenha(String value) {
    final _$actionInfo =
        _$_ClientBaseActionController.startAction(name: '_ClientBase.chaSenha');
    try {
      return super.chaSenha(value);
    } finally {
      _$_ClientBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
login: ${login},
senha: ${senha},
status: ${status},
mensagem: ${mensagem},
id_pdv: ${id_pdv}
    ''';
  }
}
