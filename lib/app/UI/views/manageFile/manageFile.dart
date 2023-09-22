import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:mydocs/config/config.dart';

class ManageFile extends StatefulWidget {
  ManageFile({Key? key}) : super(key: key);

  @override
  State<ManageFile> createState() => _ManageFileState();
}

class _ManageFileState extends State<ManageFile> {
  String? fileName;
  bool isFileSelected = false;

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
          top: 0,
        ),
        child: Container(
          child: Center(
              child: SingleChildScrollView(
            child: Column(
              children: [
                Text(
                  "Adding a file",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 5),
                Container(
                  height: 2,
                  width: 130,
                  color: Colors.red,
                ),
                SizedBox(height: 30),
                Container(
                  padding: EdgeInsets.only(left: 5),
                  color: Config.colors.inputColor,
                  height: 200,
                  width: 250,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Center(
                        child: isFileSelected
                            ? Image.asset('assets/images/pdf.png', width: 100)
                            : Icon(Icons.attach_file, size: 100),
                      ),
                      TextButton(
                        onPressed: () async {
                          FilePickerResult? result =
                              await FilePicker.platform.pickFiles(
                            type: FileType.custom,
                            allowedExtensions: ['pdf'],
                          );
                          if (result != null) {
                            PlatformFile file = result.files.first;

                            setState(() {
                              fileName = file.name;
                              isFileSelected = true;
                            });

                            print(file.name);
                            print(file.bytes);
                            print(file.size);
                            print(file.extension);
                            print(file.path);
                          } else {
                            // User canceled the picker
                          }
                        },
                        child: Text("Attach a file",
                            style:
                                TextStyle(fontSize: 30, color: Colors.black)),
                      ),
                      if (fileName != null)
                        Expanded(
                          child: Text(
                            '$fileName',
                            style: TextStyle(fontSize: 16),
                          ),
                        ),
                    ],
                  ),
                ),
                SizedBox(height: 20),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextField(
                    // controller: instructionController,
                    decoration: InputDecoration(
                        enabledBorder: const OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.white)),
                        focusedBorder: OutlineInputBorder(
                            borderSide:
                                BorderSide(color: Config.colors.inputColor)),
                        fillColor: Config.colors.inputColor,
                        filled: true,
                        hintText: "Add a Description",
                        hintStyle: TextStyle(fontSize: 20)),
                    maxLines: null,
                    minLines: 7,
                  ),
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(width: 25),
                    Text(
                      "*",
                      style: TextStyle(color: Colors.red, fontSize: 30),
                    ),
                    SizedBox(width: 8),
                    Expanded(
                      child: Text(
                          "Adding a description will help people\nunderstand your file",
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 15)),
                    ),
                  ],
                ),
                SizedBox(height: 40),
                ElevatedButton(
                  onPressed: () {},
                  child: const Text("Add A File",
                      style: TextStyle(color: Colors.white, fontSize: 22)),
                  style: ElevatedButton.styleFrom(
                    padding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                    minimumSize: Size(120, 36),
                    backgroundColor: Config.colors.appBarColor,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(25.0),
                    ),
                  ),
                ),
              ],
            ),
          )),
        ),
      ),
    );
  }
}
