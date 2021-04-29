import 'package:flutter/material.dart';

class CampoTexto {
  static Widget criar(TextEditingController ctx, String label, String prefix, TextInputType keyboard) {
    return Container(
      padding: EdgeInsets.fromLTRB(16, 8, 16, 8),
      child: TextField(
        controller: ctx,
        decoration: InputDecoration(
            border: OutlineInputBorder(),
            labelText: label,
            labelStyle: TextStyle(color: Colors.blue, fontSize: 18),
            prefixText: prefix,
            prefixStyle: TextStyle(color: Colors.green[900], fontSize: 26)
        ),
        style: TextStyle(color: Colors.blue, fontSize: 32),
        keyboardType: keyboard,
      ),
    );
  }
}