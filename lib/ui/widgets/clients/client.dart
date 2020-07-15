import 'package:flutter/material.dart';

class Client extends StatelessWidget {
  final String clientName;

  final onTap;

  Client({Key key, @required this.clientName, @required this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Container(
        decoration: new BoxDecoration(
          color: Colors.blue,
          borderRadius: new BorderRadius.circular(100),
        ),
        child: Center(
          child: Text(
            clientName,
            style: TextStyle(
                color: Colors.white, fontWeight: FontWeight.w700, fontSize: 16),
          ),
        ),
        height: 100,
        width: 100,
      ),
      onTap: onTap,
    );
  }
}
