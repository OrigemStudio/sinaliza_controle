import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:rxdart/rxdart.dart';

class UserBloc extends BlocBase {

  final _usersController = BehaviorSubject<List>();

  Stream<List> get outUsers => _usersController.stream;

  Map<String, Map<String, dynamic>> _user = {};

  Firestore _firestore = Firestore.instance;

  UserBloc(){
    _addUserListener();
  }

  void onChangedSearch(String search){
    if(search.trim().isEmpty){
      _usersController.add(_user.values.toList());
    } else {
      _usersController.add(_filter(search.trim()));
    }
  }

  List<Map<String, dynamic>> _filter (String search){
    List<Map<String, dynamic>> filteredUsers = List.from(_user.values.toList());
    filteredUsers.retainWhere((user) {
      return user["name"].toUpperCase().contains(search.toUpperCase());
    });
    return filteredUsers;
  }

  void _addUserListener(){
    _firestore.collection("users").snapshots().listen((snapshot) {
      snapshot.documentChanges.forEach((change) {

        String uid = change.document.documentID;

        switch(change.type){
          case DocumentChangeType.added:
            _user[uid] = change.document.data;
              _subscribeToOrders(uid);
            break;
          case DocumentChangeType.modified:
            _user [uid].addAll(change.document.data);
            _usersController.add(_user.values.toList());
            break;
          case DocumentChangeType.removed:
            _user.remove(uid);
            _unsubscribeToOrders(uid);
            _usersController.add(_user.values.toList());
            break;
        }

      });
    });
  }

  void _subscribeToOrders(String uid) {
    _user[uid]["subscription"] = _firestore.collection("users").document(uid)
        .collection("orders").snapshots().listen((orders) async {

          int numOrders = orders.documents.length;

          double money = 0.0;

          for(DocumentSnapshot d in orders.documents) {
            DocumentSnapshot order = await _firestore
                .collection("orders").document(d.documentID).get();

            if(order.data == null) continue;

            money += order.data["totalPrice"];

            _user[uid].addAll(
              {"money": money, "orders": numOrders}
            );

            _usersController.add(_user.values.toList());
          }

    });
  }

  Map<String, dynamic> getUser(String uid){
    return _user[uid];
  }

  void _unsubscribeToOrders(String uid){
    _user[uid]["subscription"].cancel();
  }

  @override
  void dispose() {
    _usersController.close();
  }



}