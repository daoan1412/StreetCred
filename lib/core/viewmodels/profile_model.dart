import 'package:flutter_app/core/enums/viewstate.dart';
import 'package:flutter_app/core/models/ClientProfile.dart';
import 'package:flutter_app/core/models/RelationshipItem.dart';
import 'package:flutter_app/core/services/api.dart';
import 'package:flutter_app/core/viewmodels/base_model.dart';
import 'package:flutter_app/locator.dart';

class ProfileModel extends BaseModel {
  Api _api = locator<Api>();

  ClientProfile _profile;

  ClientProfile get profile => _profile;

  int _notifications;

  int get notification => _notifications;

  List<RelationshipItem> _invites = [];

  List<RelationshipItem> get invites => _invites;

  String errorMsg = "";

  void fetchProfile() async {
    setState(ViewState.Busy);
    try {
      _profile = await _api.getAliceProfile();
      _invites.clear();
      _invites.addAll(await _api.getInvites());
      setState(ViewState.Idle);
    } catch (e) {
      errorMsg = e;
      setState(ViewState.Fail);
    }
  }

  void clearInvites() {
    _invites.clear();
    notifyListeners();
  }
}
