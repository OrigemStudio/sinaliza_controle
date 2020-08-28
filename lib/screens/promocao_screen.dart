import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sinaliza_controle/dialogs/add_promocao_dialog.dart';

class PromocaoScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    ScreenUtil.getInstance()..init(context);
    return Container(
      padding: const EdgeInsets.only(left: 16, right: 16, top: 64, bottom: 16),
      child: Column(
        children: <Widget>[
          Text(
            'Adicione suas promoções tocando em cada um dos ícones abaixo. Este pacote está habilitado para postar ou editar cinco itens por semana',
            style: TextStyle(
                fontSize: ScreenUtil.instance.setSp(45),
                fontWeight: FontWeight.w500),
            textAlign: TextAlign.center,
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height *.1,
          ),
          Row(
            children: <Widget>[
              Column(
                children: <Widget>[
                  Container(
                        height: ScreenUtil.instance.setHeight(280),
                        width: ScreenUtil.instance.setWidth(280),
                    margin: const EdgeInsets.only(
                        left: 4, right: 4),
                        decoration: BoxDecoration(
                          color: Colors.blueGrey,
                          borderRadius: BorderRadius.all(
                              Radius.circular(25)
                          ),
                        ),
                    child: IconButton(
                        icon: Icon(
                          Icons.plus_one,
                          color: Colors.white,
                        ),
                        onPressed: () {
                          showDialog(
                              context: context,
                              builder: (context) => AddPromocaoDialog(
                              ));
                        }),
                  ),
                  Text('Produto 01')
                ],
              ),
             Column(
               children: <Widget>[
                 Container(
                   height: ScreenUtil.instance.setHeight(280),
                   width: ScreenUtil.instance.setWidth(280),
                        margin: const EdgeInsets.only(
                            left: 4, right: 4),
                        decoration: BoxDecoration(
                          color: Colors.blueGrey,
                          borderRadius: BorderRadius.all(
                              Radius.circular(25)
                          ),
                        ),
                        child: IconButton(
                            icon: Icon(
                              Icons.plus_one,
                              color: Colors.white,
                            ),
                            onPressed: () {
                              showDialog(
                                  context: context,
                                  builder: (context) => AddPromocaoDialog(
                                  ));
                            }),
                      ),
                 Text('Produto 02')
               ],
             ),
              Column(
                children: <Widget>[
                  Container(
                    height: ScreenUtil.instance.setHeight(280),
                    width: ScreenUtil.instance.setWidth(280),
                        margin: const EdgeInsets.only(
                            left: 4, right: 4),
                        decoration: BoxDecoration(
                          color: Colors.blueGrey,
                          borderRadius: BorderRadius.all(
                              Radius.circular(25)
                          ),
                        ),
                        child: IconButton(
                            icon: Icon(
                              Icons.plus_one,
                              color: Colors.white,
                            ),
                            onPressed: () {
                              showDialog(
                                  context: context,
                                  builder: (context) => AddPromocaoDialog(
                                  ));
                            }),
                      ),
                  Text('Produto 03')
                ],
              ),
            ],
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height *.05,
          ),
          Row(
            children: <Widget>[
              Column(
                children: <Widget>[
                  Container(
                    height: ScreenUtil.instance.setHeight(280),
                    width: ScreenUtil.instance.setWidth(280),
                        margin: const EdgeInsets.only(
                            left: 4, right: 4),
                        decoration: BoxDecoration(
                          color: Colors.blueGrey,
                          borderRadius: BorderRadius.all(
                              Radius.circular(25)
                          ),
                        ),
                        child: IconButton(
                            icon: Icon(
                              Icons.plus_one,
                              color: Colors.white,
                            ),
                            onPressed: () {
                              showDialog(
                                  context: context,
                                  builder: (context) => AddPromocaoDialog(
                                  ));
                            }),
                      ),
                  Text('Produto 04')
                ],
              ),
              Column(
                children: <Widget>[
                  Container(
                    height: ScreenUtil.instance.setHeight(280),
                    width: ScreenUtil.instance.setWidth(280),
                        margin: const EdgeInsets.only(
                            left: 4, right: 4),
                        decoration: BoxDecoration(
                          color: Colors.blueGrey,
                          borderRadius: BorderRadius.all(
                              Radius.circular(25)
                          ),
                        ),
                        child: IconButton(
                            icon: Icon(
                              Icons.plus_one,
                              color: Colors.white,
                            ),
                            onPressed: () {
                              showDialog(
                                  context: context,
                                  builder: (context) => AddPromocaoDialog(
                                  ));
                            }),
                      ),
                  Text('Produto 05')
                ],
              )
            ],
          ),
        ],
      ),
    );
  }
}
