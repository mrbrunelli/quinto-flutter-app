import 'package:flutter/material.dart';

class Funcoes {
  void mostrarMensagem(BuildContext context, String titulo, String mensagem) {
    showDialog(
        context: context, 
        builder: (context) {
          return AlertDialog(
            title: Text(titulo),
            content: Text(mensagem),
            actions: [
              TextButton(
                  onPressed: () {
                    _fecharTelaAtual(context);
                  },
                  child: Text("Ok")
              ),
            ],
          );
        }
    );
  }

  static Widget criarIcone(IconData icone) {
    return icone != null ? _criarIconeEspacado(icone) : Container();
  }
  
  static _criarIconeEspacado(IconData icone) {
    return Padding(
      padding: EdgeInsets.all(4),
      child: Icon(icone),
    );
  }
  
  void _fecharTelaAtual(BuildContext context) {
    Navigator.pop(context);
  }
}