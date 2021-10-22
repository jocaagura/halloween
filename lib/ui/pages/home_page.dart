import 'package:flutter/material.dart';
import 'package:halloween/blocs/bloc_central.dart';
import 'package:halloween/helpers.dart';

import '../widgets/input_email_widget.dart';
import '../widgets/responsive_widget.dart';

class MyHomePage extends StatelessWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const ResponsiveWidget(
        mobileWidget: _MobileVersion(), desktopWidget: _DesktopVersion());
  }
}

class _DesktopVersion extends StatelessWidget {
  const _DesktopVersion({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final double width = (size.width).clamp(400, 800);
    final double height = size.height * 0.5;
    final double sizeFont = (size.width * 0.035).clamp(8, 32);
    return Center(
      child: Container(
        alignment: Alignment.center,
        width: width,
        height: height,
        decoration: BoxDecoration(
            border: Border.all(
          color: Theme.of(context).canvasColor,
          width: 2.0,
        )),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  width: width * 0.49,
                  height: height * 0.9,
                  alignment: Alignment.center,
                  padding: EdgeInsets.all(sizeFont * 0.8),
                  child: Text(
                    "Debes verificar tu identidad para continuar",
                    style: TextStyle(
                      fontSize: sizeFont,
                      color: blocCentral.theme.kColors.last,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
                Container(
                    width: width * 0.49,
                    height: height * 0.9,
                    alignment: Alignment.center,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const InputEmailWidget(),
                        const SizedBox(
                          height: 10.0,
                        ),
                        StreamBuilder<String>(
                            stream: blocCentral.sesion.sesionEmailStream,
                            builder: (context, snapshot) {
                              String _email = snapshot.data ?? "";
                              return ElevatedButton(
                                  onPressed: validarEmail(_email)
                                      ? () {
                                          print(_email);
                                        }
                                      : null,
                                  child: const Text("Siguiente"));
                            })
                      ],
                    )),
              ],
            )
          ],
        ),
      ),
    );
  }
}

class _MobileVersion extends StatelessWidget {
  const _MobileVersion({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text("Movil"),
    );
  }
}
