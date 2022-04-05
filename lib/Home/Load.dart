import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
class Load extends StatelessWidget {
  const Load({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Center(
        child: SpinKitFadingCircle(
          color: Colors.green,
          size: 90,
        ),
      ),
    );
  }
}
