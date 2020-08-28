import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:sinaliza_controle/screens/profile_screen.dart';
import 'package:flutter/material.dart';

class ProfileTab extends StatefulWidget {
  @override
  _ProfileTabState createState() => _ProfileTabState();
}

class _ProfileTabState extends State<ProfileTab>
    with AutomaticKeepAliveClientMixin {
  @override
  Widget build(BuildContext context) {
    super.build(context);

    return StreamBuilder<QuerySnapshot>(
      stream: Firestore.instance.collection("perfis").snapshots(),
      builder: (context, snapshot) {
        if (!snapshot.hasData) return Center(
          child: CircularProgressIndicator(
            valueColor: AlwaysStoppedAnimation(Colors.white),
          ),
        );
        return ListView(
            children: <Widget>[
            ProfileScreen(),
            ],

        );
      },
    );
  }

  @override
  bool get wantKeepAlive => true;
}
