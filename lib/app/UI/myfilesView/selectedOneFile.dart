// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';

class SelectedOneFile extends StatefulWidget {
  String fileName;
  SelectedOneFile({super.key, required this.fileName});

  @override
  State<SelectedOneFile> createState() => _SelectedOneFileState();
}

class _SelectedOneFileState extends State<SelectedOneFile> {
  String get fileName => widget.fileName;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text('Fichier: $fileName'),
      ),
    );
  }
}
