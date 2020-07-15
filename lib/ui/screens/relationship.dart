import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/core/models/RelationshipProperty.dart';
import 'package:flutter_app/core/viewmodels/relationship_model.dart';
import 'package:flutter_app/ui/views/base_view.dart';
import 'package:flutter_icons/flutter_icons.dart';

class RelationshipScreen extends StatefulWidget {

  final String connectionId;
  RelationshipScreen({@required this.connectionId});

  @override
  State<StatefulWidget> createState() {
    return _RelationshipScreenState();
  }
}

class RelationshipScreen2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    throw UnimplementedError();
  }
}

class _RelationshipScreenState extends State<RelationshipScreen> {
  Future<RelationshipProperty> property;

  @override
  void initState() {
    super.initState();
    property = fetchRelationship(widget.connectionId);
  }

  Future<RelationshipProperty> fetchRelationship(String connectionId) async {
    final response = await Dio()
        .get('http://192.168.1.78:3001/relationships/$connectionId/raw');
    if (response.statusCode == 200) {
      return RelationshipProperty.fromJson(jsonDecode(response.toString()));
    } else {
      throw Exception("failed to load relationship");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Relationship"),
        ),
        body: BaseView<RelationshipModel>(
            onModelReady: (model) => model.fetchRelationship(widget.connectionId),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return Center(
                  child: Container(
                      margin:
                          EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                      child: Column(
                        children: <Widget>[
                          Text(
                            snapshot.data.theirLabel,
                            style: TextStyle(fontSize: 18),
                          ),
                          Text("Their DID: ${snapshot.data.theirDid}"),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              Text("Status"),
                              Text(snapshot.data.state)
                            ],
                          ),
                          Row(
                            children: <Widget>[
                              Icon(MaterialCommunityIcons.alert),
                              Text("Action required")
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              Text("Credentials In Progress"),
                              Text("1")
                            ],
                          ),
                          Row(
                            children: <Widget>[
                              Icon(Icons.person),
                              Text("Values")
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              Text("connection_id"),
                              Text(snapshot.data.connectionId)
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              Text("updated_at"),
                              Text(snapshot.data.updatedAt.toIso8601String())
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              Text("created_at"),
                              Text(snapshot.data.createdAt.toIso8601String())
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              Text("routing_state"),
                              Text(snapshot.data.routingState)
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              Text("invitation_mode"),
                              Text(snapshot.data.invitationMode)
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              Text("their_label"),
                              Text(snapshot.data.theirLabel)
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              Text("accept"),
                              Text(snapshot.data.accept)
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              Text("initiator"),
                              Text(snapshot.data.initiator)
                            ],
                          ),
                          Wrap(
                            children: <Widget>[
                              Text("invitation_key"),
                              Text(snapshot.data.invitationKey)
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              Text("their_did"),
                              Text(snapshot.data.theirDid)
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              Text("my_did"),
                              Text(snapshot.data.myDid)
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              Text("state"),
                              Text(snapshot.data.state)
                            ],
                          )
                        ],
                      )),
                );
              } else if (snapshot.hasError) {
                return Text("${snapshot.error}");
              }
              // By default, show a loading spinner.
              return CircularProgressIndicator();
            }));
  }
}
