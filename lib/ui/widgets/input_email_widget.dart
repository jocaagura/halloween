import 'package:flutter/material.dart';
import 'package:halloween/blocs/bloc_central.dart';
import 'package:halloween/helpers.dart';

class InputEmailWidget extends StatelessWidget {
  const InputEmailWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: Theme.of(context).backgroundColor,
          borderRadius: BorderRadius.circular(10.0)),
      child: StreamBuilder<String>(
          stream: blocCentral.sesion.sesionEmailStream,
          builder: (context, AsyncSnapshot<String> snapshot) {
            return TextField(
              keyboardType: TextInputType.emailAddress,
              decoration: InputDecoration(
                hintText: "email@pragma.com.co",
                labelText: "Email",
                errorText: validarEmail(snapshot.data ?? "")
                    ? null
                    : "Email no valido",
              ),
              onChanged: (value) {
                blocCentral.sesion.sesionEmail = value;
              },
            );
          }),
    );
  }
}
