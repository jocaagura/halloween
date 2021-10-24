import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import '../../blocs/bloc_central.dart';
import '../../blocs/bloc_camera.dart';

class PreviewVideoPlayerWidget extends StatelessWidget {
  const PreviewVideoPlayerWidget({
    Key? key,
    required this.width,
    required this.height,
  }) : super(key: key);

  final double width;
  final double height;

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<XFile?>(
        stream: blocCentral.camera.xFileStream,
        builder: (context, snapshot) {
          if(snapshot.data == null){
            return const Center(child: CircularProgressIndicator(),);
          }
        return Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10.0),
              border:
              Border.all(color: blocCentral.theme.kColors.last)),
          width: width,
          height: height,
          child: const Text(
            "Reproducir",
            textAlign: TextAlign.center,
          ),
        );
      }
    );
  }
}
