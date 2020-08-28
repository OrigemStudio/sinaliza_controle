import 'package:flutter/material.dart';

class InputField extends StatelessWidget {
  final IconData icon;
  final String hint;
  final bool obscure;
  final Stream<String> stream;
  final Function(String) onChanged;

  InputField({this.icon, this.hint, this.obscure, this.stream, this.onChanged});

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<String>(
        stream: stream,
        builder: (context, snapshot) {
          return TextField(
            onChanged: onChanged,
            decoration: InputDecoration(
              contentPadding:
                  new EdgeInsets.symmetric(vertical: 10.0, horizontal: 10.0),
              border: OutlineInputBorder(
                borderRadius:
                    const BorderRadius.all(const Radius.circular(28.0)),
                borderSide: BorderSide(
                  color: Colors.blue,
                ),
              ),
              icon: Icon(
                icon,
                color: Colors.purple,
              ),
              labelText: hint,
              labelStyle: TextStyle(color: Colors.purple),
              errorText: snapshot.hasError ? snapshot.error : null,
            ),
            style: TextStyle(color: Colors.black),
            obscureText: obscure,
          );
        });
  }
}
