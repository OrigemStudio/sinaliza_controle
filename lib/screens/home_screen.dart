import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sinaliza_controle/blocs/orders_bloc.dart';
import 'package:sinaliza_controle/blocs/user_bloc.dart';
import 'package:sinaliza_controle/dialogs/dialog_choose_category.dart';
import 'package:sinaliza_controle/taps/promocao_tab.dart';
import 'package:sinaliza_controle/taps/profile_tab.dart';
import 'package:flutter/material.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  
  DocumentSnapshot snapshot;
  
  _HomeScreenState({this.snapshot});
  
  PageController _pageController;
  int _page = 0;

  UserBloc _userBloc;
  OrdersBloc _ordersBloc;

  @override
  void initState() {
    super.initState();

    _pageController = PageController();

    _userBloc = UserBloc();
    _ordersBloc = OrdersBloc();
  }

  @override
  void dispose() {
    _pageController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    ScreenUtil.getInstance()..init(context);
    return Scaffold(
      backgroundColor: Colors.white,
      bottomNavigationBar: Theme(
        data: Theme.of(context).copyWith(
            canvasColor: Colors.pinkAccent,
            primaryColor: Colors.white,
            textTheme: Theme.of(context)
                .textTheme
                .copyWith(caption: TextStyle(color: Colors.white54))),
        child: CurvedNavigationBar(
          index: 0,
          height: 55.0,
          onTap: (p) {
            _pageController.animateToPage(p,
                duration: Duration(milliseconds: 250), curve: Curves.ease);
          },
          items: [
            Icon(Icons.home, size: 30, color: Colors.white),
            Icon(Icons.list, size: 30, color: Colors.white),
            //Icon(Icons.timer, size: 30, color: Colors.white),
          ],
          color: Colors.purple,
          buttonBackgroundColor: Colors.green,
          backgroundColor: Colors.white,
          animationCurve: Curves.easeInOut,
        ),
      ),
      body: SafeArea(
        child: BlocProvider<UserBloc>(
          bloc: _userBloc,
          child: BlocProvider<OrdersBloc>(
            bloc: _ordersBloc,
            child: PageView(
              controller: _pageController,
              onPageChanged: (p) {
                setState(() {
                  _page = p;
                });
              },
              children: <Widget>[
                Scaffold(
                  appBar: AppBar(
                    title: Text('Perfil da Empresa',
                      style: TextStyle(
                        fontSize: ScreenUtil.instance.setSp(50),
                      ),
                    ),
                    shape: new RoundedRectangleBorder(
                        borderRadius: new BorderRadius.only(
                            bottomLeft: Radius.circular(30),
                            bottomRight: Radius.circular(30),
                          topLeft: Radius.circular(30),
                          topRight: Radius.circular(30),
                        )),
                    actions: <Widget>[
                      RaisedButton(
                        padding: EdgeInsets.only(
                          left: 16,
                          right: 16,
                        ),
                        onPressed: () {
                          showDialog(
                              context: context,
                              builder: (context) => DialogChooseCategory(
                              ));
                        },
                        textColor: Colors.white,
                        color: Colors.blueGrey,
                        shape: RoundedRectangleBorder(
                            borderRadius: new BorderRadius.circular(30.0)),
                        child: Text('Escolher Categoria',
                          style: TextStyle(
                            fontSize: ScreenUtil.instance.setSp(40),
                          ),
                        ),
                      ),
                    ],
                  ),
                  body: ProfileTab(),
                ),
                Scaffold(
                  appBar: AppBar(
                    title: Text('Promoções Diárias',
                      style: TextStyle(
                        fontSize: ScreenUtil.instance.setSp(50),
                      ),
                    ),
                    shape: new RoundedRectangleBorder(
                        borderRadius: new BorderRadius.only(
                          bottomLeft: Radius.circular(30),
                          bottomRight: Radius.circular(30),
                          topLeft: Radius.circular(30),
                          topRight: Radius.circular(30),
                    )),
                    actions: <Widget>[
                      RaisedButton(
                        onPressed: () {
                          showDialog(
                              context: context,
                              builder: (context) => DialogChooseCategory(
                              ));
                        },
                        textColor: Colors.white,
                        color: Colors.blueGrey,
                        shape: RoundedRectangleBorder(
                            borderRadius: new BorderRadius.circular(30.0)),
                        child: Text('Escolher Categoria',
                          style: TextStyle(
                            fontSize: ScreenUtil.instance.setSp(40),
                          ),
                        ),
                      ),
                    ],
                  ),
                  body: PromocaoTab(),
                ),
              ],
            ),
          ),
        ),
      ),
      floatingActionButton: _buildFloating(),
    );
  }

  // ignore: missing_return
  Widget _buildFloating() {
    switch (_page) {
      case 0:
        return null;
      case 1:
        return null;
    }
  }
}
