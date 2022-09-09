import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gunanacos_app/src/pages/client/profile/profile_info_controller.dart';
import 'package:gunanacos_app/src/pages/home/home_controller.dart';
import 'package:gunanacos_app/src/widgets/background_app.dart';

class ProfileInfoPage extends StatelessWidget {
  ProfileInfoController profileInfoController = Get.put(ProfileInfoController());
  HomeController hController = Get.put(HomeController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          BackgroundApp(),
          _imageUser(context),
          _Options(context)
        ],
      ),
    );
  }


  Widget _Options(BuildContext context){
    return Container(
        alignment: Alignment.topCenter,
        margin: EdgeInsets.only(top: MediaQuery.of(context).size.height * 0.45),
        child: ListView(
          padding: EdgeInsets.all(0),
          children: [
            ListTile(
              onTap: () => profileInfoController.goToUpdatePage(),
              title: Text('Perfil', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 17)),
              leading: Icon(Icons.edit, size: 30),
              trailing: Icon(Icons.arrow_forward_ios, size: 30),
            ),
            const Divider(),
            ListTile(
              title: const Text('Salir', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 17),),
              leading: Icon(Icons.logout, size: 30),
              trailing: Icon(Icons.arrow_forward_ios, size: 30),
              onTap: () => hController.logOut(),
            )
          ],
        ),
    );
  }

  Widget _imageUser(BuildContext context) {
    return SafeArea(
      child: Column(
        children: [
          Container(
            alignment: Alignment.topCenter,
            margin: EdgeInsets.only(top: MediaQuery.of(context).size.height * 0.05),
            child: CircleAvatar(
                backgroundImage: profileInfoController.user.image != null
                    ? NetworkImage(profileInfoController.user.image!)
                    : AssetImage('assets/img/user_profile.png') as ImageProvider,
                radius: 60,
                backgroundColor: Colors.amber,
              ),
          ),
          SizedBox(
            height: 10,
          ),
          Text(
              profileInfoController.user.name!+' '+profileInfoController.user.lastName!,
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 20,
                  fontWeight: FontWeight.bold
              ),
          )
        ],
      ),
    );
  }
}