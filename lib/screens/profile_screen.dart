import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sinaliza_controle/dialogs/add_product_profile_dialog.dart';
import 'package:flutter/material.dart';

class ProfileScreen extends StatefulWidget {
  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    ScreenUtil.getInstance()..init(context);
    return Column(
      children: <Widget>[
        SizedBox(
          height: ScreenUtil.instance.setHeight(40),
        ),
        Container(
          height: MediaQuery.of(context).size.height / 18,
          width: MediaQuery.of(context).size.width,
          padding: const EdgeInsets.only(top: 8, left: 16),
          child: Text(
            'Imagem Capa Perfil',
            style: TextStyle(
              fontSize: ScreenUtil.instance.setSp(45),
            ),
          ),
        ),
        Stack(
          overflow: Overflow.visible,
          children: <Widget>[
            Container(
              height: MediaQuery.of(context).size.height / 3,
              width: MediaQuery.of(context).size.width / 1.1,
              decoration: BoxDecoration(
                color: Colors.blueGrey,
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(25),
                  bottomRight: Radius.circular(25),
                ),
              ),
              child: Container(
                  padding: EdgeInsets.only(
                    top: MediaQuery.of(context).size.height *.15,
                    left: MediaQuery.of(context).size.width *.08,
                    right: MediaQuery.of(context).size.width *.08,
                  ),
                  child:
                  Text('Clique no Icone da câmera para adicionar sua imagem de capa',
                    textAlign: TextAlign.center,
                    style: TextStyle(color: Colors.white),
                  )),
            ),
            Positioned(
              top: MediaQuery.of(context).size.height *.3,
              left: MediaQuery.of(context).size.width *.8,
              child: IconButton(
                  icon: Icon(
                    Icons.add_a_photo,
                    color: Colors.purple,
                    size: 50,
                  ),
                  onPressed: () {}),
            ),
          ],
        ),
        Row(
          children: <Widget>[
            Expanded(
              flex: 0,
              child: Stack(
                children: <Widget>[
                  Container(
                    height: MediaQuery.of(context).size.height / 4.8,
                    width: MediaQuery.of(context).size.width / 3,
                    padding: EdgeInsets.only(top: 4, bottom: 4, left: 16),
                    child: Card(
                        elevation: 8.0,
                        shape: CircleBorder(),
                        clipBehavior: Clip.antiAlias,
                        color: Colors.blueGrey,
                        ),
                  ),
                  Positioned(
                    top: MediaQuery.of(context).size.height *.130,
                      left: MediaQuery.of(context).size.width *.04,
                      child: IconButton(
                          icon: Icon(
                            Icons.add_a_photo,
                            color: Colors.purple,
                            size: 40,
                          ),
                          onPressed: () {}))
                ],
              ),
            ),
            Expanded(
              flex: 1,
              child: Container(
                padding: const EdgeInsets.only(right: 16),
                child: TextField(
                  decoration: InputDecoration(
                    contentPadding: new EdgeInsets.symmetric(
                        vertical: 10.0, horizontal: 10.0),
                    labelText: "Nome Empresa",
                    labelStyle: TextStyle(color: Colors.purple),
                    border: OutlineInputBorder(
                      borderRadius:
                          const BorderRadius.all(const Radius.circular(28.0)),
                      borderSide: BorderSide(
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Container(
              padding: EdgeInsets.only(left: 16, right: 16, top: 5),
              height: MediaQuery.of(context).size.height / 15,
              width: MediaQuery.of(context).size.width,
              child: Text(
                'Sobre',
                style: TextStyle(
                  fontSize: ScreenUtil.instance.setSp(45),
                ),
                textAlign: TextAlign.left,
              ),
            ),
            Divider(
              height: MediaQuery.of(context).size.height * .001,
              color: Colors.purple,
            ),
            Container(
              padding: const EdgeInsets.only(left: 8, right: 8, top: 8),
              child: Row(
                children: <Widget>[
                  Container(
                    child: Icon(
                      Icons.location_on,
                      color: Colors.purple,
                    ),
                  ),
                  Container(
                    height: MediaQuery.of(context).size.height / 18,
                    width: MediaQuery.of(context).size.width * .85,
                    padding: EdgeInsets.only(
                      left: 16,
                      right: 16,
                    ),
                    child: TextField(
                      decoration: InputDecoration(
                        contentPadding: new EdgeInsets.symmetric(
                            vertical: 10.0, horizontal: 10.0),
                        labelText: "Endereço",
                        labelStyle: TextStyle(color: Colors.purple),
                        border: OutlineInputBorder(
                          borderRadius: const BorderRadius.all(
                              const Radius.circular(28.0)),
                          borderSide: BorderSide(
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * .01,
            ),
            Container(
              padding: const EdgeInsets.only(
                left: 8,
                right: 8,
              ),
              child: Row(
                children: <Widget>[
                  Container(
                    child: Icon(
                      Icons.location_on,
                      color: Colors.purple,
                    ),
                  ),
                  Container(
                    height: MediaQuery.of(context).size.height / 18,
                    width: MediaQuery.of(context).size.width * .85,
                    padding: EdgeInsets.only(
                      left: 16,
                      right: 16,
                    ),
                    child: TextField(
                      decoration: InputDecoration(
                        contentPadding: new EdgeInsets.symmetric(
                            vertical: 10.0, horizontal: 10.0),
                        labelText: "Cidade",
                        labelStyle: TextStyle(color: Colors.purple),
                        border: OutlineInputBorder(
                          borderRadius: const BorderRadius.all(
                              const Radius.circular(28.0)),
                          borderSide: BorderSide(
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * .02,
            ),
            Divider(
              height: MediaQuery.of(context).size.height * .001,
              color: Colors.purple,
            ),
            Container(
              padding:
                  const EdgeInsets.only(left: 8, right: 8, top: 8, bottom: 8),
              child: Row(
                children: <Widget>[
                  Container(
                    child: Icon(
                      Icons.phone,
                      color: Colors.purple,
                    ),
                  ),
                  Container(
                    height: MediaQuery.of(context).size.height / 18,
                    width: MediaQuery.of(context).size.width * .85,
                    padding: EdgeInsets.only(
                      left: 16,
                      right: 16,
                    ),
                    child: TextField(
                      decoration: InputDecoration(
                        contentPadding: new EdgeInsets.symmetric(
                            vertical: 10.0, horizontal: 10.0),
                        labelText: "Telefone",
                        labelStyle: TextStyle(color: Colors.purple),
                        border: OutlineInputBorder(
                          borderRadius: const BorderRadius.all(
                              const Radius.circular(28.0)),
                          borderSide: BorderSide(
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Divider(
              height: MediaQuery.of(context).size.height * .001,
              color: Colors.purple,
            ),
            Container(
              padding:
                  const EdgeInsets.only(left: 8, right: 8, top: 8, bottom: 8),
              child: Row(
                children: <Widget>[
                  Container(
                    child: Icon(
                      Icons.calendar_today,
                      color: Colors.purple,
                    ),
                  ),
                  Container(
                    height: MediaQuery.of(context).size.height / 18,
                    width: MediaQuery.of(context).size.width * .85,
                    padding: EdgeInsets.only(
                      left: 16,
                      right: 16,
                    ),
                    child: Container(
                      child: TextField(
                        decoration: InputDecoration(
                          contentPadding: new EdgeInsets.symmetric(
                              vertical: 10.0, horizontal: 10.0),
                          labelText: "História da Empresa",
                          labelStyle: TextStyle(color: Colors.purple),
                          border: OutlineInputBorder(
                            borderRadius: const BorderRadius.all(
                                const Radius.circular(28.0)),
                            borderSide: BorderSide(
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Divider(
              height: MediaQuery.of(context).size.height * .001,
              color: Colors.purple,
            ),
            Container(
              padding: EdgeInsets.only(left: 32, top: 5),
              height: MediaQuery.of(context).size.height / 15,
              width: MediaQuery.of(context).size.width,
              child: Text(
                'Comunicação Online',
                style: TextStyle(fontSize: 20),
                textAlign: TextAlign.left,
              ),
            ),
            Container(
              padding: EdgeInsets.only(bottom: 16),
              child: Row(
                children: <Widget>[
                  Expanded(
                    child: Container(
                        height: MediaQuery.of(context).size.height / 12,
                        width: MediaQuery.of(context).size.width / 12,
                        child: FlatButton(
                            onPressed: () {},
                            child: Image.asset('assets/whatsapp.png'))),
                  ),
                  Expanded(
                    child: Container(
                        height: MediaQuery.of(context).size.height / 14,
                        width: MediaQuery.of(context).size.width / 14,
                        child: FlatButton(
                            onPressed: () {},
                            child:
                                Image.asset('assets/facebook_messenger.png'))),
                  ),
                  Expanded(
                    child: Container(
                      height: MediaQuery.of(context).size.height / 8,
                      width: MediaQuery.of(context).size.width / 8,
                      child: IconButton(
                          icon: Icon(
                            Icons.email,
                            size: 60,
                            color: Colors.purple,
                          ),
                          onPressed: () {}),
                    ),
                  ),
                ],
              ),
            ),
            Divider(
              height: MediaQuery.of(context).size.height * .001,
              color: Colors.purple,
            ),
            Container(
              padding: EdgeInsets.only(left: 16, top: 5),
              height: MediaQuery.of(context).size.height / 15,
              width: MediaQuery.of(context).size.width,
              child: Text(
                'Produtos e Serviços',
                style: TextStyle(fontSize: 20),
                textAlign: TextAlign.left,
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * .001,
              width: MediaQuery.of(context).size.width * .05,
            ),
            Container(
                height: MediaQuery.of(context).size.height * .1,
                width: MediaQuery.of(context).size.width,
                margin: const EdgeInsets.only(left: 12, right: 280),
                decoration: BoxDecoration(
                  color: Colors.blueGrey,
                  borderRadius: BorderRadius.all(Radius.circular(25)),
                ),
                child: IconButton(
                    icon: Icon(
                      Icons.exposure_plus_1,
                      color: Colors.white,
                    ),
                    onPressed: () {
                      showDialog(
                          context: context,
                          builder: (context) => AddProductProfileDialog());
                    })),
            SizedBox(
              height: MediaQuery.of(context).size.height * .02,
            ),
            Divider(
              height: MediaQuery.of(context).size.height * .05,
            ),
            Container(
              padding: EdgeInsets.only(
                  left: MediaQuery.of(context).size.width *.04,
                  bottom: 4
              ),
              margin: const EdgeInsets.only(
                left: 170,
                right: 16,
              ),
              decoration: BoxDecoration(
                color: Colors.blueGrey,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(25),
                  topRight: Radius.circular(25),
                  bottomLeft: Radius.circular(25),
                  bottomRight: Radius.circular(25),
                ),
              ),
              child: Row(
                children: <Widget>[
                  Container(
                      padding: EdgeInsets.only(
                          left: MediaQuery.of(context).size.width *.02,
                          right: MediaQuery.of(context).size.width *.02,
                      ),
                      margin: EdgeInsets.only(
                          top: 6
                      ),
                      child: Text(
                        'Salvar Perfil',
                        style: TextStyle(
                            fontWeight: FontWeight.w700,
                            fontSize: 16,
                            color: Colors.white),
                        textAlign: TextAlign.center,
                      )),
                  Container(
                    height: MediaQuery.of(context).size.height / 12,
                    width: MediaQuery.of(context).size.width / 8,
                    child: IconButton(
                        icon: Icon(
                          Icons.save,
                          color: Colors.purple,
                          size: 35,
                        ),
                        onPressed: () {}),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * .2,
            ),
          ],
        ),
      ],
    );
  }
}
