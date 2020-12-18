
import 'package:flutter/material.dart';
import 'package:getwidget/getwidget.dart';

class ButtonRounded extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GFButton(
      onPressed: (){},
      text: "primary",
      shape: GFButtonShape.pills,
      type: GFButtonType.outline,
    );
  }
}
