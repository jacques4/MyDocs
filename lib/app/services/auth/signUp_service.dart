// ignore_for_file: avoid_print, use_build_context_synchronously, prefer_final_fields
import 'package:get/get.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:mydocs/app/UI/views/authView/signIn.dart';
import 'package:mydocs/models/etudiants.dart';
import 'package:mydocs/routes/api_url.dart';

class SignUpService {
  final dio = Dio();
  Future SignUpUser(BuildContext context, Etudiants etudiants) async {
    String SignUpUrl = ETUDIANTS_URL;
    try {
      final response = await dio.post(
        "$SignUpUrl",
        data: etudiants.toJson(),
        options: Options(
          headers: {'Content-Type': 'application/json', 'Charset': 'utf-8'},
          responseType: ResponseType.json,
        ),
      );
      // .timeout(const Duration(seconds: 3));

      var loginArr = response.data;
      print('User:${loginArr}');
      Get.off(() => SignIn());
      Get.snackbar(
        "Inscription réussie",
        "Vous avez été inscrit avec succès , connectez vous.",
        icon: Icon(
          color: Colors.green,
          Icons.check_circle,
        ),
      );
    } on DioError catch (e) {
      print("========================Erreur========================");
      if (e.response != null) {
        var errorResponse = e.response!.data;
        print(errorResponse);
        print('Erreur: ${errorResponse["error"]}');
        Get.snackbar(
          "Erreur lors de l'inscription",
          "Une erreur s'est produite lors de votre inscription.",
          icon: Icon(
            color: Colors.red,
            Icons.error,
          ),
        );
      } else {
        print("========================Erreur Serveur========================");
        print('Erreur: $e');
        Get.snackbar(
          "Erreur Serveur",
          "Impossible de se connecter au serveur. Veuillez réessayer plus tard.",
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
