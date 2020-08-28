import 'package:sinaliza_controle/blocs/login_bloc.dart';
import 'package:sinaliza_controle/screens/home_screen.dart';
import 'package:sinaliza_controle/widget/imput_field.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final loginbloc = LoginBloc();

  @override
  void initState() {
    super.initState();

    loginbloc.outState.listen((state) {
      switch (state) {
        case LoginState.SUCCESS:
          Navigator.of(context).pushReplacement(
              MaterialPageRoute(builder: (context) => HomeScreen()));
          break;
        case LoginState.FAIL:
          showDialog(
              context: context,
              builder: (context) => AlertDialog(
                    title: Text("Erro"),
                    content: Text("Você não possui os privilégios necessários"),
                  ));
          break;
        case LoginState.LOADING:
        case LoginState.IDLE:
      }
    });
  }

  @override
  void dispose() {
    loginbloc.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: StreamBuilder<LoginState>(
          stream: loginbloc.outState,
          initialData: LoginState.LOADING,
          // ignore: missing_return
          builder: (context, snapshot) {
            switch (snapshot.data) {
              case LoginState.LOADING:
                return Center(
                  child: CircularProgressIndicator(
                    valueColor: AlwaysStoppedAnimation(Colors.pinkAccent),
                  ),
                );
              case LoginState.FAIL:
              case LoginState.SUCCESS:
              case LoginState.IDLE:
                return Stack(
                  alignment: Alignment.center,
                  children: <Widget>[
                    Container(),
                    SingleChildScrollView(
                      child: Container(
                        margin: EdgeInsets.all(32),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: <Widget>[
                            new Image.asset(
                              'assets/sinaliza_notification.png',
                              height: 150,
                            ),
                            SizedBox(
                              height: MediaQuery.of(context).size.height * .02,
                            ),
                            new Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: <Widget>[
                                Text(
                                  'Sinaliza Controle',
                                  style: TextStyle(
                                      fontSize: 18, color: Colors.purple),
                                ),
                                new Container(
                                  height: 50,
                                ),
                              ],
                            ),
                            InputField(
                              icon: Icons.person_outline,
                              hint: "Usuário",
                              obscure: false,
                              stream: loginbloc.outEmail,
                              onChanged: loginbloc.changeEmail,
                            ),
                            SizedBox(
                              height: MediaQuery.of(context).size.height / 45,
                            ),
                            InputField(
                              icon: Icons.lock_outline,
                              hint: "Senha",
                              obscure: true,
                              stream: loginbloc.outPassword,
                              onChanged: loginbloc.changePassword,
                            ),
                            SizedBox(
                              height: 32,
                            ),
                            StreamBuilder<bool>(
                                stream: loginbloc.outSubmitValid,
                                builder: (context, snapshot) {
                                  return SizedBox(
                                    height: 50,
                                    child: RaisedButton(
                                        color: Colors.purple,
                                        child: Text(
                                          "Entrar",
                                          style: TextStyle(color: Colors.white),
                                        ),
                                        onPressed: snapshot.hasData
                                            ? loginbloc.submit
                                            : null,
                                        textColor: Colors.white,
                                        disabledColor:
                                            Colors.blueGrey.withAlpha(140),
                                        shape: new RoundedRectangleBorder(
                                            borderRadius:
                                                new BorderRadius.circular(
                                                    30.0))),
                                  );
                                }),
                          ],
                        ),
                      ),
                    ),
                  ],
                );
            }
          }),
    );
  }
}
