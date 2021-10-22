import 'package:flutter/material.dart';

import '../../blocs/bloc_central.dart';

class InputEmailWidget extends StatelessWidget {
  const InputEmailWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
            color: blocCentral.theme.kColors.last,
            borderRadius: BorderRadius.circular(10.0)),
        child: TextField(
          keyboardType: TextInputType.emailAddress,
          decoration: const InputDecoration(
              contentPadding: EdgeInsets.symmetric(horizontal: 10.0),
              hintText: "email@pragma.com.co",
              errorText: null),
          onChanged: (value) {
            blocCentral.sesion.sesionEmail = value;
          },
        ));
  }
}
