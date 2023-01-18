// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, prefer_const_constructors_in_immutables

import 'package:easy_sidemenu/easy_sidemenu.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:ped/app/app_widget.dart';
import 'package:ped/app/modules/pedido/pedido_store.dart';
import 'package:ped/model/pedidos_model.dart';

class PedidoPage extends StatefulWidget {
  PedidoPage({super.key, required this.title});

  final String title;

  @override
  State<PedidoPage> createState() => _PedidoPageState();
}

class _PedidoPageState extends State<PedidoPage> {
  var pedidoStore = PedidoStore();

  pedidoCall() async {
    await pedidoStore.getPedidos('2');
  }

  PageController page = PageController();

  @override
  Widget build(BuildContext context) {
    pedidoCall();
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          SideMenu(
            items: items,
            controller: page,
            footer: const Text("Guia"),
            onDisplayModeChanged: (mode) {},
            style: SideMenuStyle(
              backgroundColor: Colors.black87,
              selectedColor: Colors.amber,
            ),
          ),
          Expanded(
            child: ListView(
              children: [
                Column(
                  children: [
                    SizedBox(
                      height: 20,
                    ),
                    Container(
                      width: MediaQuery.of(this.context).size.width - 330,
                      height: 150,
                      color: Colors.amber,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text('Sua loja está Online'),
                          SizedBox(
                            width: 10,
                          ),
                          FloatingActionButton(
                            heroTag: 'btn',
                            onPressed: () {
                              pedidoStore.addPedido(PedidosModel());
                              // final play = AudioPlayer();
                              // play.play(AssetSource(
                              //     "Mud_Lonely_This_Christmas.mp3"));
                            },
                            backgroundColor: Colors.green,
                            child: Icon(Icons.power_settings_new),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        children: [
                          Container(
                            width: MediaQuery.of(context).size.width - 330,
                            height: 50,
                            color: Colors.amber,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Text('Codigo'),
                                Text('Cliente'),
                                Text('Status'),
                                Text('Data'),
                                Text('Valor')
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    Observer(
                      builder: (_) {
                        return ListView.builder(
                          shrinkWrap: true,
                          itemCount: pedidoStore.pedidoList.length,
                          itemBuilder: (_, var index) {
                            return Container(
                              width: MediaQuery.of(context).size.width - 330,
                              height: 150,
                              color: Colors.white24,
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  label(
                                      "",
                                      (pedidoStore.pedidoList[index].codigo)
                                          .toString()),
                                  label(
                                      "",
                                      (pedidoStore.pedidoList[index].cliente)
                                          .toString()),
                                  Column(
                                    children: [
                                      label(
                                          "Cancelado por: ",
                                          (pedidoStore.pedidoList[index].status
                                                  ?.canceladoPor)
                                              .toString()),
                                      label(
                                          "OBS: ",
                                          (pedidoStore.pedidoList[index].status
                                                  ?.obs)
                                              .toString()),
                                      label(
                                          "Pedido feito em:",
                                          (pedidoStore.pedidoList[index].status
                                                  ?.dataPedido)
                                              .toString()),
                                      label(
                                          "Pedido cancelado em: ",
                                          (pedidoStore.pedidoList[index].status
                                                  ?.dataCancelado)
                                              .toString()),
                                    ],
                                  ),
                                  label(
                                      "",
                                      (pedidoStore.pedidoList[index].data)
                                          .toString()),
                                  label(
                                      "",
                                      (pedidoStore.pedidoList[index].valor)
                                          .toString()),
                                  FloatingActionButton(
                                    heroTag: 'btn$index',
                                    elevation: 10,
                                    focusColor: Colors.amber,
                                    onPressed: () => {},
                                    child: const Icon(Icons.visibility),
                                  ),
                                ],
                              ),
                            );
                          },
                        );
                      },
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

Widget label(String label, String value) => Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        children: <Widget>[
          //ignore: unnecessary_string_interpolations
          Text("$label"),
          Text(value),
        ],
      ),
    );
