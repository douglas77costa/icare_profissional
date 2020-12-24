import 'package:flutter/material.dart';
import 'package:getwidget/components/appbar/gf_appbar.dart';
import 'package:getwidget/components/floating_widget/gf_floating_widget.dart';
import 'package:getwidget/getwidget.dart';
import 'package:line_icons/line_icons.dart';

class ServicesPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: GFAppBar(
        title: Text("Serviços"),
        elevation: 2,
        centerTitle: true,
        automaticallyImplyLeading: false,
      ),
      body: ListView.builder(
          itemCount: 10,
          itemBuilder: (context, index) {
            return Container(
                padding: EdgeInsets.only(left: 10, right: 10, top: 10),
                width: double.infinity,
                height: 150,
                child: GFCard(
                  margin: EdgeInsets.all(0),
                  content: Row(
                    children: [
                      GFAvatar(
                        backgroundImage: AssetImage('images/icon.png'),
                        radius: 50,
                      ),
                      Container(
                        margin: EdgeInsets.only(left: 20),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text("Nome do item"),
                            Text("R\$ 20"),
                            Text("Descrição")
                          ],
                        ),
                      )
                    ],
                  ),
                ));
          }),
      floatingActionButton: FloatingActionButton.extended(
          onPressed: null,
          label: Row(
            children: [
              Container(
                child: Icon(LineIcons.plus),
                margin: EdgeInsets.only(right: 10),
              ),
              Text("Adicionar")
            ],
          )),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
    );
  }
}
