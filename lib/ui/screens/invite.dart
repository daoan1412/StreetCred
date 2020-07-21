import 'package:flutter/material.dart';
import 'package:flutter_app/core/enums/viewstate.dart';
import 'package:flutter_app/core/viewmodels/relationship_model.dart';
import 'package:flutter_app/ui/views/base_view.dart';

class InviteScreen extends StatelessWidget {
  final String connectionId;

  InviteScreen({@required this.connectionId});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Approve Relationship"),
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
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: <Widget>[
                              FlatButton(
                                color: Colors.green,
                                textColor: Colors.white,
                                disabledColor: Colors.grey,
                                disabledTextColor: Colors.black,
                                padding: EdgeInsets.all(8.0),
                                onPressed: () async {
                                  await model.acceptInvite();
                                  Navigator.pop(context, model.property.connectionId);
                                },
                                child: Text(
                                  "Accept",
                                  style: TextStyle(fontSize: 20.0),
                                ),
                              ),
                              FlatButton(
                                color: Colors.red,
                                textColor: Colors.white,
                                disabledColor: Colors.grey,
                                disabledTextColor: Colors.black,
                                padding: EdgeInsets.all(8.0),
                                onPressed: () async {
                                  await model.declineInvite();
                                  Navigator.pop(context, model.property.connectionId);
                                },
                                child: Text(
                                  "Decline",
                                  style: TextStyle(fontSize: 20.0),
                                ),
                              )
                            ],
                          ),
                          Text(
                            model.property.theirLabel,
                            style: TextStyle(fontSize: 18),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              Text("Invitiation Sent"),
                              Text("${model.property.createdAt}")
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              Text("Status"),
                              Text(model.property.state)
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
