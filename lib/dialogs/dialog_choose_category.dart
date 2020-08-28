import 'package:flutter/material.dart';

class DialogChooseCategory extends StatefulWidget {
  @override
  _DialogChooseCategoryState createState() => _DialogChooseCategoryState();
}

class _DialogChooseCategoryState extends State<DialogChooseCategory> {
  bool myLojas = false;
  bool myPets = false;
  bool mySupermercado = false;
  bool myFood = false;
  bool myAssistencia = false;
  bool myViagem = false;
  bool myConstrucao = false;
  bool mySaude = false;

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: Colors.transparent,
      child: Container(
        height: MediaQuery.of(context).size.height / 1.46,
        width: MediaQuery.of(context).size.width / 2.5,
        child: Card(
          shape: new RoundedRectangleBorder(
              borderRadius: new BorderRadius.circular(30.0)),
          child: Container(
            padding: const EdgeInsets.only(top: 16, left: 16, right: 16),
            child: ClipRect(
              child: Column(
                children: <Widget>[
                  Expanded(
                    child: Row(children: <Widget>[
                      Switch(
                        activeColor: Colors.purple,
                        value: myLojas,
                        onChanged: (bool value) {
                          setState(() {
                            myLojas = value;
                            myPets = false;
                            mySupermercado = false;
                            myFood = false;
                            myAssistencia = false;
                            myViagem = false;
                            myConstrucao = false;
                            mySaude = false;
                          });
                        },
                      ),
                      Text("Lojas"),
                    ]),
                  ),
                  Expanded(
                    child: Row(
                        children: <Widget>[
                      Switch(
                        activeColor: Colors.purple,
                        value: myPets,
                        onChanged: (bool value) {
                          setState(() {
                            myLojas = false;
                            myPets = value;
                            mySupermercado = false;
                            myFood = false;
                            myAssistencia = false;
                            myViagem = false;
                            myConstrucao = false;
                            mySaude = false;
                          });
                        },
                      ),
                      Text("Cuidado com Animais"),
                    ]),
                  ),
                  Expanded(
                    child: Row(children: <Widget>[
                      Switch(
                        activeColor: Colors.purple,
                        value: mySupermercado,
                        onChanged: (bool value) {
                          setState(() {
                            myLojas = false;
                            myPets = false;
                            mySupermercado = value;
                            myFood = false;
                            myAssistencia = false;
                            myViagem = false;
                            myConstrucao = false;
                            mySaude = false;
                          });
                        },
                      ),
                      Text("Supermercado"),
                    ]),
                  ),
                  Expanded(
                    child: Row(children: <Widget>[
                      Switch(
                        activeColor: Colors.purple,
                        value: myFood,
                        onChanged: (bool value) {
                          setState(() {
                            myLojas = false;
                            myPets = false;
                            mySupermercado = false;
                            myFood = value;
                            myAssistencia = false;
                            myViagem = false;
                            myConstrucao = false;
                            mySaude = false;
                          });
                        },
                      ),
                      Text("Alimentação"),
                    ]),
                  ),
                  Expanded(
                    child: Row(children: <Widget>[
                      Switch(
                        activeColor: Colors.purple,
                        value: myAssistencia,
                        onChanged: (bool value) {
                          setState(() {
                            myLojas = false;
                            myPets = false;
                            mySupermercado = false;
                            myFood = false;
                            myAssistencia = value;
                            myViagem = false;
                            myConstrucao = false;
                            mySaude = false;
                          });
                        },
                      ),
                      Text("Assistência Técnica"),
                    ]),
                  ),
                  Expanded(
                    child: Row(children: <Widget>[
                      Switch(
                        activeColor: Colors.purple,
                        value: myViagem,
                        onChanged: (bool value) {
                          setState(() {
                            myLojas = false;
                            myPets = false;
                            mySupermercado = false;
                            myFood = false;
                            myAssistencia = false;
                            myViagem = value;
                            myConstrucao = false;
                            mySaude = false;
                          });
                        },
                      ),
                      Text("Viagem e Turismo"),
                    ]),
                  ),
                  Expanded(
                    child: Row(children: <Widget>[
                      Switch(
                        activeColor: Colors.purple,
                        value: myConstrucao,
                        onChanged: (bool value) {
                          setState(() {
                            myLojas = false;
                            myPets = false;
                            mySupermercado = false;
                            myFood = false;
                            myAssistencia = false;
                            myViagem = false;
                            myConstrucao = value;
                            mySaude = false;
                          });
                        },
                      ),
                      Text("Construção Civil"),
                    ]),
                  ),
                  Expanded(
                    child: Row(children: <Widget>[
                      Switch(
                        activeColor: Colors.purple,
                        value: mySaude,
                        onChanged: (bool value) {
                          setState(() {
                            myLojas = false;
                            myPets = false;
                            mySupermercado = false;
                            myFood = false;
                            myAssistencia = false;
                            myViagem = false;
                            myConstrucao = false;
                            mySaude = value;
                          });
                        },
                      ),
                      Text("Saúde e Bem Estar"),
                    ]),
                  ),
                  Expanded(
                    child: Container(
                      width: MediaQuery.of(context).size.width,
                      padding: const EdgeInsets.only(bottom: 8),
                      child: StreamBuilder<bool>(
                          stream: null,
                          builder: (context, snapshot) {
                            return RaisedButton(
                                color: Colors.purple,
                                child: Text('Salvar'),
                                onPressed: () {},
                                textColor: Colors.white,
                                shape: new RoundedRectangleBorder(
                                    borderRadius: new BorderRadius.circular(30.0)));
                          }),
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
