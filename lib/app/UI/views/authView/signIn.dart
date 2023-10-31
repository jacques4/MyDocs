import 'package:get/get.dart';
import 'package:mydocs/app/UI/views/authView/signUp.dart';
import 'package:mydocs/app/services/auth/signIn_service.dart';
import 'package:mydocs/config/config.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter/material.dart';
import 'package:mydocs/widgets/textfield.dart';

class SignIn extends StatefulWidget {
  const SignIn({super.key});

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController mdpController = TextEditingController();

  String email = "";
  String password = "";
  bool login = true;
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
    SignInService _signService = SignInService();
    return Scaffold(
      body: Container(
        color: Config.colors.appBarColor,
        width: double.infinity,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            SizedBox(
              height: 50,
            ),
            Padding(
              padding: EdgeInsets.all(5.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Align(
                      child: Image.asset("assets/images/logo.png",
                          height: 170, width: 170))
                ],
              ),
            ),
            SizedBox(height: 20),
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius:
                        BorderRadius.only(topLeft: Radius.circular(60))),
                child: SingleChildScrollView(
                    child: Center(
                  child: Column(
                    children: [
                      const SizedBox(height: 20),
                      Text(
                        "Connexion",
                        style: TextStyle(
                            fontSize: 25, fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(height: 10),
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
                          textEditingController: mdpController,
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
                            if (email != "" && password != "") {
                              _signService.loginUser(context,
                                  emailController.text, mdpController.text);
                            } else {
                              Get.snackbar(
                                "Erreur d'authentification",
                                "Vous devez fournir un email et un mot de passe",
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
                              "Se connecter",
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
                          Text("  Ou Connectez-vous avec  "),
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
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          GestureDetector(
                            onTap: () {
                              Get.to(SignUp());
                            },
                            child: Container(
                              margin: const EdgeInsets.only(top: 30),
                              child: const Text(
                                "Pas de compte ? Créez rapidement votre compte",
                                style: TextStyle(fontSize: 15),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                )),
              ),
            )
          ],
        ),
      ),
    );
  }
}
