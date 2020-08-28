import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:sinaliza_controle/screens/promocao_screen.dart';
import 'package:flutter/material.dart';

class PromocaoTab extends StatefulWidget {
  @override
  _PromocaoTabState createState() => _PromocaoTabState();
}

class _PromocaoTabState extends State<PromocaoTab>
    with AutomaticKeepAliveClientMixin {
  @override
  Widget build(BuildContext context) {
    super.build(context);

    return StreamBuilder<QuerySnapshot>(
      stream: Firestore.instance.collection("product").snapshots(),
      builder: (context, snapshot) {
        if (!snapshot.hasData)
          return Center(
            child: CircularProgressIndicator(
              valueColor: AlwaysStoppedAnimation(Colors.white),
            ),
          );
        return ListView(
          children: <Widget>[
            PromocaoScreen(),
          ],
        );
      },
    );
  }

  @override
  bool get wantKeepAlive => true;
}
