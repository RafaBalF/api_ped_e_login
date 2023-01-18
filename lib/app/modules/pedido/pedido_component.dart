// import 'package:flutter/material.dart';
// import 'package:ped/model/pedidos_model.dart';

// var json = {
//   "pedido": [
//     {
//       "codigo": 123,
//       "cliente": "Elvis Prasley",
//       "status": {
//         "canceladoPor": "Company",
//         "obs": "Pedido cancelado pelo estabelecimento.",
//         "dataPedido": "2022-12-03 10:16",
//         "dataCancelado": "2022-12-03 11:16"
//       },
//       "data": "2022-12-03 20:16",
//       "valor": 53.90
//     },
//     {
//       "codigo": 221,
//       "cliente": "Elvis Prasley",
//       "status": {
//         "canceladoPor": "Company",
//         "obs": "Pedido cancelado pelo estabelecimento.",
//         "dataPedido": "2022-12-03 10:16",
//         "dataCancelado": "2022-12-03 11:16"
//       },
//       "data": "2022-12-03 20:16",
//       "valor": 53.90
//     },
//     {
//       "codigo": 221,
//       "cliente": "Elvis Prasley",
//       "status": {
//         "canceladoPor": "Company",
//         "obs": "Pedido cancelado pelo estabelecimento.",
//         "dataPedido": "2022-12-03 10:16",
//         "dataCancelado": "2022-12-03 11:16"
//       },
//       "data": "2022-12-03 20:16",
//       "valor": 53.90
//     },
//     {
//       "codigo": 221,
//       "cliente": "Elvis Prasley",
//       "status": {
//         "canceladoPor": "Company",
//         "obs": "Pedido cancelado pelo estabelecimento.",
//         "dataPedido": "2022-12-03 10:16",
//         "dataCancelado": "2022-12-03 11:16"
//       },
//       "data": "2022-12-03 20:16",
//       "valor": 53.90
//     },
//     {
//       "codigo": 221,
//       "cliente": "Elvis Prasley",
//       "status": {
//         "canceladoPor": "Company",
//         "obs": "Pedido cancelado pelo estabelecimento.",
//         "dataPedido": "2022-12-03 10:16",
//         "dataCancelado": "2022-12-03 11:16"
//       },
//       "data": "2022-12-03 20:16",
//       "valor": 53.90
//     },
//     {
//       "codigo": 221,
//       "cliente": "Elvis Prasley",
//       "status": {
//         "canceladoPor": "Company",
//         "obs": "Pedido cancelado pelo estabelecimento.",
//         "dataPedido": "2022-12-03 10:16",
//         "dataCancelado": "2022-12-03 11:16"
//       },
//       "data": "2022-12-03 20:16",
//       "valor": 53.90
//     },
//     {
//       "codigo": 221,
//       "cliente": "Elvis Prasley",
//       "status": {
//         "canceladoPor": "Company",
//         "obs": "Pedido cancelado pelo estabelecimento.",
//         "dataPedido": "2022-12-03 10:16",
//         "dataCancelado": "2022-12-03 11:16"
//       },
//       "data": "2022-12-03 20:16",
//       "valor": 53.90
//     }
//   ]
// };

// class PedidoComponente extends StatelessWidget {
//   const PedidoComponente({super.key});

//   @override
//   Widget build(BuildContext context) {
//     var pedidos = Pedidozao.fromJson(json);
//     // final pedController = PedidoStore();
//     // final LogController = LoginStore();
//     // // var loginttt = await logController.login(
//     // //     controller.client.login, controller.client.senha);
//     // var pedidos = await pedController.pedido('12'); //(loginttt.idPdv);
//     return Column(
//       children: [
//         Container(
//           width: MediaQuery.of(context).size.width - 330,
//           height: 150,
//           color: Colors.white24,
//           child: Row(
//             mainAxisAlignment: MainAxisAlignment.spaceAround,
//             children: [
//               label("", (pedidos.pedidoList?[0].codigo).toString()),
//               label("", (pedidos.pedidoList?[0].cliente).toString()),
//               Column(
//                 children: [
//                   label("Cancelado por: ",
//                       (pedidos.pedidoList?[0].status?.canceladoPor).toString()),
//                   label(
//                       "OBS: ", (pedidos.pedidoList?[0].status?.obs).toString()),
//                   label("Pedido feito em: ",
//                       (pedidos.pedidoList?[0].status?.dataPedido).toString()),
//                   label(
//                       "Pedido cancelado em: ",
//                       (pedidos.pedidoList?[0].status?.dataCancelado)
//                           .toString()),
//                 ],
//               ),
//               label("", (pedidos.pedidoList?[0].data).toString()),
//               label("", (pedidos.pedidoList?[0].valor).toString()),
//               FloatingActionButton(
//                 heroTag: 'btn1',
//                 elevation: 10,
//                 focusColor: Colors.amber,
//                 onPressed: () => {},
//                 child: const Icon(Icons.visibility),
//               ),
//             ],
//           ),
//         ),
//       ],
//     );
//   }

//   Widget label(String label, String value) => Padding(
//         padding: const EdgeInsets.all(8.0),
//         child: Row(
//           children: <Widget>[
//             // ignore: unnecessary_string_interpolations
//             Text("$label"),
//             Text(value),
//           ],
//         ),
//       );
// }
