import 'package:flutter/material.dart';
import '../funcoes.dart';
import 'botao.dart';

class BarraTitulo {
  static Widget criar(String titulo, {IconData icone, IconData iconeAcao, Function evento, bool tituloCentralizado = true}){
    return AppBar(
      title: Row(
        children: [
          Funcoes.criarIcone(icone),
          Text(titulo),
        ],
      ),
      centerTitle: tituloCentralizado,
      actions: [
        _criarBotaoAcao(iconeAcao, evento)
      ],
    );
  }

  static Widget _criarBotaoAcao(IconData icone, Function evento) {
    return icone != null ? Botao.criarBotaoBarra(icone, evento) : Container();
  }
}