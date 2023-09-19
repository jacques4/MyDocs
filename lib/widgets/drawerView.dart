import 'package:flutter/material.dart';
import 'package:mydocs/app/UI/myfilesView/myFiles.dart';
import 'package:mydocs/app/UI/shared/my_drawer/my_drawer_header.dart';
import 'package:mydocs/app/UI/views/AccountView/account.dart';
import 'package:mydocs/app/UI/views/feedbackView/feedbackView.dart';
import 'package:mydocs/app/UI/views/homeView/home_view.dart';
import 'package:mydocs/app/UI/views/manageFile/manageFile.dart';
import 'package:mydocs/app/UI/views/privacyView/privacy.dart';
import 'package:mydocs/app/UI/views/settingsView/Settings.dart';
import 'package:mydocs/config/config.dart';

class DrawerView extends StatefulWidget {
  const DrawerView({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<DrawerView> createState() => _DrawerViewState();
}

class _DrawerViewState extends State<DrawerView> {
  DrawerSection currentPage = DrawerSection.home;
  Radius containerRaduis = const Radius.circular(30);
  @override
  Widget build(BuildContext context) {
    Widget? container;
    if (currentPage == DrawerSection.home) {
      container = HomeView();
    } else if (currentPage == DrawerSection.manageFile) {
      container = ManageFile();
    } else if (currentPage == DrawerSection.account) {
      container = const AccountView();
    } else if (currentPage == DrawerSection.folder) {
      container = const MyFiles();
    } else if (currentPage == DrawerSection.privacy_policy) {
      container = PrivacyPolicyPage();
    } else if (currentPage == DrawerSection.send_feedback) {
      container = const FeedbackView();
    } else if (currentPage == DrawerSection.settings) {
      container = const Settings();
    }

    return Scaffold(
      backgroundColor: Config.colors.appBarColor,
      appBar: AppBar(
        title: Text(
          widget.title,
          style: const TextStyle(
            color: Colors.black,
          ),
        ),
        elevation: 0,
        backgroundColor: Config.colors.appBarColor,
        actions: [
          IconButton(
            icon: Icon(Icons.toggle_off),
            onPressed: (() {}),
          ),
          /*IconButton(
            icon: Icon(Icons.account_circle),
            onPressed: (() {
              Get.to(AccountView());
            }),
          ),*/
        ],
      ),
      body: container,
      drawer: Drawer(
        child: SingleChildScrollView(
          child: Column(
            children: [
              const MyHeaderDrawer(),
              DrawerList(),
            ],
          ),
        ),
      ),
    );
  }

  Widget menuItem(int id, String title, IconData icon, bool selected) {
    return Material(
      color: selected ? Colors.grey[300] : Colors.transparent,
      child: InkWell(
        onTap: () {
          Navigator.pop(context);
          setState(() {
            if (id == 1) {
              currentPage = DrawerSection.home;
            } else if (id == 2) {
              currentPage = DrawerSection.manageFile;
            } else if (id == 3) {
              currentPage = DrawerSection.account;
            } else if (id == 4) {
              currentPage = DrawerSection.folder;
            } else if (id == 5) {
              currentPage = DrawerSection.settings;
            } else if (id == 6) {
              currentPage = DrawerSection.send_feedback;
            } else if (id == 7) {
              currentPage = DrawerSection.privacy_policy;
            }
          });
        },
        child: Padding(
          padding: EdgeInsets.all(15.0),
          child: Row(
            children: [
              Expanded(
                child: Icon(
                  icon,
                  size: 20,
                  color: Colors.black,
                ),
              ),
              Expanded(
                flex: 3,
                child: Text(
                  title,
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 16,
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget DrawerList() {
    return Container(
      padding: EdgeInsets.only(
        top: 15,
      ),
      child: Column(
        children: [
          menuItem(1, 'Accueil', Icons.home,
              currentPage == DrawerSection.home ? true : false),
          menuItem(2, 'Ajouter un fichier', Icons.file_present_sharp,
              currentPage == DrawerSection.manageFile ? true : false),
          Divider(),
          menuItem(3, 'Mon compte', Icons.account_box_rounded,
              currentPage == DrawerSection.account ? true : false),
          menuItem(4, 'Mes fichiers', Icons.folder,
              currentPage == DrawerSection.folder ? true : false),
          Divider(),
          menuItem(5, 'Parametre', Icons.settings,
              currentPage == DrawerSection.settings ? true : false),
          menuItem(6, 'Retours', Icons.feedback,
              currentPage == DrawerSection.send_feedback ? true : false),
          menuItem(7, 'conditions utilisation', Icons.privacy_tip_rounded,
              currentPage == DrawerSection.privacy_policy ? true : false)
        ],
      ),
    );
  }
}

enum DrawerSection {
  home,
  manageFile,
  account,
  privacy_policy,
  send_feedback,
  settings,
  folder
}
