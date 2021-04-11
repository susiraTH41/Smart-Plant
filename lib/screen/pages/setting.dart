import 'package:flutter/material.dart';
import 'package:login_fontend/model/login_model.dart';


class Setting extends StatelessWidget {
  UserModel user ;
  
  Setting(this.user);
  @override
  Widget build(BuildContext context) {
    return Container(
          color: Colors.white,
          child: _buildList(),
        );
  }

final List<String> materialIndices = ["Profile", "Setting","Contact","Logout" ];

  Widget _buildList() {
    return ListView.builder(
        itemCount: materialIndices.length,
        itemBuilder: (BuildContext content, int index) {
          String materialIndex = materialIndices[index];
          return Container(
            color: Colors.white,
            child: ListTile(
              title: Text('$materialIndex', style: TextStyle(fontSize: 24.0)),
              trailing: Icon(Icons.chevron_right),
              
            ),
          );
        });
  }
}
