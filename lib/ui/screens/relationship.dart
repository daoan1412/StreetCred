
import 'package:flutter/material.dart';
import 'package:flutter_app/core/enums/viewstate.dart';
import 'package:flutter_app/core/viewmodels/relationship_model.dart';
import 'package:flutter_app/ui/views/base_view.dart';
import 'package:flutter_icons/flutter_icons.dart';

class RelationshipScreen extends StatelessWidget {
  final String connectionId;

  RelationshipScreen({@required this.connectionId});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Relationship"),
        ),
        body: BaseView<RelationshipModel>(
            onModelReady: (model) => model.fetchRelationship(connectionId),
            builder: (context, model, child) {
              if (model.state == ViewState.Idle) {
                return Center(
                  child: Container(
                      margin:
                          EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                      child: Column(
                        children: <Widget>[
                          Text(
                            model.property.theirLabel,
                            style: TextStyle(fontSize: 18),
                          ),
                          Text("Their DID: ${model.property.theirDid}"),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              Text("Status"),
                              Text(model.property.state)
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
                              Text(model.property.connectionId)
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              Text("updated_at"),
                              Text(model.property.updatedAt.toIso8601String())
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              Text("created_at"),
                              Text(model.property.createdAt.toIso8601String())
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              Text("routing_state"),
                              Text(model.property.routingState)
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              Text("invitation_mode"),
                              Text(model.property.invitationMode)
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              Text("their_label"),
                              Text(model.property.theirLabel)
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              Text("accept"),
                              Text(model.property.accept)
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              Text("initiator"),
                              Text(model.property.initiator)
                            ],
                          ),
                          Wrap(
                            children: <Widget>[
                              Text("invitation_key"),
                              Text(model.property.invitationKey)
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              Text("their_did"),
                              Text(model.property.theirDid)
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              Text("my_did"),
                              Text(model.property.myDid)
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              Text("state"),
                              Text(model.property.state)
                            ],
                          )
                        ],
                      )),
                );
              } else if (model.state == ViewState.Fail) {
                return Text(model.errorMsg);
              }
              // By default, show a loading spinner.
              return CircularProgressIndicator();
            }));
  }
}
