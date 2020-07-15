import 'package:flutter_app/core/enums/viewstate.dart';
import 'package:flutter_app/core/models/RelationshipProperty.dart';
import 'package:flutter_app/core/services/api.dart';
import 'package:flutter_app/core/viewmodels/base_model.dart';

import '../../locator.dart';

class RelationshipModel extends BaseModel {
  final Api _api = locator.get<Api>();
  RelationshipProperty _property;
  RelationshipProperty get property => _property;
  String errorMsg = "";

  void fetchRelationship(String connectionId) async {
    setState(ViewState.Busy);
    try {
      _property = await _api.getAliceRelationship(connectionId);
      setState(ViewState.Idle);
    } catch(e) {
      errorMsg  = e;
      setState(ViewState.Fail);
    }
  }
}
