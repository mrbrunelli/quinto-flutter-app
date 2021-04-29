import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:quinto_flutter_app/widgets/barra_titulo.dart';
import 'package:http/http.dart' as http;
import 'package:transparent_image/transparent_image.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: BarraTitulo.criar("Emissoras", icone: Icons.tv),
      backgroundColor: Colors.grey[200],
      body: Column(
        children: <Widget>[
          Expanded(
            child: FutureBuilder(
              future: _getListaEmissoras(),
              builder: (context, snapshot) {
                switch (snapshot.connectionState) {
                  case ConnectionState.waiting:
                  case ConnectionState.none:
                    return CircularProgressIndicator(
                      valueColor: AlwaysStoppedAnimation<Color>(Colors.black),
                      strokeWidth: 5,
                    );
                  default:
                    if (snapshot.hasError) {
                      return Text("Erro." + snapshot.error.toString());
                    } else {
                      return _criarListagem(context, snapshot);
                    }
                }
              },
            ),
          ),
        ],
      ),
    );
  }

  Future<List<dynamic>> _getListaEmissoras() async {
    String link = "http://controle.mdvsistemas.com.br/Novelas/Emissoras/GetEmissora";
    Uri uri = Uri.parse(link);
    http.Response response = await http.get(uri);
    return json.decode(response.body);
  }

  Widget _criarListagem(BuildContext ctx, AsyncSnapshot snapshot) {
    return ListView.builder(
      padding: EdgeInsets.all(10),
      scrollDirection: Axis.vertical,
      itemCount: snapshot.data.length,
      itemBuilder: (ctx, index) {
        return Card(
          color: Colors.white,
          child: Padding(
            padding: EdgeInsets.all(10),
            child: Row(
              children: <Widget>[
                FadeInImage.memoryNetwork(
                  placeholder: kTransparentImage,
                  image: snapshot.data[index]["Emi_Logo"]
                      .toString()
                      .replaceAll("~/", "http://controle.mdvsistemas.com.br/"),
                  height: 75,
                  width: 75,
                ),
                Expanded(
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 10),
                      child: Text(
                        snapshot.data[index]["Emi_Nome"].toString(),
                        style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold),
                      ),
                    )
                ),
              ],
            ),
          ),
        );
      }
    );
  }
}
