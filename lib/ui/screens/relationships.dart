import 'package:flutter/material.dart';
import 'package:flutter_app/core/enums/viewstate.dart';
import 'package:flutter_app/core/models/RelationshipItem.dart';
import 'package:flutter_app/core/viewmodels/relationships_model.dart';
import 'package:flutter_app/ui/screens/invite_qr.dart';
import 'package:flutter_app/ui/screens/relationship.dart';
import 'package:flutter_app/ui/views/base_view.dart';

class RelationshipsScreen extends StatelessWidget {
  Widget _render(RelationshipsModel model) {
    if (model.state == ViewState.Idle) {
      return ListView.builder(
          itemCount: model.items.length,
          itemBuilder: (context, index) {
            final RelationshipItem item = model.items[index];
            return ListTile(
              leading: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Icon(
                    Icons.person,
                    color: Colors.grey,
                    size: 26,
                  ),
                ],
              ),
              title: Text(item.name),
              subtitle: Text("DID: ${item.did}"),
              onTap: () => {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => RelationshipScreen(
                            connectionId: item.id,
                          )),
                )
              },
            );
          });
    } else if (model.state == ViewState.Fail) {
      return Text(model.errorMsg);
    }
    return CircularProgressIndicator();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Relationships"),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.add),
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => InviteQrScreen()));
            },
          )
        ],
      ),
      body: Center(
        child: BaseView<RelationshipsModel>(
          onModelReady: (model) => model.fetchRelationships(),
          builder: (context, model, child) => _render(model),
        ),
      ),
    );
  }
}
