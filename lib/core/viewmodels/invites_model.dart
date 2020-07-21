import 'package:flutter_app/core/enums/viewstate.dart';
import 'package:flutter_app/core/models/RelationshipItem.dart';
import 'package:flutter_app/core/services/api.dart';
import 'package:flutter_app/core/viewmodels/base_model.dart';

import '../../locator.dart';

class InvitesModel extends BaseModel {
  Api _api = locator<Api>();
  List<RelationshipItem> _invites = [];

  List<RelationshipItem> get invites => _invites;
  String errorMsg = "";

  void fetchInvites() async {
    setState(ViewState.Busy);
    try {
      _invites.clear();
      _invites.addAll(await _api.getInvites());
      setState(ViewState.Idle);
    } catch (e) {
      errorMsg = e;
      setState(ViewState.Fail);
    }
  }

  void removeConnection(String connectionId) {
    _invites.removeWhere((element) => element.id == connectionId);
  }

  void refresh() {
    notifyListeners();
  }

  Future<void> acceptInvite(int index) async {
    setState(ViewState.Busy);
    try {
      await _api.acceptInvite(_invites[index].id);
      _invites.removeAt(index);
      setState(ViewState.Idle);
    } catch (e) {
      errorMsg = e;
      setState(ViewState.Fail);
    }
  }

  Future<void> declineInvite(int index) async {
    setState(ViewState.Busy);
    try {
      await _api.declineInvite(_invites[index].id);
      _invites.removeAt(index);
      setState(ViewState.Idle);
    } catch (e) {
      errorMsg = e;
      setState(ViewState.Fail);
    }
  }
}
