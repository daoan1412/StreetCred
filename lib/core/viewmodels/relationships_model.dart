

import 'package:flutter_app/core/enums/viewstate.dart';
import 'package:flutter_app/core/viewmodels/base_model.dart';
import 'package:flutter_app/locator.dart';
import 'package:flutter_app/core/models/RelationshipItem.dart';
import 'package:flutter_app/core/services/api.dart';

class RelationshipsModel extends BaseModel {
  final Api _api = locator.get<Api>();

  List<RelationshipItem> _items = [];
  List<RelationshipItem> get items => _items;

  String errorMsg = "";

  void fetchRelationships() async {
    setState(ViewState.Busy);
    try {
      _items = await _api.getAliceRelationships();
      setState(ViewState.Idle);
    } catch (e) {
      errorMsg = e.toString();
      setState(ViewState.Fail);
    }
  }

}