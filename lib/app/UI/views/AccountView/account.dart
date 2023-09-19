import 'package:flutter/material.dart';
import 'package:mydocs/config/config.dart';

class AccountView extends StatefulWidget {
  const AccountView({super.key});

  @override
  State<AccountView> createState() => _AccountViewState();
}

class _AccountViewState extends State<AccountView> {
  Radius containerRaduis = const Radius.circular(30);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            width: double.infinity,
            color: Config.colors.appBarColor,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                SizedBox(
                  height: 50,
                ),
                Expanded(
                  child: Container(
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(40),
                            topRight: Radius.circular(40))),
                    child: SingleChildScrollView(
                      child: Column(
                        children: [
                          SizedBox(height: 80),
                          Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 20.0, vertical: 10),
                            child: Container(
                              height: 65,
                              decoration: BoxDecoration(
                                color: Colors.grey[200],
                                borderRadius: BorderRadius.circular(8),
                              ),
                              child: ListTile(
                                title: const Text(
                                  "Nom et Pénoms",
                                  style: TextStyle(color: Colors.grey),
                                ),
                                subtitle: Text("ADOGLI Caleb",
                                    style: TextStyle(color: Colors.black)),
                                leading: const Icon(Icons.person_outlined,
                                    color: Colors.black),
                                tileColor: Colors.white,
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 20.0, vertical: 10),
                            child: Container(
                              height: 65,
                              decoration: BoxDecoration(
                                color: Colors.grey[200],
                                borderRadius: BorderRadius.circular(8),
                              ),
                              child: ListTile(
                                title: const Text(
                                  "Filiere",
                                  style: TextStyle(color: Colors.grey),
                                ),
                                subtitle: Text("Tronc commun",
                                    style: TextStyle(color: Colors.black)),
                                leading: const Icon(Icons.school_outlined,
                                    color: Colors.black),
                                tileColor: Colors.white,
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 20.0, vertical: 10),
                            child: Container(
                              height: 65,
                              decoration: BoxDecoration(
                                color: Colors.grey[200],
                                borderRadius: BorderRadius.circular(8),
                              ),
                              child: ListTile(
                                title: const Text(
                                  "Niveau",
                                  style: TextStyle(color: Colors.grey),
                                ),
                                subtitle: Text("Licence 1",
                                    style: TextStyle(color: Colors.black)),
                                leading: const Icon(Icons.stacked_bar_chart,
                                    color: Colors.black),
                                tileColor: Colors.white,
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 20.0, vertical: 10),
                            child: Container(
                              height: 65,
                              decoration: BoxDecoration(
                                color: Colors.grey[200],
                                borderRadius: BorderRadius.circular(8),
                              ),
                              child: ListTile(
                                title: const Text(
                                  "Email",
                                  style: TextStyle(color: Colors.grey),
                                ),
                                subtitle: Text("calebadogli53@gmail.com",
                                    style: TextStyle(color: Colors.black)),
                                leading: const Icon(Icons.mail_outlined,
                                    color: Colors.black),
                                tileColor: Colors.white,
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 20.0, vertical: 10),
                            child: Container(
                              height: 65,
                              decoration: BoxDecoration(
                                color: Colors.grey[200],
                                borderRadius: BorderRadius.circular(8),
                              ),
                              child: ListTile(
                                title: const Text(
                                  "Mot de passe",
                                  style: TextStyle(color: Colors.grey),
                                ),
                                subtitle: Text("************",
                                    style: TextStyle(color: Colors.black)),
                                leading: const Icon(Icons.lock_outline,
                                    color: Colors.black),
                                tileColor: Colors.white,
                              ),
                            ),
                          ),
                          const SizedBox(height: 20),
                          Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 20.0),
                            child: Container(
                              // height: 70,
                              padding: const EdgeInsets.all(1),
                              decoration: BoxDecoration(
                                  color: Config.colors.validateButton,
                                  borderRadius: BorderRadius.circular(12)),
                              child: Center(
                                child: TextButton(
                                    onPressed: () {},
                                    child: const Text("Se déconnecter",
                                        style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 20,
                                          color: Colors.white,
                                        ))),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            child: CircleAvatar(
              backgroundColor: Config.colors.validateButton,
              radius: 60,
              child: Icon(
                Icons.person_outline,
                size: 60,
                color: Colors.white,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
