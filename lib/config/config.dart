import 'package:flutter/material.dart';
import 'package:top_snackbar_flutter/custom_snack_bar.dart';
import 'package:top_snackbar_flutter/top_snack_bar.dart';

class Config {
  static final colors = _Color();
}

class _Color {
  Color downloadButton = const Color(0xFF00C2FF);
  Color validateButton = Color.fromARGB(255, 2, 61, 79);
  Color previewButton = const Color(0xFFE5655D);
  Color dangerColor = Color.fromARGB(255, 240, 40, 26);
  Color whiteColor = const Color(0XFFFFFFFF);
  Color inputColor = const Color(0xFFEEEEEE);
  Color appBarColor = Color(0xFF1BA7D2);
}

showCustomSnackBar(BuildContext context, String msg) =>
    showTopSnackBar(Overlay.of(context), CustomSnackBar.error(message: msg));
