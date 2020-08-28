import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:rxdart/rxdart.dart';

class ProductPromoBloc extends BlocBase {

  final _dataController = BehaviorSubject<Map>();
  final _loadingController = BehaviorSubject<bool>();
  final _createdController = BehaviorSubject<bool>();

  Stream<Map> get outData => _dataController.stream;
  Stream<bool> get outLoading => _loadingController.stream;
  Stream<bool> get outCreated => _createdController.stream;

  String categoryId;
  DocumentSnapshot homePromo;

  Map<String, dynamic> unsavedData;

  ProductPromoBloc({this.categoryId, this.homePromo}){
    if(homePromo != null){
      unsavedData = Map.of(homePromo.data);
      unsavedData["images"] = List.of(homePromo.data["images"]);
      unsavedData["sizes"] = List.of(homePromo.data["sizes"]);

      _createdController.add(true);
    } else {
      unsavedData = {
        "title": null, "description": null, "price": null, "images": [], "sizes": []
      };

      _createdController.add(false);
    }

    _dataController.add(unsavedData);

  }

  void saveTitle(String title){
    unsavedData["title"] = title;
  }

  void saveDescription(String description){
    unsavedData["description"] = description;
  }

  void savePrice(String price){
    unsavedData["price"] = double.parse(price);
  }

  void saveImages(List images){
    unsavedData["images"] = images;
  }

  void saveSizes(List sizes){
    unsavedData["sizes"] = sizes;
  }

  Future<bool> saveProduct() async {
    _loadingController.add(true);

    try{
      if(homePromo != null){
        await _uploadImages(homePromo.documentID);
        await homePromo.reference.updateData(unsavedData);
      } else {
        DocumentReference dr = await Firestore.instance.collection("homePromo").document(categoryId).
        collection("items").add(Map.from(unsavedData)..remove("images"));
        await _uploadImages(dr.documentID);
        await dr.updateData(unsavedData);
      }

      _createdController.add(true);
      _loadingController.add(false);
      return true;

    } catch (e) {
      _loadingController.add(false);
      return false;
    }

  }

  Future _uploadImages(String productId) async {
    for(int i = 0; i < unsavedData["images"].length; i++){
      if(unsavedData["images"][i] is String) continue;

      StorageUploadTask uploadTask = FirebaseStorage.instance.ref().child(categoryId).
      child(productId).child(DateTime.now().millisecondsSinceEpoch.toString()).
      putFile(unsavedData["images"][i]);

      StorageTaskSnapshot s = await uploadTask.onComplete;
      String downloadUrl = await s.ref.getDownloadURL();

      unsavedData["images"][i] = downloadUrl;
    }
  }

  void deleteProductPromo(){
    homePromo.reference.delete();
  }

  @override
  void dispose() {
    _dataController.close();
    _loadingController.close();
    _createdController.close();
  }

}