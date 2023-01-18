// ignore_for_file: library_private_types_in_public_api, unused_element

import 'package:mobx/mobx.dart';
import 'package:ped/model/status_model.dart';

part 'pedidos_model.g.dart';

class PedidosModel = _PedidosModelBase with _$PedidosModel;

abstract class _PedidosModelBase with Store {
  @observable
  late int? codigo;
  @observable
  late String? cliente;
  @observable
  late StatusModel? status;
  @observable
  late DateTime? data;
  @observable
  late double? valor;

  @action
  setCodigo(int? value) => codigo = value;
  @action
  setCliente(String? value) => cliente = value;
  @action
  setStatus(StatusModel? value) => status = value;
  @action
  setData(DateTime? value) => data = value;
  @action
  setValor(double? value) => valor = value;

  _PedidosModelBase(
      {this.codigo, this.cliente, this.status, this.data, this.valor});

  _PedidosModelBase.fromJson(Map<String, dynamic> json)
      : codigo = json['codigo'],
        cliente = json['cliente'],
        status = StatusModel.fromJson(json['status'] as Map<String, dynamic>),
        data = DateTime.parse(json['data'] as String),
        valor = json['valor'];

  Map<String, dynamic> toJson() => {
        'codigo': codigo,
        'cliente': cliente,
        'status': status,
        'data': data,
        'valor': valor,
      };
}
