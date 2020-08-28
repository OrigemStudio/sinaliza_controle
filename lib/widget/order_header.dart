import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:date_format/date_format.dart';
import 'package:sinaliza_controle/blocs/user_bloc.dart';
import 'package:flutter/material.dart';

class OrderHeader extends StatelessWidget {

  final DocumentSnapshot order;

  OrderHeader(this.order);

  @override
  Widget build(BuildContext context) {

    final _userBloc = BlocProvider.of<UserBloc>(context);

    final _user = _userBloc.getUser(order.data["clientId"]);

    return Row(
      children: <Widget>[
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                  "Data: ${formatDate(
                      DateTime.now(), [
                    dd, '/',
                    mm, '/',
                    yyyy, " ",
                    hh, ":",
                    mm, ":",
                    ss])}",
                style: TextStyle(color: Colors.green, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 8.0,),
              Text("${_user["name"]}"),
              Text("${_user["address"]}"),
            ],
          ),
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: <Widget>[
            Text("Produtos: R\$${order.data["productsPrice"].toStringAsFixed(2)}", style: TextStyle(fontWeight: FontWeight.w500),),
            Text("Entrega: R\$${order.data["shipPrice"].toStringAsFixed(2)}"),
            Text("Total: R\$${order.data["totalPrice"].toStringAsFixed(2)}")
          ],
        ),
      ],
    );
  }
}
