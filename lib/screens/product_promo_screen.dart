import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:sinaliza_controle/blocs/product_promo_bloc.dart';
import 'package:sinaliza_controle/validators/product_validator.dart';
import 'package:sinaliza_controle/widget/images_promo_widget.dart';
import 'package:sinaliza_controle/widget/product_sizes.dart';
import 'package:flutter/material.dart';

class ProductPromoScreen extends StatefulWidget {
  final String categoryId;
  final DocumentSnapshot homePromo;

  ProductPromoScreen({this.categoryId, this.homePromo});

  @override
  _ProductPromoScreenState createState() =>
      _ProductPromoScreenState(categoryId, homePromo);
}

class _ProductPromoScreenState extends State<ProductPromoScreen>
    with ProductValidator {
  final ProductPromoBloc _homePromoBloc;

  final _formKey = GlobalKey<FormState>();

  final _scafoldKey = GlobalKey<ScaffoldState>();

  _ProductPromoScreenState(String categoryId, DocumentSnapshot homePromo) :
  _homePromoBloc = ProductPromoBloc(categoryId: categoryId, homePromo: homePromo);

  @override
  Widget build(BuildContext context) {
    InputDecoration _buildDecoration(String label) {
      return InputDecoration(
          labelText: label, labelStyle: TextStyle(color: Colors.grey));
    }

    final _fieldStyle = TextStyle(
      color: Colors.white,
      fontSize: 16,
    );

    return Scaffold(
      key: _scafoldKey,
      backgroundColor: Colors.grey[850],
      appBar: AppBar(
        elevation: 0,
        title: StreamBuilder<bool>(
            stream: _homePromoBloc.outCreated,
            initialData: false,
            builder: (context, snapshot) {
              return Text(snapshot.data ? "Editar Produto" : "Criar Produto");
            }),
        actions: <Widget>[
          StreamBuilder<bool>(
            stream: _homePromoBloc.outCreated,
            initialData: false,
            builder: (context, snapshot) {
              if (snapshot.data)
                return StreamBuilder<bool>(
                    stream: _homePromoBloc.outLoading,
                    initialData: false,
                    builder: (context, snapshot) {
                      return IconButton(
                        icon: Icon(Icons.remove),
                        onPressed: snapshot.data
                            ? null
                            : () {
                                _homePromoBloc.deleteProductPromo();
                                Navigator.of(context).pop();
                              },
                      );
                    });
              else
                return Container();
            },
          ),
          StreamBuilder<bool>(
              stream: _homePromoBloc.outLoading,
              initialData: false,
              builder: (context, snapshot) {
                return IconButton(
                  icon: Icon(Icons.save),
                  onPressed: snapshot.data ? null : saveProduct,
                );
              }),
        ],
      ),
      body: Stack(
        children: <Widget>[
          Form(
            key: _formKey,
            child: StreamBuilder<Map>(
                stream: _homePromoBloc.outData,
                builder: (context, snapshot) {
                  if (!snapshot.hasData) return Container();
                  return ListView(
                    padding: EdgeInsets.all(16),
                    children: <Widget>[
                      Text(
                        "Imagens",
                        style: TextStyle(color: Colors.grey, fontSize: 12),
                      ),
                      ImagesPromoWidget(
                        context: context,
                        initialValue: snapshot.data["images"],
                        onSaved: _homePromoBloc.saveImages,
                        validator: validadeImages,
                      ),
                      TextFormField(
                        initialValue: snapshot.data["title"],
                        style: _fieldStyle,
                        decoration: _buildDecoration("Título"),
                        onSaved: _homePromoBloc.saveTitle,
                        validator: validateTitle,
                      ),
                      TextFormField(
                        initialValue: snapshot.data["description"],
                        style: _fieldStyle,
                        maxLines: 6,
                        decoration: _buildDecoration("Descrição"),
                        onSaved: _homePromoBloc.saveDescription,
                        validator: validateDescription,
                      ),
                      TextFormField(
                        initialValue:
                            snapshot.data["price"]?.toStringAsFixed(2),
                        style: _fieldStyle,
                        decoration: _buildDecoration("Preço"),
                        keyboardType:
                            TextInputType.numberWithOptions(decimal: true),
                        onSaved: _homePromoBloc.savePrice,
                        validator: validatePrice,
                      ),
                      SizedBox(
                        height: 16,
                      ),
                      Text(
                        "Tamanhos",
                        style: TextStyle(color: Colors.grey, fontSize: 12),
                      ),
                      ProductSizes(
                        context: context,
                        initialValue: snapshot.data["sizes"],
                        onSaved: _homePromoBloc.saveSizes,
                        // ignore: missing_return
                        validator: (s){
                          if(s.isEmpty) return "Adicione um pacote para seu produto";
                        },
                      )
                    ],
                  );
                }),
          ),
          StreamBuilder<bool>(
              stream: _homePromoBloc.outLoading,
              initialData: false,
              builder: (context, snapshot) {
                return IgnorePointer(
                  ignoring: !snapshot.data,
                  child: Container(
                    color: snapshot.data ? Colors.black54 : Colors.transparent,
                  ),
                );
              }),
        ],
      ),
    );
  }

  void saveProduct() async {
    if(_formKey.currentState.validate()){
      _formKey.currentState.save();

      _scafoldKey.currentState.showSnackBar(SnackBar(
        content: Text(
          "Salvando produto...",
          style: TextStyle(color: Colors.white),
        ),
        duration: Duration(minutes: 1),
        backgroundColor: Colors.pinkAccent,
      ));

      bool success = await _homePromoBloc.saveProduct();

      _scafoldKey.currentState.removeCurrentSnackBar();

      _scafoldKey.currentState.showSnackBar(SnackBar(
        content: Text(
          success ? "Produto salvo" : "Erro ao salvar produto",
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.pinkAccent,
      ));
    }
  }
}
