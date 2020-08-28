import 'dart:io';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:sinaliza_controle/blocs/category_promo_bloc.dart';
import 'package:sinaliza_controle/widget/image_source_sheet.dart';

class EditCategoryPromoDialog extends StatefulWidget {

  final DocumentSnapshot categoryPromo;

  EditCategoryPromoDialog({this.categoryPromo});

  @override
  _EditCategoryPromoDialogState createState() => _EditCategoryPromoDialogState(
      categoryPromo: categoryPromo
  );
}

class _EditCategoryPromoDialogState extends State<EditCategoryPromoDialog> {
  final CategoryPromoBloc _homePromoCategoryBloc;

  final TextEditingController _controllerPromo;

  _EditCategoryPromoDialogState({DocumentSnapshot categoryPromo}) :
        _homePromoCategoryBloc = CategoryPromoBloc(categoryPromo),
        _controllerPromo = TextEditingController(text: categoryPromo != null ?
        categoryPromo.data["title"] : ""
        );

  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: Card(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            ListTile(
              leading: GestureDetector(
                onTap: (){
                  showModalBottomSheet(context: context,
                      builder: (context) => ImageSourceSheet(
                        onImageSelected: (image){
                          Navigator.of(context).pop();
                          _homePromoCategoryBloc.setImage(image);
                        },
                      )
                  );
                },
                child: StreamBuilder(
                    stream: _homePromoCategoryBloc.outImage,
                    builder: (context, snapshot) {
                      if(snapshot.data != null)
                        return CircleAvatar(
                          child: snapshot.data is File ?
                          Image.file(snapshot.data, fit: BoxFit.cover,):
                          Image.network(snapshot.data, fit: BoxFit.cover,),
                          backgroundColor: Colors.transparent,
                        );
                      else return Icon(Icons.image);
                    }
                ),
              ),
              title: StreamBuilder<String>(
                  stream: _homePromoCategoryBloc.outTitle,
                  builder: (context, snapshot) {
                    return TextField(
                      controller: _controllerPromo,
                      onChanged: _homePromoCategoryBloc.setTitle,
                      decoration: InputDecoration(
                          errorText: snapshot.hasError ? snapshot.error : null
                      ),
                    );
                  }
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                StreamBuilder<bool>(
                    stream: _homePromoCategoryBloc.outDelete,
                    builder: (context, snapshot) {
                      if(!snapshot.hasData) return Container();
                      return FlatButton(
                        child: Text("Excluir"),
                        textColor: Colors.red,
                        onPressed: snapshot.data ? (){
                          _homePromoCategoryBloc.delete();
                          Navigator.of(context).pop();
                        } : null,
                      );
                    }
                ),
                StreamBuilder<bool>(
                    stream: _homePromoCategoryBloc.submitValid,
                    builder: (context, snapshot) {
                      return FlatButton(
                          child: Text("Salvar"),
                          onPressed: snapshot.hasData ? () async {
                            await _homePromoCategoryBloc.saveData();
                            Navigator.of(context).pop();
                          } : null
                      );
                    }
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}

