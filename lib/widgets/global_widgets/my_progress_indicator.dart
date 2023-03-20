import 'package:flutter/material.dart';

class MyProgressIndicator extends StatelessWidget {
  final double? size;
  final Color? color;
  const MyProgressIndicator({Key? key, this.size, this.color})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: size,
      width: size,
      child: CircularProgressIndicator(
        color: color,
      ),
    );
  }
}
