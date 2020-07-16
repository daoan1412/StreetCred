import 'package:flutter/material.dart';
import 'package:flutter_app/core/enums/viewstate.dart';
import 'package:flutter_app/core/models/ClientProfile.dart';
import 'package:flutter_app/core/models/ClientProperty.dart';
import 'package:flutter_app/core/viewmodels/profile_model.dart';
import 'package:flutter_app/ui/screens/invites.dart';
import 'package:flutter_app/ui/screens/relationships.dart';
import 'package:flutter_app/ui/views/base_view.dart';
import 'package:flutter_app/ui/widgets/common/notification.dart';

class AliceScreen extends StatelessWidget {
  final items = [
    ClientProperty(Icons.people, "Relationships"),
    ClientProperty(Icons.vpn_key, "Credentials"),
    ClientProperty(Icons.verified_user, "Proof Certificates"),
    ClientProperty(Icons.sync, "Pending Credentials"),
  ];

  String _getCount(ClientProfile data, int index) {
    if (index == 0) {
      return data.relationshipsCount.toString();
    } else if (index == 1) {
      return data.credentialsCount.toString();
    } else if (index == 2) {
      return data.proofsCount.toString();
    } else {
      return data.issuesCount.toString();
    }
  }

  Widget _render(ProfileModel model, BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Alice"),
        actions: <Widget>[
          NotificationBell(
              number: model.invites.length,
              callback: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => InvitesScreen()),
                  );
                  model.clearInvites();
              })
        ],
      ),
      body: Center(
        child: _getBody(model),
      ),
    );
  }

  Widget _getBody(ProfileModel model) {
    if (model.state == ViewState.Idle) {
      return ListView.builder(
        itemCount: items.length,
        itemBuilder: (context, index) {
          return ListTile(
            leading: Icon(
              items[index].icon,
              color: Colors.grey,
              size: 24,
            ),
            title: Text('${items[index].propertyName}'),
            trailing: Text(_getCount(model.profile, index)),
            onTap: () => {
              if (index == 0)
                {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => RelationshipsScreen()),
                  )
                }
            },
          );
        },
      );
    } else if (model.state == ViewState.Fail) {
      return Text(model.errorMsg);
    }
    return CircularProgressIndicator();
  }

  @override
  Widget build(BuildContext context) {
    return BaseView<ProfileModel>(
        onModelReady: (model) => model.fetchProfile(),
        builder: (BuildContext context, ProfileModel model, Widget child) =>
            _render(model, context));
  }
}
