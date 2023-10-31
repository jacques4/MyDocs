import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mydocs/app/UI/myfilesView/docs/docViewer.dart';
import 'package:mydocs/app/UI/myfilesView/images/imageViewer.dart';
import 'package:mydocs/app/UI/myfilesView/pdf/pdfViewer.dart';

class MyFiles extends StatelessWidget {
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
          child: ListView(
            children: [
              Center(
                child: Column(
                  children: [
                    Text(
                      " Mes fichiers",
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: 5),
                    Container(
                      height: 2,
                      width: 130,
                      color: Colors.red,
                    ),
                  ],
                ),
              ),
              SizedBox(height: 30),
              FolderItem(
                name: 'Documents',
                icon: Icons.folder,
                color: Colors.amber,
                findByIcon: Icons.description,
              ),
              SizedBox(height: 50),
              FolderItem(
                name: 'Images',
                icon: Icons.folder,
                color: Colors.amber,
                findByIcon: Icons.image,
              ),
              SizedBox(height: 50),
              FolderItem(
                name: 'PDFs',
                icon: Icons.folder,
                color: Colors.amber,
                findByIcon: Icons.picture_as_pdf,
              ),
            ],
          )),
    );
  }
}

class FolderItem extends StatelessWidget {
  final String name;
  final IconData icon;
  final Color color;
  final IconData? findByIcon;

  const FolderItem({
    required this.name,
    required this.icon,
    required this.color,
    this.findByIcon,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Stack(
        alignment: Alignment.center,
        children: [
          Icon(
            icon,
            color: color,
            size: 70,
          ),
          if (findByIcon != null && name == "PDFs")
            Padding(
              padding: const EdgeInsets.only(left: 30.0, top: 30),
              child: Icon(
                findByIcon,
                color: Colors.red,
                size: 30,
              ),
            ),
          if (findByIcon != null && name == "Images")
            Padding(
              padding: const EdgeInsets.only(left: 35.0, top: 30),
              child: Icon(
                findByIcon,
                color: Colors.blue,
                size: 30,
              ),
            ),
          if (findByIcon != null && name == "Documents")
            Padding(
              padding: const EdgeInsets.only(left: 35.0, top: 30),
              child: Icon(
                findByIcon,
                color: Colors.green,
                size: 30,
              ),
            ),
        ],
      ),
      title: Text(name),
      onTap: () {
        if (name == "PDFs") {
          print("PDFs");
          Get.to(PdfViewer());
        } else if (name == "Images") {
          print("Images");
          Get.to(imageViewer());
        } else if (name == "Documents") {
          print("Document");
          Get.to(docViewer());
        }
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Vous avez cliqué sur le dossier $name.'),
          ),
        );
      },
    );
  }
}
