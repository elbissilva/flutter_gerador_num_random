import 'package:flutter/material.dart';

class PageConfig extends StatefulWidget {
  const PageConfig({super.key});

  @override
  State<PageConfig> createState() => _PageConfigState();
}

class _PageConfigState extends State<PageConfig> {
  bool receberNotificacoes = false;
  bool temaEscuro = false;
  var nomeController = TextEditingController();
  var pesoController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            appBar: AppBar(
              title: const Text("Configurações"),
            ),
            body: Container(
              margin: const EdgeInsets.symmetric(horizontal: 20),
              child: ListView(
                children: [
                  const SizedBox(
                    height: 20,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: TextField(
                      decoration:
                          const InputDecoration(hintText: "Nome do usuáro"),
                      controller: nomeController,
                    ),
                  ),
                  Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: TextField(
                        keyboardType: TextInputType.number,
                        decoration: const InputDecoration(hintText: "Peso"),
                        controller: pesoController,
                      )),
                  SwitchListTile(
                    title: const Text("Receber notificações"),
                    onChanged: (bool value) {
                      setState(() {
                        receberNotificacoes = !receberNotificacoes;
                      });
                    },
                    value: receberNotificacoes,
                  ),
                  SwitchListTile(
                    title: const Text("Tema escuro"),
                    onChanged: (bool value) {
                      setState(() {
                        temaEscuro = !temaEscuro;
                      });
                    },
                    value: temaEscuro,
                  ),
                  TextButton(
                    style: ButtonStyle(
                        shape: MaterialStateProperty.all(RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8))),
                        backgroundColor:
                            MaterialStateProperty.all(Colors.blue)),
                    onPressed: () {},
                    child: const Text(
                      "Salvar",
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ],
              ),
            )));
  }
}
