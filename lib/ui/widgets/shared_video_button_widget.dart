import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import '../../blocs/bloc_central.dart';

class SharedVideoButtonWidget extends StatelessWidget {
  const SharedVideoButtonWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    final double sizeFont2 = (size.width * 0.012).clamp(8, 12);
    final TextStyle style =
    TextStyle(fontSize: sizeFont2, color: blocCentral.theme.kColors.last);
    return Container(
      decoration: BoxDecoration(
          color: blocCentral.theme.kColors[0],
          borderRadius: BorderRadius.circular(5.0)),
      child: StreamBuilder<XFile?>(
          stream: blocCentral.camera.xFileStream,
          builder: (context, snapshot) {
            return ElevatedButton(
                onPressed: () {
                  debugPrint('Compartir');
                  debugPrint(snapshot.data.toString());
                },
                child: Text(
                  "Compartir",
                  style: style,
                ));
          }),
    );
  }
}
