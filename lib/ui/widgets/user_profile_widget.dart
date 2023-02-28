import 'package:flutter/material.dart';
import 'package:flutter_task_manager/ui/screen/login.dart';
import 'package:flutter_task_manager/ui/screen/update_profile_screen.dart';

import '../../data/auth_util.dart';

class UserProfileWidget extends StatelessWidget {
  const UserProfileWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: () {
        Navigator.push(context, MaterialPageRoute(
            builder: (context) => const UpdateProfileScreen()));
      },
      contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 0),
      leading: CircleAvatar(
        child: Icon(Icons.person,), backgroundColor: Colors.white,),
      tileColor: Colors.green,
      title: Text('${AuthUtils.firstName ?? ' '} ${AuthUtils.lastName ?? ' '}',
        style: TextStyle(color: Colors.white),),
      subtitle: Text('${AuthUtils.email ?? 'Unknow'}',
        style: TextStyle(color: Colors.white),),
      trailing: IconButton(
        onPressed: () async {
          await AuthUtils.clearData();
          Navigator.pushAndRemoveUntil(
              context, MaterialPageRoute(builder: (context) => LoginScreen()), (
              route) => false);
        },
        icon: const Icon(Icons.logout, color: Colors.white,),
      ),
    );
  }
}