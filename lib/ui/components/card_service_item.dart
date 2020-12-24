import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:getwidget/components/avatar/gf_avatar.dart';
import 'package:getwidget/components/card/gf_card.dart';

import '../colors.dart';

class CardServiceItem extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.only(left: 10, right: 10, top: 0),
        width: double.infinity,
        height: 150,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Divider(),
            Container(
              padding: EdgeInsets.only(left: 10),
              margin: EdgeInsets.only(top: 10),
              child: Row(
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
                        Container(
                          child: Text(
                            "Corte de Cabelo Masculino",
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 20,
                                color: ColorsApp.acentLight),
                          ),
                          margin: EdgeInsets.only(bottom: 10),
                        ),
                        Container(
                          child: RichText(
                            text: TextSpan(
                              text: 'Preço: ',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 16),
                              children: <TextSpan>[
                                TextSpan(
                                    text: 'R\$ 20',
                                    style:
                                    TextStyle(fontWeight: FontWeight.normal)),
                              ],
                            ),
                          ),
                          margin: EdgeInsets.only(bottom: 10),
                        ),
                        Container(
                          child: RichText(
                            text: TextSpan(
                              text: 'Duração: ',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 16),
                              children: <TextSpan>[
                                TextSpan(
                                    text: '1h',
                                    style:
                                    TextStyle(fontWeight: FontWeight.normal)),
                              ],
                            ),
                          ),
                          margin: EdgeInsets.only(bottom: 10),
                        ),
                        Container(
                          child: RichText(
                            text: TextSpan(
                              text: 'Locais: ',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 16),
                              children: <TextSpan>[
                                TextSpan(
                                    text: 'Presencial ou Delivery',
                                    style:
                                    TextStyle(fontWeight: FontWeight.normal)),
                              ],
                            ),
                          ),
                          margin: EdgeInsets.only(bottom: 10),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(bottom: 70, left: 35),
                    child: PopupMenuButton<Acao>(
                      onSelected: (Acao result) {},
                      itemBuilder: (BuildContext context) => <PopupMenuEntry<Acao>>[
                        const PopupMenuItem<Acao>(
                          value: Acao.editar,
                          child: Text('Editar'),
                        ),
                        const PopupMenuItem<Acao>(
                          value: Acao.excluir,
                          child: Text('Excluir'),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ],
        ));
  }
}

enum Acao { editar, excluir }