import 'package:desafioflutter/revenda_model.dart';
import 'package:flutter/material.dart';

class CardWidget extends StatelessWidget {
  final RevendaModel revenda;

  const CardWidget(this.revenda, {Key key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.max,
      children: [
        RotatedBox(
          quarterTurns: 3,
          child: Container(
            height: 35,
            width: 90,
            alignment: Alignment.center,
            child: Text(
              revenda.tipo,
              style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 12),
            ),
            decoration: BoxDecoration(
              color: Color(int.parse("0xFF${revenda.cor}")),
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(5),
                topRight: Radius.circular(5),
              ),
            ),
          ),
        ),
        Expanded(
          child: Container(
            padding: EdgeInsets.only(left: 5, top: 5, bottom: 5),
            height: 90,
            child: Container(
              padding: EdgeInsets.only(top: 5, left: 5, bottom: 5),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(revenda.nome),
                      revenda.melhorPreco
                          ? Container(
                              height: 30,
                              width: 100,
                              decoration: BoxDecoration(
                                color: Colors.orange[300],
                                borderRadius: BorderRadius.only(
                                  bottomLeft: Radius.circular(5),
                                  topLeft: Radius.circular(5),
                                ),
                              ),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Icon(Icons.label, color: Colors.white,size: 20,),
                                  Text("Melhor Preço", style: TextStyle(fontSize: 12, color: Colors.white),)
                                ],
                              ),
                            )
                          : Container()
                    ],
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text("Nota",style: TextStyle(fontSize: 12, color: Colors.grey)),
                          Row(
                            children: [
                              Text("${revenda.nota}", style: TextStyle(fontSize:16, fontWeight: FontWeight.bold),),
                              Icon(Icons.star, color: Colors.yellow, size: 20,)
                            ],
                          )
                        ],
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text("Tempo Médio",style: TextStyle(fontSize: 12, color: Colors.grey)),
                          Row(
                            children: [
                              Text("${revenda.tempoMedio}", style: TextStyle(fontSize:16, fontWeight: FontWeight.bold),),
                              Text("min")
                            ],
                          )
                        ],
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text("Preço",style: TextStyle(fontSize: 12, color: Colors.grey)),
                          Text("R\$ ${revenda.preco.toStringAsFixed(2).replaceAll(".", ",")}", style: TextStyle(fontSize:16, fontWeight: FontWeight.bold),)
                        ],
                      )
                    ],
                  )
                ],
              ),
            ),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                bottomRight: Radius.circular(5),
                topRight: Radius.circular(5),
              ),
            ),
          ),
        )
      ],
    );
  }
}
