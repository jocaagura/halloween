import 'package:flutter/material.dart';

import '../entities.dart';

class BlocRouting extends Bloc {
  routeTo(BuildContext context, Widget widget) {
    Navigator.push(context, MaterialPageRoute(builder: (context) => widget));
  }
}
