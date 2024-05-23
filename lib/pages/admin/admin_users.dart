import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:web_app_tec/utils/screen_size.dart';
import 'package:web_app_tec/widgets/app_expansion_tile.dart';
import 'package:web_app_tec/widgets/custombuttom.dart';
import 'package:web_app_tec/widgets/popup_menu.dart';
import 'package:web_app_tec/widgets/search_bar.dart';
import 'package:web_app_tec/widgets/title_bar.dart';

class AdminUsersPage extends StatelessWidget {
  const AdminUsersPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ScreenSize.i.upadate(context);
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            TitleBar(
                menu: PopupMenu(),
                nombreUsuario: "nombreUsuario",
                puesto: "puesto"),
            Container(
              alignment: Alignment.center,
              width: ScreenSize.i.width - 10,
              height: 80,
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    Center(
                      child: Padding(
                        padding: const EdgeInsets.only(right: 8.0),
                        child: Text(
                          "USUARIOS",
                          style: TextStyle(
                            fontSize: ScreenSize.i.width < 600 ? 20 : 28,
                          ),
                        ),
                      ),
                    ),
                    CustomSearchBar(
                      action: () {},
                      width: ScreenSize.i.width < 600
                          ? ScreenSize.i.width * 0.4
                          : 300,
                      heigth: 50,
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 8),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: CustomButtom(
                        action: () {},
                        text: 'nuevo',
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: ScreenSize.i.heigth * 70,
              width: ScreenSize.i.heigth * 90,
              child: ExpansionPanelListRadioExample(),
            ),
          ],
        ),
      ),
    );
  }
}
