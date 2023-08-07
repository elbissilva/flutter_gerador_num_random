import 'dart:math';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int? numGerado;
  int? quantidadeCliques = 0;

  final CHAVE_NG = "_numAleatório";
  final CHAVE_CR = "quantidade_cliques";
  late SharedPreferences historico;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    carregarDados();
  }

  void carregarDados() async {
    historico = await SharedPreferences.getInstance();

    setState(() {
      numGerado = historico.getInt(CHAVE_NG);
      quantidadeCliques = historico.getInt(CHAVE_CR);
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
              ),
              Text(
                numGerado == null
                    ? "Nenhum número gerado"
                    : numGerado.toString(),
              ),
              const Text(
                'Clique realizado:',
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
            var random = Random();
            var contador = quantidadeCliques;

            setState(() {
              numGerado = random.nextInt(100);
              quantidadeCliques = contador! + 1;
            });
            historico.setInt(CHAVE_NG, numGerado!);
            historico.setInt(CHAVE_CR, quantidadeCliques!);
          },
          child: const Icon(Icons.add),
        ),
      ),
    );
  }
}
