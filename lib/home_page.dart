import 'package:flutter/material.dart';
import 'package:flutter_gerador_num_random/widgets/drawer_customizado.dart';
import 'package:flutter_gerador_num_random/widgets/imageApp.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.yellow,
          title: const Text(
            "Gerador de números aleatórios",
            style: TextStyle(fontWeight: FontWeight.w800),
          ),
        ),
        drawer: const CustonDrawer(),
        backgroundColor: const Color.fromARGB(255, 198, 212, 217),
        body: Center(
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
            const SizedBox(
              height: 50,
            ),
            Row(
              children: [
                Expanded(child: Container()),
                Expanded(
                  flex: 10,
                  child: Image.asset(
                    ImageAPP.logo,
                  ),
                ),
                Expanded(child: Container()),
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            Container(
                width: double.infinity,
                margin: const EdgeInsets.symmetric(horizontal: 100),
                alignment: Alignment.topRight,
                child: const Text("Silva Representações e Desenvolvimentos")),
            const SizedBox(
              height: 5,
            ),
            Column(
              children: [
                Container(
                    margin:
                        const EdgeInsets.symmetric(horizontal: 8, vertical: 10),
                    width: double.infinity,
                    child: Card(
                      elevation: 8,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 8, vertical: 10),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Row(
                              children: [
                                SizedBox(
                                  width: 10,
                                ),
                                Text(
                                  "Projeto",
                                  style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.w700),
                                ),
                              ],
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            const Text(
                              "Proposta de desenvolvimento",
                              textAlign: TextAlign.justify,
                            ),
                            TextButton(
                              onPressed: () {},
                              child: const Text("Ler mais"),
                            )
                          ],
                        ),
                      ),
                    )),
              ],
            )
          ]),
        ),
      ),
    );
  }
}
