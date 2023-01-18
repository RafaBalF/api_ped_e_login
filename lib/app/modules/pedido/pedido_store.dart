//ignore_for_file: prefer_const_constructors, library_private_types_in_public_api

import 'dart:convert';
import 'package:audioplayers/audioplayers.dart';
import 'package:mobx/mobx.dart';
import 'package:ped/app/modules/pedido/pedido_component.dart';
import 'package:http/http.dart' as http;
import 'package:ped/model/pedidos_model.dart';

import '../../../model/status_model.dart';

part 'pedido_store.g.dart';

class PedidoStore = _PedidoStoreBase with _$PedidoStore;

abstract class _PedidoStoreBase with Store {
  @observable
  late ObservableList pedidoList = [].asObservable();

  @action
  addPedido(PedidosModel ped) {
    pedidoList.add(ped);
    final play = AudioPlayer();
    play.play(AssetSource("Mud_Lonely_This_Christmas.mp3"));
    // play.stop()
  }

  Future<ObservableList> getPedidos(String? idPdv) async {
    var request = http.MultipartRequest(
        'GET',
        Uri.parse(
            'https://leonardopolo.com.br/casca-api/bebidasonline-pedido.php?idpdv=$idPdv'));

    http.StreamedResponse response = await request.send();

    var listaResponse = jsonDecode(await response.stream.bytesToString());

    if (pedidoList.isEmpty) {
      for (var pedido in listaResponse['pedido']) {
        PedidosModel p = PedidosModel.fromJson(pedido);
        addPedido(p);
      }
    }
    pedidoList.remove(PedidosModel());
    return pedidoList;
  }
}
