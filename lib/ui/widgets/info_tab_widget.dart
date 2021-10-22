import 'package:flutter/material.dart';
class InfoTabWidget extends StatelessWidget {
  const InfoTabWidget({
    Key? key,
    required this.style,
    required this.text,
  }) : super(key: key);

  final TextStyle style;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: style,
      textAlign: TextAlign.center,
    );
  }
}