// ignore_for_file: prefer_const_constructors, prefer_if_null_operators

import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:ped/app/modules/login/login_store.dart';
import 'package:ped/app/modules/pedido/pedido_page.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key, required this.title});

  final String title;

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  var loginStore = LoginStore();

  _textField({
    String? labelText,
    onChanged,
    String? errorText,
  }) {
    return TextField(
      onChanged: onChanged,
      decoration: InputDecoration(
        border: OutlineInputBorder(),
        labelText: labelText,
        errorText: errorText == null ? null : errorText,
      ),
    );
  }

  circleImage() {
    return Center(
      child: Container(
        width: 50,
        height: 50,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          image: DecorationImage(
            image: AssetImage('assets/logo_b_on.png'),
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }

  onCLick(context) async {
    var loginAuth = await loginStore.login(
        loginStore.client.login, loginStore.client.senha);
    if (loginAuth.status == "200") {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => PedidoPage(title: 'Pedidos'),
        ),
      );
    } else {
      showDialog(
        context: context,
        builder: (_) {
          return AlertDialog(
            title: Text('Erro'),
            content: Text('inhaaaaaa'),
          );
        },
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Login'),
      ),
      body: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: SizedBox(
              width: 300,
              child: Column(
                children: <Widget>[
                  const SizedBox(
                    height: 30,
                  ),
                  circleImage(),
                  const SizedBox(
                    height: 120,
                  ),
                  Observer(
                    builder: (_) {
                      return _textField(
                          errorText: loginStore.validateLogin(),
                          labelText: "login",
                          onChanged: loginStore.client.chaLogin);
                    },
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  Observer(
                    builder: (_) {
                      return _textField(
                          errorText: loginStore.validateSenha(),
                          labelText: "Senha",
                          onChanged: loginStore.client.chaSenha);
                    },
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  Observer(builder: (_) {
                    return ElevatedButton(
                      onPressed: loginStore.isValid
                          ? () {
                              onCLick(context);
                            }
                          : null,
                      child: const Text('Entrar'),
                    );
                  }),
                ],
              ),
            ),
          ),
          SizedBox(
            width: MediaQuery.of(this.context).size.width - 316,
            height: MediaQuery.of(this.context).size.height,
            child: Image(
              image: AssetImage('assets/banner_b_on.PNG'),
              width: MediaQuery.of(this.context).size.width - 316,
              height: MediaQuery.of(this.context).size.height,
              fit: BoxFit.cover,
            ),
          ),
        ],
      ),
    );
  }
}
