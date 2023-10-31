// ignore_for_file: override_on_non_overriding_member

import 'package:flutter/material.dart';
import 'package:mydocs/config/config.dart';

class docViewer extends StatefulWidget {
  const docViewer({Key? key}) : super(key: key);

  @override
  State<docViewer> createState() => _docViewerState();
}

class _docViewerState extends State<docViewer> {
  final List<Map> myProducts =
      List.generate(100, (index) => {"id": index, "name": "Fichier $index"})
          .toList();
  TextEditingController searchController =
      TextEditingController(); // Contrôleur de champ de recherche
  @override
  Radius containerRaduis = const Radius.circular(30);
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Config.colors.appBarColor,
      appBar: AppBar(
        title: Text(
          'Documents',
          style: const TextStyle(
            color: Colors.white,
          ),
        ),
        elevation: 0,
        backgroundColor: Config.colors.appBarColor,
      ),
      body: DecoratedBox(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topRight: containerRaduis,
            topLeft: containerRaduis,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.only(
            left: 12,
            right: 12,
            top: 20,
          ),
          child: Center(
            child: Column(
              children: [
                SearchBar(
                  hintText: "Rechercher...",
                ),
                SizedBox(height: 20),
                Expanded(
                  child: ListView.builder(
                    itemCount: myProducts.length,
                    itemBuilder: (BuildContext ctx, index) {
                      return Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(6.0),
                            child: Container(
                              decoration: BoxDecoration(
                                  color: Color.fromARGB(255, 251, 240, 240),
                                  borderRadius: BorderRadius.circular(12)),
                              child: ListTile(
                                title: Row(
                                  children: [
                                    Text(
                                      (myProducts[index]["name"].length >= 10)
                                          ? myProducts[index]["name"]
                                              .substring(0, 10)
                                          : myProducts[index]["name"],
                                    ),
                                  ],
                                ),
                                subtitle: Text(''),
                                leading: Icon(
                                  size: 60,
                                  Icons.description,
                                  color: Colors.blue,
                                ),
                                onTap: () {},
                                trailing: const SizedBox(
                                  width: 100,
                                  child: Row(
                                    children: [
                                      // Ajoutez ici d'autres widgets pour les boutons si nécessaire
                                    ],
                                  ),
                                ),
                                tileColor: Colors.grey[300],
                              ),
                            ),
                          ),
                        ],
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
