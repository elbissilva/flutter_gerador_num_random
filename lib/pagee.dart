import 'dart:math';

import 'package:flutter/material.dart';
import 'package:rx_shared_preferences/rx_shared_preferences.dart';

class Pagee extends StatefulWidget {
  const Pagee({super.key});

  State<Pagee> createState() => _PageeState();
}

class _PageeState extends State<Pagee> {
  int numGerado = 0;
  int clikesRealizados = 0;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.yellow,
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
                numGerado.toString(),
              ),
              const Text("Númeor de clikes:"),
              Text(clikesRealizados.toString())
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () async {
            final ultimoNumGerado = await RxSharedPreferences.getInstance();
            var random = Random();
            var contador = clikesRealizados;

            setState(() {
              numGerado = random.nextInt(100);
              clikesRealizados = contador + 1;
            });
            ultimoNumGerado.setInt("_numAleatóri", numGerado);
            var numero = ultimoNumGerado.getInt("_numAleatóri");
            print(numero);
          },
          child: const Icon(Icons.add),
        ),
      ),
    );
  }
}
