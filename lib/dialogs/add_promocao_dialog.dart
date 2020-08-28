import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AddPromocaoDialog extends StatefulWidget {
  @override
  _AddProductProfileDialogState createState() =>
      _AddProductProfileDialogState();
}

class _AddProductProfileDialogState extends State<AddPromocaoDialog> {
  @override
  Widget build(BuildContext context) {
    ScreenUtil.getInstance()..init(context);
    return Dialog(
      backgroundColor: Colors.transparent,
      child: Container(
        height: MediaQuery.of(context).size.height / 1.58,
        width: MediaQuery.of(context).size.width / .9,
        child: Card(
          shape: new RoundedRectangleBorder(
              borderRadius: new BorderRadius.circular(30.0)),
          child: Container(
            padding: const EdgeInsets.all(16),
            child: ClipRect(
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Container(
                      width: MediaQuery.of(context).size.width,
                      padding: const EdgeInsets.only(
                        left: 16,
                        top: 4,
                        bottom: 4,
                      ),
                      decoration: BoxDecoration(
                          color: Colors.blueGrey,
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(15),
                              topRight: Radius.circular(15),
                              bottomLeft: Radius.circular(15),
                              bottomRight: Radius.circular(15))),
                      child: Text(
                        'Adicionar Produto',
                        style: TextStyle(
                            fontSize: ScreenUtil.instance.setSp(45),
                            color: Colors.white),
                      ),
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * .02,
                    ),

                    Container(
                      child: Text('Imagens Produto'),
                    ),
                    Container(
                      height: MediaQuery.of(context).size.height * .15,
                      width: MediaQuery.of(context).size.width * .3,
                      decoration: BoxDecoration(
                        color: Colors.blueGrey,
                        borderRadius: BorderRadius.all(
                          Radius.circular(15),
                        ),
                      ),
                      child: IconButton(
                          icon: Icon(
                            Icons.add_a_photo,
                            color: Colors.white,
                            size: 30,
                          ),
                          onPressed: () {}),
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * .02,
                    ),
                    TextField(
                      decoration: InputDecoration(
                        contentPadding: new EdgeInsets.symmetric(
                            vertical: 10.0, horizontal: 10.0),
                        border: OutlineInputBorder(
                          borderRadius:
                          const BorderRadius.all(const Radius.circular(28.0)),
                          borderSide: BorderSide(
                            color: Colors.blue,
                          ),
                        ),
                        labelText: 'Nome Produto',
                        labelStyle: TextStyle(color: Colors.purple),
                      ),
                    ),

                    SizedBox(
                      height: MediaQuery.of(context).size.height * .02,
                    ),
                    TextField(
                      decoration: InputDecoration(
                        contentPadding: new EdgeInsets.symmetric(
                            vertical: 10.0, horizontal: 10.0),
                        border: OutlineInputBorder(
                          borderRadius:
                          const BorderRadius.all(const Radius.circular(28.0)),
                          borderSide: BorderSide(
                            color: Colors.blue,
                          ),
                        ),
                        labelText: 'Preço do Produto',
                        labelStyle: TextStyle(color: Colors.purple),
                      ),
                    ),

                    SizedBox(
                      height: MediaQuery.of(context).size.height * .02,
                    ),
                    TextField(
                      decoration: InputDecoration(
                        contentPadding: new EdgeInsets.symmetric(
                            vertical: 10.0, horizontal: 10.0),
                        border: OutlineInputBorder(
                          borderRadius:
                          const BorderRadius.all(const Radius.circular(28.0)),
                          borderSide: BorderSide(
                            color: Colors.blue,
                          ),
                        ),
                        labelText: 'Descrição do Produto',
                        labelStyle: TextStyle(color: Colors.purple),
                      ),
                    ),

                    SizedBox(
                      height: MediaQuery.of(context).size.height * .02,
                    ),
                    TextField(
                      decoration: InputDecoration(
                        contentPadding: new EdgeInsets.symmetric(
                            vertical: 10.0, horizontal: 10.0),
                        border: OutlineInputBorder(
                          borderRadius:
                          const BorderRadius.all(const Radius.circular(28.0)),
                          borderSide: BorderSide(
                            color: Colors.blue,
                          ),
                        ),
                        labelText: 'Cupom de Desconto',
                        labelStyle: TextStyle(color: Colors.purple),
                      ),
                    ),

                    SizedBox(
                      height: MediaQuery.of(context).size.height * .02,
                    ),
                    TextField(
                      decoration: InputDecoration(
                        contentPadding: new EdgeInsets.symmetric(
                            vertical: 10.0, horizontal: 10.0),
                        border: OutlineInputBorder(
                          borderRadius:
                          const BorderRadius.all(const Radius.circular(28.0)),
                          borderSide: BorderSide(
                            color: Colors.blue,
                          ),
                        ),
                        labelText: 'Regras do Cupom de Desconto',
                        labelStyle: TextStyle(color: Colors.purple),
                      ),
                    ),

                    SizedBox(
                      height: MediaQuery.of(context).size.height * .02,
                    ),
                    Container(
                      padding: const EdgeInsets.only(left: 195),
                      child: RaisedButton(
                        color: Colors.purple,
                        onPressed: () {},
                        shape: RoundedRectangleBorder(
                            borderRadius: new BorderRadius.circular(30.0)),
                        child: Text(
                          'Publicar',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: ScreenUtil.instance.setSp(45),
                          ),
                        ),
                      ),
                    ),

                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
