import 'package:flutter/material.dart';
import 'package:pos/src/ui/builder/space_builder.dart';

class MyDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: <Widget>[
          SpaceBuilder.verticalSpaceLarge(),
          ListTile(
            onTap: () {
              Navigator.of(context).pop();
              Navigator.of(context).pushNamed('/');
            },
            title: Text('Kasir'),
          ),
          ListTile(
            onTap: () {
              // Navigator.of(context).pop();
              // Navigator.of(context).pushNamed('/');
            },
            title: Text('Riwayat Transaksi'),
          ),
        ],
      ),
    );
  }
}
