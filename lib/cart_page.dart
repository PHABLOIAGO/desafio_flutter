import 'package:desafioflutter/revenda_model.dart';
import 'package:flutter/material.dart';

class CartPage extends StatefulWidget {
  final RevendaModel revenda;

  const CartPage(this.revenda, {Key key}) : super(key: key);
  @override
  _CartPageState createState() => _CartPageState(revenda);
}

class _CartPageState extends State<CartPage> {
  final RevendaModel revenda;
  int quantidade = 0;

  _CartPageState(this.revenda);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        title: Text("Selecionar Produtos"),
        actions: [
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
            padding: EdgeInsets.all(20),
            color: Colors.white,
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height * 0.15,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Column(
                      children: [
                        Icon(Icons.circle, color: Colors.blue),
                        SizedBox(
                          height: 5,
                        ),
                        Text("Comprar"),
                      ],
                    ),
                    Expanded(
                      child: Divider(
                        thickness: 2,
                      ),
                    ),
                    Column(
                      children: [
                        Icon(
                          Icons.radio_button_unchecked,
                          color: Colors.grey,
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Text(
                          "Pagamento",
                        ),
                      ],
                    ),
                    Expanded(
                      child: Divider(
                        thickness: 2,
                      ),
                    ),
                    Column(
                      children: [
                        Icon(
                          Icons.radio_button_unchecked,
                          color: Colors.grey,
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Text("Confirmação"),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
          Divider(
            height: 2,
            thickness: 2,
          ),
          Container(
            padding: EdgeInsets.all(10),
            color: Colors.white,
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height * 0.10,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Container(
                      height: 30,
                      width: 30,
                      decoration: BoxDecoration(
                          color: Colors.black,
                          borderRadius: BorderRadius.circular(15)),
                      child: Center(
                          child: Text(
                        "$quantidade",
                        style: TextStyle(color: Colors.white),
                      )),
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    Row(
                      children: [
                        Container(
                          width: 110,
                          child: Text(
                            "${revenda.nome}",
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                        Text(" - Botijão de 13kg")
                      ],
                    ),
                  ],
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.baseline,
                  children: [
                    Text("R\$", style: TextStyle(fontSize: 10)),
                    Text(
                      "${(quantidade * revenda.preco).toStringAsFixed(2).replaceAll(".", ",")}",
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                    )
                  ],
                ),
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.all(20),
            width: MediaQuery.of(context).size.width - 40,
            height: 150,
            decoration: BoxDecoration(
                color: Colors.white, borderRadius: BorderRadius.circular(10)),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Icon(
                        Icons.home,
                        color: Colors.grey,
                        size: 40,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(revenda.nome),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(revenda.nota.toStringAsFixed(2)),
                                  Icon(Icons.star, color: Colors.yellow),
                                ],
                              ),
                              Row(
                                children: [
                                  Text(revenda.tempoMedio),
                                  Text("min")
                                ],
                              ),
                            ],
                          )
                        ],
                      ),
                      Container(
                        width: 90,
                        height: 30,
                        color: Color(int.parse("0xFF${revenda.cor}")),
                        child: Center(
                            child: Text(
                          revenda.tipo,
                          style: TextStyle(color: Colors.white),
                        )),
                      )
                    ],
                  ),
                ),
                Divider(),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        children: [
                          Text("Botijão de 13kg"),
                          Text(revenda.nome),
                          Row(
                            children: [
                              Text("R\$", style: TextStyle(fontSize: 10)),
                              Text(
                                "${revenda.preco.toStringAsFixed(2).replaceAll(".", ",")}",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 20),
                              )
                            ],
                          )
                        ],
                      ),
                      Row(
                        children: [
                          IconButton(
                            icon: Icon(Icons.remove_circle, size: 30),
                            onPressed: quantidade > 0 ? () {
                              setState(() {
                                quantidade--;
                              });
                            } : null,
                          ),
                          Container(
                            height: 60,
                            width: 50,
                            decoration: BoxDecoration(
                                color: Colors.orange,
                                borderRadius: BorderRadius.circular(25)),
                            child: Center(
                                child: Text(
                              '$quantidade',
                              style: TextStyle(fontSize: 21),
                            )),
                          ),
                          IconButton(
                            icon: Icon(
                              Icons.add_circle,
                              size: 30,
                            ),
                            onPressed: () {
                              setState(() {
                                quantidade++;
                              });
                            },
                          ),
                        ],
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
          Expanded(child: Container()),
          Container(
            height: 70,
            width: 200,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(35),
                gradient: LinearGradient(
                    colors: [Colors.blue[200], Colors.blue[700]])),
            child: Center(
                child: Text(
              "IR PARA PAGAMENTO",
              style:
                  TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
            )),
          )
        ],
      ),
    );
  }
}
