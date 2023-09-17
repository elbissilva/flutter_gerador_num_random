import 'dart:math';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class NumPage extends StatefulWidget {
  const NumPage({super.key});

  @override
  State<NumPage> createState() => _NumPageState();
}

class _NumPageState extends State<NumPage> {
  int? numGerado;
  int? quantidadeCliques;

  final CHAVE_NG = "numAleatório";
  final CHAVE_CR = "quantidade_cliques";
  late SharedPreferences storage;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    carregarDados();
  }

  void carregarDados() async {
    storage = await SharedPreferences.getInstance();
    setState(() {
      numGerado = storage.getInt(CHAVE_NG);
      quantidadeCliques = storage.getInt(CHAVE_CR);
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.blue,
          title: const Text(
            "Gerador de Números Aleatórios",
            style: TextStyle(color: Colors.black),
          ),
          centerTitle: true,
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              const Text(
                'Número aleatório gerado:',
                style: TextStyle(fontSize: 20),
              ),
              Text(
                numGerado == null
                    ? "Nenhum número gerado"
                    : numGerado.toString(),
              ),
              const Text(
                'Clique realizado:',
                style: TextStyle(fontSize: 20),
              ),
              Text(
                quantidadeCliques == null
                    ? "Nenhum clique realizado"
                    : quantidadeCliques.toString(),
              ),
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () async {
            storage = await SharedPreferences.getInstance();
            var random = Random();
            setState(() {
              numGerado = random.nextInt(1000);
              quantidadeCliques = (quantidadeCliques ?? 0) + 1;
            });
            storage.setInt(CHAVE_NG, numGerado!);
            storage.setInt(CHAVE_CR, quantidadeCliques!);
          },
          child: const Icon(Icons.add),
        ),
      ),
    );
  }
}
