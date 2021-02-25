import 'package:flutter/material.dart';
import 'package:getwidget/components/appbar/gf_appbar.dart';

class SearchPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: GFAppBar(
        title:  Text("Pesquisa"),
        elevation: 2,
        centerTitle: false,
        automaticallyImplyLeading: false,
      ),
    );
  }
}
