import 'dart:convert';

class RevendaModel {
    RevendaModel({
        this.tipo,
        this.nome,
        this.cor,
        this.nota,
        this.tempoMedio,
        this.melhorPreco,
        this.preco,
    });

    String tipo;
    String nome;
    String cor;
    double nota;
    String tempoMedio;
    bool melhorPreco;
    double preco;

    RevendaModel copyWith({
        String tipo,
        String nome,
        String cor,
        double nota,
        String tempoMedio,
        bool melhorPreco,
        double preco,
    }) => 
        RevendaModel(
            tipo: tipo ?? this.tipo,
            nome: nome ?? this.nome,
            cor: cor ?? this.cor,
            nota: nota ?? this.nota,
            tempoMedio: tempoMedio ?? this.tempoMedio,
            melhorPreco: melhorPreco ?? this.melhorPreco,
            preco: preco ?? this.preco,
        );

    factory RevendaModel.fromJson(String str) => RevendaModel.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory RevendaModel.fromMap(Map<String, dynamic> json) => RevendaModel(
        tipo: json["tipo"],
        nome: json["nome"],
        cor: json["cor"],
        nota: json["nota"].toDouble(),
        tempoMedio: json["tempoMedio"],
        melhorPreco: json["melhorPreco"],
        preco: json["preco"].toDouble(),
    );

    Map<String, dynamic> toMap() => {
        "tipo": tipo,
        "nome": nome,
        "cor": cor,
        "nota": nota,
        "tempoMedio": tempoMedio,
        "melhorPreco": melhorPreco,
        "preco": preco,
    };
}
