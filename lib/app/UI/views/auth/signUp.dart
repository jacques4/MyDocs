import 'package:get/get.dart';
import 'package:mydocs/app/UI/views/auth/signIn.dart';
import 'package:mydocs/app/UI/views/homeView/home_view.dart';
import 'package:mydocs/config/config.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter/material.dart';
import 'package:mydocs/widgets/drawerView.dart';
import 'package:mydocs/widgets/textfield.dart';

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  final TextEditingController nomPrenomController = TextEditingController();
  final TextEditingController filiereController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  final List<String> _filiere = ["TC1", "TC2", "ASR", "GLSI"];
  String? _selectedValue;

  bool SeePass = true;
  String nomPrenom = "";
  String email = "";
  String password = "";
  bool login = true;

  void getNomPrenom(String value) {
    setState(() {
      nomPrenom = value;
    });
  }

  void getEmail(String value) {
    setState(() {
      email = value;
    });
  }

  void getPassword(String value) {
    setState(() {
      password = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Config.colors.appBarColor,
        width: double.infinity,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            SizedBox(
              height: 40,
            ),
            Padding(
              padding: const EdgeInsets.all(4.0),
              child: IconButton(
                icon: Icon(
                  Icons.arrow_back,
                  color: Colors.white,
                  size: 35,
                ),
                onPressed: () {
                  Get.to(SignIn());
                },
              ),
            ),
            Padding(
              padding: EdgeInsets.all(10.0),
              child: Center(
                  child: Text(
                "Inscription",
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 30,
                    color: Colors.white),
              )),
            ),
            SizedBox(height: 20),
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius:
                        BorderRadius.only(topLeft: Radius.circular(60))),
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      const SizedBox(height: 50),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 25.0),
                        child: MyInput(
                          icon: Icons.person_outlined,
                          keyboardType: TextInputType.text,
                          textEditingController: nomPrenomController,
                          isGood: login,
                          errorMessage: "Nom et Prénom(s) invalide",
                          placeholder: "Nom et Prénom(s)",
                          onchange: getNomPrenom,
                          enable: true,
                        ),
                      ),
                      const SizedBox(height: 20),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 25.0),
                        child: Container(
                          height: 50,
                          decoration: BoxDecoration(
                              color: Colors.grey[200],
                              border: Border.all(color: Colors.white),
                              borderRadius: BorderRadius.circular(12)),
                          child: Padding(
                            padding: const EdgeInsets.only(left: 15.0),
                            child: DropdownButtonFormField<String>(
                              value: _selectedValue,
                              onChanged: (newValue) {
                                setState(() {
                                  _selectedValue = newValue
                                      .toString(); // Mettre à jour la valeur sélectionnée
                                  print(_selectedValue);
                                });
                              },
                              items: _filiere
                                  .map((e) => DropdownMenuItem(
                                        child: Text(e,
                                            style:
                                                const TextStyle(fontSize: 13)),
                                        value: e,
                                      ))
                                  .toList(),
                              icon: Icon(
                                Icons.arrow_drop_down_circle,
                                color: Config.colors.validateButton,
                              ),
                              dropdownColor: Colors.white,
                              decoration: const InputDecoration(
                                  icon: Icon(
                                    Icons.school_outlined,
                                    color: Colors.black,
                                  ),
                                  hintText: "Votre filière",
                                  labelStyle: TextStyle(color: Colors.black),
                                  focusedBorder: UnderlineInputBorder(
                                      borderSide:
                                          BorderSide(color: Colors.white))),
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 25.0),
                        child: MyInput(
                          icon: Icons.email_outlined,
                          keyboardType: TextInputType.emailAddress,
                          textEditingController: emailController,
                          isGood: login,
                          errorMessage: "Email invalide",
                          placeholder: "Email",
                          onchange: getEmail,
                          enable: true,
                        ),
                      ),
                      const SizedBox(height: 12),
                      // password textfield
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 25.0),
                        child: MyInput(
                          icon: Icons.lock_outline,
                          keyboardType: TextInputType.text,
                          textEditingController: passwordController,
                          isGood: login,
                          errorMessage: "Mot de passe invalide",
                          placeholder: "Mot de passe",
                          onchange: getPassword,
                          enable: true,
                        ),
                      ),
                      const SizedBox(height: 30),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 25.0),
                        child: TextButton(
                          onPressed: () {
                            if (email != "" &&
                                password != "" &&
                                nomPrenom != "") {
                              Get.off(() => DrawerView(title: "My Docs"));
                            } else {
                              Get.snackbar(
                                "Erreur de création de compte",
                                "Vous devez fournir un nom , un email et un mot de passe",
                                icon: Icon(
                                  color: Colors.red,
                                  Icons.error,
                                ),
                              );
                            }
                          },
                          style: TextButton.styleFrom(
                              backgroundColor: Config.colors.validateButton,
                              foregroundColor: Colors.white,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(
                                    12.0), // Ajustez la valeur du rayon ici
                              ),
                              padding: EdgeInsets.symmetric(vertical: 12.0)),
                          child: const SizedBox(
                            width: double.infinity,
                            child: Text(
                              "S'inscrire",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 20,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: 30),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            height: 2,
                            width: 50,
                            color: Colors.black,
                          ),
                          Text("  Ou S'inscrire avec  "),
                          Container(
                            height: 2,
                            width: 50,
                            color: Colors.black,
                          )
                        ],
                      ),
                      const SizedBox(height: 30),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Container(
                            height: 45,
                            width: 100,
                            decoration: BoxDecoration(
                                color: Config.colors.inputColor,
                                borderRadius: BorderRadius.circular(10)),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Image.asset(
                                  "assets/images/google_outline.png",
                                  height: 25,
                                  width: 25,
                                ),
                                Text("Google",
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold))
                              ],
                            ),
                          ),
                          Container(
                            height: 45,
                            width: 100,
                            decoration: BoxDecoration(
                                color: Config.colors.inputColor,
                                borderRadius: BorderRadius.circular(10)),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                SvgPicture.asset(
                                  'assets/svg/github.svg',
                                  height: 25,
                                  width: 25,
                                ),
                                Text(
                                  "Github",
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                )
                              ],
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
