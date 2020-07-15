import 'package:flutter/cupertino.dart';

class RelationshipProperty {
  final String connectionId;
  final DateTime updatedAt;
  final DateTime createdAt;
  final String routingState;
  final String invitationMode;
  final String theirLabel;
  final String accept;
  final String initiator;
  final String invitationKey;
  final String theirDid;
  final String myDid;
  final String state;

  RelationshipProperty({
    this.connectionId,
    this.updatedAt,
    this.createdAt,
    this.routingState,
    this.invitationMode,
    this.theirLabel,
    this.accept,
    this.initiator,
    this.invitationKey,
    this.theirDid,
    this.myDid,
    this.state});

  factory RelationshipProperty.fromJson(Map<String, dynamic> json) {
    final relationship = json["relationship"];
    return RelationshipProperty(connectionId: relationship["connection_id"],
        updatedAt: DateTime.parse(relationship["updated_at"]),
        createdAt: DateTime.parse(relationship["created_at"]),
        routingState: relationship["routing_state"],
        invitationMode: relationship["invitation_mode"],
        theirLabel: relationship["their_label"],
        accept: relationship["accept"],
        initiator: relationship["initiator"],
        invitationKey: relationship["invitation_key"],
        theirDid: relationship["their_did"],
        myDid: relationship["my_did"],
        state: relationship["state"]);
  }

}
