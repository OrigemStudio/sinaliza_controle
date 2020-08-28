import 'dart:async';
import 'dart:io';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:rxdart/rxdart.dart';

class CategoryPromoBloc extends BlocBase {
  final _titleControllerPromo = BehaviorSubject<String>();
  final _imageControllerPromo = BehaviorSubject();
  final _deleteControllerPromo = BehaviorSubject<bool>();

  Stream<String> get outTitle => _titleControllerPromo.stream.transform(
          StreamTransformer<String, String>.fromHandlers(
              handleData: (title, sink) {
        if (title.isEmpty)
          sink.addError("Insira um título");
        else
          sink.add(title);
      }));

  Stream get outImage => _imageControllerPromo.stream;

  Stream<bool> get outDelete => _deleteControllerPromo.stream;

  Stream<bool> get submitValid =>
      Observable.combineLatest2(outTitle, outImage, (a, b) => true);

  DocumentSnapshot categoryPromo;

  File image;
  String title;

  CategoryPromoBloc(this.categoryPromo) {
    if (categoryPromo != null) {
      title = categoryPromo.data["title"];
      _titleControllerPromo.add(categoryPromo.data["title"]);
      _imageControllerPromo.add(categoryPromo.data["icon"]);
      _deleteControllerPromo.add(true);
    } else {
      _deleteControllerPromo.add(false);
    }
  }

  void setImage(File file) {
    image = file;
    _imageControllerPromo.add(file);
  }

  void setTitle(String title) {
    this.title = title;
    _titleControllerPromo.add(title);
  }

  void delete() {
    categoryPromo.reference.delete();
  }

  Future saveData() async {
    if (image == null &&
        categoryPromo != null &&
        title == categoryPromo.data["title"]) return;

    Map<String, dynamic> dataToUpdate = {};

    if (image != null) {
      StorageUploadTask task = FirebaseStorage.instance
          .ref()
          .child("icons")
          .child("title")
          .putFile(image);
      StorageTaskSnapshot snap = await task.onComplete;
      dataToUpdate["icon"] = await snap.ref.getDownloadURL();
    }

    if (categoryPromo == null || title != categoryPromo.data["title"]) {
      dataToUpdate["title"] = title;
    }

    if (categoryPromo == null) {
      await Firestore.instance
          .collection("homePromo")
          .document(title.toLowerCase())
          .setData(dataToUpdate);
    } else {
      await categoryPromo.reference.updateData(dataToUpdate);
    }
  }

  @override
  void dispose() {
    _titleControllerPromo.close();
    _imageControllerPromo.close();
    _deleteControllerPromo.close();
  }
}
