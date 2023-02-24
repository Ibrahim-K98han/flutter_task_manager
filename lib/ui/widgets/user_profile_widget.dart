
import 'package:flutter/material.dart';
import 'package:flutter_task_manager/ui/screen/update_profile_screen.dart';

class UserProfileWidget extends StatelessWidget {
  const UserProfileWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  ListTile(
      onTap: (){
        Navigator.push(context, MaterialPageRoute(builder: (context)=> const UpdateProfileScreen()));
      },
      contentPadding: EdgeInsets.symmetric(horizontal: 16,vertical: 0),
      leading: CircleAvatar(child: Icon(Icons.person,),backgroundColor: Colors.white,),
      tileColor: Colors.green,
      title: Text('Ibrahim Khan',style: TextStyle(color: Colors.white),),
      subtitle: Text('ibrahim@gmail.com',style: TextStyle(color: Colors.white),),
    );
  }
}