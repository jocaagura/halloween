import 'package:flutter/material.dart';
import 'package:halloween/models/model_storage.dart';
import 'package:url_launcher/url_launcher.dart';

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
      child: StreamBuilder<ModelStorage?>(
          stream: blocCentral.video.videoStream,
          builder: (context, snapshot) {
            final url = snapshot.data?.url;
            return ElevatedButton(
                onPressed: url == null
                    ? null
                    : () async {
                        //final urlString =
                         //   """https://pragma.workplace.com/sharer.php?u=$url&group=somospragma&text=¡Para divertirse hay que aprender a reírse de uno mismo! Les comparto mi cara de sorpresa para que gocemos un rato juntos, si les dio tanta risa como a mí, déjenme un like en este post y ayúdenme a demostrar que #MiSustoValeLaPena.
//Revisa los mensajes en tu correo de Pragma para participar en el concurso individual de Halloween. No apto para personas nerviosas, con problemas del corazón o que no le gusten las emociones fuertes.
//$url""";
                final urlString = url;
                        canLaunch(urlString).then((value) {
                          if (value == true) {
                            launch(urlString);
                          }
                        });
                      },
                child: Text(
                  "Descargar",
                  style: style,
                ));
          }),
    );
  }
}
