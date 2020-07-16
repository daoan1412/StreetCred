import 'package:flutter/material.dart';


class NotificationBell extends StatelessWidget {
  final number;
  final Function callback;

  NotificationBell({@required this.number, @required this.callback});

  @override
  Widget build(BuildContext context) {
    return new Stack(
      children: <Widget>[
        new IconButton(
            icon: Icon(Icons.notifications),
            onPressed: () {
              callback();
            }),
        number != 0
            ? new Positioned(
                right: 11,
                top: 11,
                child: new Container(
                  padding: EdgeInsets.all(2),
                  decoration: new BoxDecoration(
                    color: Colors.red,
                    borderRadius: BorderRadius.circular(6),
                  ),
                  constraints: BoxConstraints(
                    minWidth: 14,
                    minHeight: 14,
                  ),
                  child: Text(
                    '$number',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 8,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
              )
            : new Container()
      ],
    );
  }
}
