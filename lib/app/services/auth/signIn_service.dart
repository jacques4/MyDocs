// ignore_for_file: avoid_print, use_build_context_synchronously, prefer_final_fields
import 'package:get/get.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:mydocs/routes/api_url.dart';
import 'package:mydocs/widgets/drawerView.dart';

class SignInService {
  final dio = Dio();
  Future loginUser(
      BuildContext context, String username, String password) async {
    String LoginUrl = SIGNIN_URL;
    try {
      final response = await dio.post(
        "$LoginUrl",
        data: {"email": username, "password": password},
        options: Options(
          headers: {'Content-Type': 'application/json', 'Charset': 'utf-8'},
          responseType: ResponseType.json,
        ),
      );
      // .timeout(const Duration(seconds: 3));

      var loginArr = response.data;
      print('User:${loginArr}');
      Get.off(() => DrawerView(title: "My Docs"));
      Get.snackbar(
        "Succès de l'authentification",
        "Adresse e-mail et mot de passe valides fournis.",
        icon: Icon(
          color: Colors.green,
          Icons.check_circle,
        ),
      );
      // Le reste de votre code...
    } on DioError catch (e) {
      print("========================Input Erreur========================");
      if (e.response != null) {
        var errorResponse = e.response!.data;
        print('Error: ${errorResponse["error"]}');
        // Afficher le Snackbar avec l'erreur ici...
        Get.snackbar(
          "Informations incorrectes",
          "Email et mot de passe invalides",
          icon: Icon(
            color: Colors.red,
            Icons.error,
          ),
        );
      } else {
        // Erreur lors de la connexion au serveur
        print("========================Server Erreur========================");
        print('Error: $e');
        // Afficher le Snackbar avec l'erreur ici...
        Get.snackbar(
          "Erreur serveur",
          "Connexion au serveur impossible",
          icon: Icon(
            color: Colors.red,
            Icons.error,
          ),
        );
      }
    }
  }
}

class InMemoryStorage {
  static Map<String, dynamic> _data = {};

  static void setData(String key, dynamic value) {
    _data[key] = value;
  }

  static dynamic getData(String key) {
    return _data[key];
  }

  static void removeData(String key) {
    _data.remove(key);
  }
}
