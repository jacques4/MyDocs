import 'package:flutter/material.dart';

class MyFiles extends StatefulWidget {
  const MyFiles({Key? key}) : super(key: key);

  @override
  State<MyFiles> createState() => _MyFilesState();
}

class _MyFilesState extends State<MyFiles> {
  final List<Map> myProducts =
      List.generate(100, (index) => {"id": index, "name": "Fichier $index"})
          .toList();
  TextEditingController searchController =
      TextEditingController(); // Contrôleur de champ de recherche

  @override
  Widget build(BuildContext context) {
    final Radius containerRaduis = const Radius.circular(30);
    return DecoratedBox(
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
        child: Column(
          children: [
            SearchBar(
              hintText: "Rechercher...",
            ),
            SizedBox(height: 20),
            Expanded(
              child: GridView.builder(
                gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                  maxCrossAxisExtent: MediaQuery.of(context).size.width /
                      3, // Largeur maximale de chaque élément
                  // maxCrossAxisExtent: 200,
                  childAspectRatio: 3 / 2,
                  crossAxisSpacing: 20,
                  mainAxisSpacing: 30,
                ),
                itemCount: myProducts.length,
                itemBuilder: (BuildContext ctx, index) {
                  return Column(
                    children: [
                      Container(
                        height: 40, // Hauteur de l'image
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage('assets/images/pdf.png'),
                            fit: BoxFit.fitHeight,
                          ),
                          //  borderRadius: BorderRadius.circular(15),
                        ),
                      ),
                      SizedBox(
                          height: 10), // Espacement entre le texte et l'image
                      Expanded(
                        child: Text(
                          (myProducts[index]["name"].length >= 10)
                              ? myProducts[index]["name"].substring(0, 10)
                              : myProducts[index]["name"],
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
    );
  }
}
