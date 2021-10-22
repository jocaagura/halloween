import 'package:flutter/material.dart';

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
    return Center(
      child: Container(
        alignment: Alignment.center,
        width: (size.width).clamp(400, 800),
        height: size.height * 0.5,
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
              children: [
                InputEmailWidget(),
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
