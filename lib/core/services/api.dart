import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter_app/core/models/ClientProfile.dart';
import 'package:flutter_app/core/models/RelationshipItem.dart';
import 'package:flutter_app/core/models/RelationshipProperty.dart';

class Api {
  static const String alice_endpoint = "http://192.168.1.78:3000";
  final Dio client = Dio();

  Future<String> get(String path) async {
    final response = await client.get(
      alice_endpoint + "/" + path,
      options: Options(
        responseType: ResponseType.plain,
      ),
    );
    if (response.statusCode == 200) {
      return response.data;
    } else {
      throw Exception("failed to load");
    }
  }

  //
  // Start:  Alice client
  //
  Future<ClientProfile> getAliceProfile() async {
    var response = await client.get(
      '$alice_endpoint/profile',
      options: Options(
        responseType: ResponseType.plain,
      ),
    );

    return ClientProfile.fromJson(jsonDecode(response.data));
  }

  Future<List<RelationshipItem>> getAliceRelationships() async {
    List<RelationshipItem> _items = [];
    final response1 = await client.get(
      "$alice_endpoint/relationships?state=response",
      options: Options(
        responseType: ResponseType.plain,
      ),
    );
    _items.addAll(relationshipItemFromMap(response1.data));
    final response2 = await client.get(
      "$alice_endpoint/relationships?state=active",
      options: Options(
        responseType: ResponseType.plain,
      ),
    );
    _items.addAll(relationshipItemFromMap(response2.data));
    return _items;
  }

  Future<RelationshipProperty> getAliceRelationship(String connectionId) async {
    var response = await client.get(
      '$alice_endpoint/relationships/$connectionId/raw',
      options: Options(
        responseType: ResponseType.plain,
      ),
    );
    return RelationshipProperty.fromJson(jsonDecode(response.data));
  }

  Future<List<RelationshipItem>> getInvites() async {
    List<RelationshipItem> _items = [];
    final response1 = await client.get(
      "$alice_endpoint/relationships?state=response",
      options: Options(
        responseType: ResponseType.plain,
      ),
    );
    _items.addAll(relationshipItemFromMap(response1.data));
    return _items;
  }

  Future<void> acceptInvite(String connectionId) async {
    await client.post("$alice_endpoint/relationships/$connectionId");
  }

  Future<void> declineInvite(String connectionId) async {
    await client.delete("$alice_endpoint/relationships/$connectionId");
  }

//
// End: Alice Client
//
}
