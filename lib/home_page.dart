import 'dart:convert';
import 'package:desafioflutter/card_widget.dart';
import 'package:desafioflutter/cart_page.dart';
import 'package:desafioflutter/revenda_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<String> filtros = ["Melhor Avaliação", "Mais Rápido", "Mais Barato"];
  List<RevendaModel> revendas;
  @override
  void initState() {
    rootBundle.loadString("assets/dados.json").then((value) {
      var temp = json.decode(value);
      setState(() {
        revendas = (temp as List).map((r) => RevendaModel.fromMap(r)).toList();
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        title: Text("Escolha uma revenda"),
        actions: [
          PopupMenuButton(
            icon: Icon(Icons.swap_vert),
            itemBuilder: (_) => filtros
                .map(
                  (filter) => PopupMenuItem(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(filter),
                        Checkbox(
                          value: false,
                          onChanged: (value) {},
                        )
                      ],
                    ),
                  ),
                )
                .toList(),
          ),
          PopupMenuButton(
            icon: Icon(Icons.help_outline_sharp),
            itemBuilder: (_) => [
              PopupMenuItem(child: Text('Suporte')),
              PopupMenuItem(child: Text('Termos de serviço')),
            ],
          )
        ],
      ),
      body: Column(
        children: [
          Container(
            color: Colors.white,
            width: double.infinity,
            height: MediaQuery.of(context).size.height * 0.13,
            padding: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Botijões de 13kg em:",
                      style: TextStyle(color: Colors.grey, fontSize: 10),
                    ),
                    Text("Av Paulista, 1001"),
                    Text(
                      "Paulista, São Paulo, SP",
                      style: TextStyle(color: Colors.grey),
                    )
                  ],
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.location_on_rounded,
                      color: Colors.blue,
                    ),
                    Text(
                      "Mudar",
                      style: TextStyle(color: Colors.blue),
                    )
                  ],
                )
              ],
            ),
          ),
          Expanded(
            child: ListView.separated(
              padding: EdgeInsets.only(top:20, left: 10, right:10),
              separatorBuilder: (_, index) => SizedBox(
                height: 15,
              ),
              itemCount: revendas?.length ?? 0,
              itemBuilder: (_, index) {
                return GestureDetector(
                  child: CardWidget(revendas[index]),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => CartPage(revendas[index]),
                      ),
                    );
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
