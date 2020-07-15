import 'dart:convert';

List<RelationshipItem> relationshipItemFromMap(String str) => List<RelationshipItem>.from(json.decode(str).map((x) => RelationshipItem.fromMap(x)));

String relationshipItemToMap(List<RelationshipItem> data) => json.encode(List<dynamic>.from(data.map((x) => x.toMap())));

class RelationshipItem {
  RelationshipItem({
    this.id,
    this.state,
    this.created,
    this.did,
    this.initiator,
    this.name,
  });

  final String id;
  final String state;
  final DateTime created;
  final String did;
  final String initiator;
  final String name;

  factory RelationshipItem.fromMap(Map<String, dynamic> json) => RelationshipItem(
    id: json["_id"],
    state: json["state"],
    created: DateTime.parse(json["created"]),
    did: json["did"],
    initiator: json["initiator"],
    name: json["name"],
  );

  Map<String, dynamic> toMap() => {
    "_id": id,
    "state": state,
    "created": created.toIso8601String(),
    "did": did,
    "initiator": initiator,
    "name": name,
  };
}
