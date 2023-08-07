import 'package:flutter/material.dart';
import 'package:flutter_gerador_num_random/config_page.dart';
import 'package:flutter_gerador_num_random/page.dart';

import 'package:flutter_gerador_num_random/widgets/imageApp.dart';

class CustonDrawer extends StatelessWidget {
  const CustonDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          UserAccountsDrawerHeader(
              decoration: const BoxDecoration(color: Colors.blue),
              currentAccountPicture: CircleAvatar(
                backgroundColor: Colors.white,
                child: Image.asset(ImageAPP.logo),
              ),
              accountName: const Text("SRS-PA"),
              accountEmail: const Text("srs@gmail.com")),
          InkWell(
            child: Container(
              padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
              width: double.infinity,
              child: const Row(
                children: [
                  Icon(Icons.numbers),
                  SizedBox(
                    width: 5,
                  ),
                  Text("Pagina de Números"),
                ],
              ),
            ),
            onTap: () {
              Navigator.pop(context);
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const HomePage()));
            },
          ),
          const Divider(color: Colors.black87),
          InkWell(
            child: Container(
              padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
              width: double.infinity,
              child: const Row(
                children: [
                  Icon(Icons.settings),
                  SizedBox(
                    width: 5,
                  ),
                  Text("Configurações"),
                ],
              ),
            ),
            onTap: () {
              Navigator.pop(context);
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const PageConfig()));
            },
          ),
          const Divider(color: Colors.black87),
          InkWell(
            child: Container(
              padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
              width: double.infinity,
              child: const Row(
                children: [
                  Icon(Icons.exit_to_app),
                  SizedBox(
                    width: 5,
                  ),
                  Text("Sair")
                ],
              ),
            ),
            onTap: () {
              showDialog(
                  context: context,
                  builder: (BuildContext bc) {
                    return AlertDialog(
                      title: const Text("AgendExame"),
                      content: const Wrap(
                        children: [
                          Text("Tem certeza que você deseja sair?"),
                        ],
                      ),
                      actions: [
                        TextButton(
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            child: const Text("Não")),
                        TextButton(onPressed: () {}, child: const Text("Sim"))
                      ],
                    );
                  });
            },
          ),
          const Divider(
            color: Colors.black,
          )
        ],
      ),
    );
  }
}
