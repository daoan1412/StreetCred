import 'package:flutter_app/core/enums/viewstate.dart';
import 'package:flutter_app/core/models/ClientProfile.dart';
import 'package:flutter_app/core/services/api.dart';
import 'package:flutter_app/core/viewmodels/base_model.dart';
import 'package:flutter_app/locator.dart';


class ProfileModel extends BaseModel {
  Api _api = locator<Api>();

  ClientProfile _profile;

  ClientProfile get profile => _profile;

  String errorMsg = "";

  void fetchProfile() async {
    setState(ViewState.Busy);
    try {
      _profile = await  _api.getAliceProfile();
      setState(ViewState.Idle);
    } catch (e) {
      errorMsg = e;
      setState(ViewState.Fail);
    }
  }

}
