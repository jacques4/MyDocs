// ignore_for_file: must_be_immutable, unused_element

import 'dart:async';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:mydocs/routes/api_url.dart';

class HomeView extends StatefulWidget {
  HomeView({Key? key}) : super(key: key);

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  final Radius containerRaduis = const Radius.circular(30);

  final dio = Dio();

  Future<List<dynamic>>? documentsFuture;

  @override
  void initState() {
    super.initState();
    documentsFuture = fetchDocuments();
  }

  @override
  Widget build(BuildContext context) {
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
        child: SizedBox(
          height: double.maxFinite,
          width: double.maxFinite,
          child: Column(
            children: [
              SizedBox(
                child: TextField(
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Color.fromARGB(255, 251, 240, 240),
                    hintText: 'Chercher un document par le titre...',
                    hintStyle: const TextStyle(
                      color: Color.fromARGB(255, 129, 123, 123),
                      fontSize: 17,
                      fontWeight: FontWeight.w400,
                    ),
                    border: OutlineInputBorder(
                      borderSide: BorderSide.none,
                      borderRadius: BorderRadius.circular(50),
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              FutureBuilder<List<dynamic>>(
                future: documentsFuture,
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return _buildLoading();
                  } else if (snapshot.hasError) {
                    return Text('Error: ${snapshot.error}');
                  } else if (snapshot.hasData) {
                    return Expanded(
                      child: ListView.builder(
                        itemCount: snapshot.data!.length,
                        itemBuilder: (context, index) {
                          return Padding(
                            padding: const EdgeInsets.all(6.0),
                            child: Container(
                              decoration: BoxDecoration(
                                  color: Color.fromARGB(255, 251, 240, 240),
                                  borderRadius: BorderRadius.circular(12)),
                              child: ListTile(
                                leading: Image.asset('assets/images/pdf.png'),
                                title: Row(
                                  children: [
                                    Text("Fichier : "),
                                    Text(snapshot.data![index]['libelle']),
                                  ],
                                ),
                                subtitle:
                                    Text(snapshot.data![index]['cheminAccess']),
                                trailing: Row(
                                  mainAxisSize: MainAxisSize.min,
                                  children: <Widget>[
                                    IconButton(
                                      icon: Icon(Icons.more_vert),
                                      onPressed: () {
                                        // Votre code ici...
                                      },
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          );
                        },
                      ),
                    );
                  } else {
                    return _buildavailableData();
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<List<dynamic>> fetchDocuments() async {
    print("List of documents");

    String documentsUrl = DOCUMENTS_URL;
    try {
      final response = await Dio().get(documentsUrl);
      print(response.data);
      List<dynamic> results = response.data['resultat'];
      print("Get of documents success !");
      return results;
    } catch (e) {
      print("An error occurred: $e");
      throw Exception(
          'Une erreur s\'est produite lors de la récupération des documents.');
    }
  }

  Center _buildLoading() {
    return Center(
      child: SizedBox(
        height: 150,
        width: 150,
        child: Lottie.asset(
          'assets/animations/docloader.json',
        ),
      ),
    );
  }

  Center _buildavailableData() {
    return Center(
      child: SizedBox(
        height: 150,
        width: 150,
        child: Lottie.asset('assets/animations/no-internet.json'),
      ),
    );
  }
}
