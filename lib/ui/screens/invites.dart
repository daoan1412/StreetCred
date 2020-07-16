import 'package:flutter/material.dart';
import 'package:flutter_app/core/enums/viewstate.dart';
import 'package:flutter_app/core/viewmodels/invites_model.dart';
import 'package:flutter_app/ui/views/base_view.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class InvitesScreen extends StatelessWidget {
  Widget _render(InvitesModel model) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Invites"),
      ),
      body: Center(
        child: _getBody(model),
      ),
    );
  }

  Widget _getBody(InvitesModel model) {
    if (model.state == ViewState.Idle) {
      if(model.invites.length == 0) {
        return Center(
          child: Text("No Invitations"),
        );
      }
      return ListView.builder(
        itemCount: model.invites.length,
        itemBuilder: (context, index) {
          var invite = model.invites[index];
          return Slidable(
            actionPane: SlidableDrawerActionPane(),
            actionExtentRatio: 0.25,
            child: ListTile(
              leading: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Icon(
                    FontAwesome.user_plus,
                    color: Colors.grey,
                    size: 24,
                  )
                ],
              ),
              title: Text(invite.name),
              subtitle: Text("State: ${invite.state}"),
              onTap:  () => {

              },
            ),
            secondaryActions: <Widget>[
              IconSlideAction(
                caption: 'Accept',
                color: Colors.green,
                icon: Icons.done,
                onTap: () {
                  model.acceptInvite(index);
                },
              ),
              IconSlideAction(
                caption: 'Decline',
                color: Colors.red,
                icon: Icons.close,
                onTap: () {
                  model.declineInvite(index);
                },
              ),
            ],
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
    return BaseView<InvitesModel>(
        onModelReady: (model) => model.fetchInvites(),
        builder: (BuildContext context, InvitesModel model, Widget child) =>
            _render(model));
  }
}
