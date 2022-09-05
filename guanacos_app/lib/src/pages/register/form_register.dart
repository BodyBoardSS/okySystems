import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gunanacos_app/src/pages/register/register_controller.dart';

class FormRegister extends StatelessWidget {
  RegisterController registerController = Get.put(RegisterController());

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(
          top: MediaQuery.of(context).size.height * 0.25, left: 50, right: 50),
      height: MediaQuery.of(context).size.height * 0.65,
      width: MediaQuery.of(context).size.height * 1,
      decoration: BoxDecoration(
          color: Color.fromRGBO(97, 72, 28, 0.7),
          borderRadius: BorderRadius.circular(20)),
      child: SingleChildScrollView(
        child: Column(
          children: [
            _txtYourInfo(),
            _txtFieldEmail(),
            _txtFieldName(),
            _txtFieldApellido(),
            _txtFieldPhone(),
            _txtFieldPassword(),
            _txtFieldConfirmPassword(),
            _buttonRegister(),
          ],
        ),
      ),
    );
  }

  Widget _txtYourInfo() {
    return Container(
        margin: EdgeInsets.only(top: 20, bottom: 20),
        child: Text('Ingrese esta informacion',
            style: TextStyle(
                fontSize: 16,
                color: Colors.white,
                fontWeight: FontWeight.bold)));
  }

  Widget _txtFieldEmail() {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 20),
      child: TextField(
        controller: registerController.emailController,
        keyboardType: TextInputType.emailAddress,
        decoration: InputDecoration(
            hintText: 'Correo electronico', prefixIcon: Icon(Icons.email)),
      ),
    );
  }

  Widget _txtFieldName() {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 20),
      child: TextField(
        controller: registerController.nameController,
        keyboardType: TextInputType.text,
        decoration:
            InputDecoration(hintText: 'Nombre', prefixIcon: Icon(Icons.person)),
      ),
    );
  }

  Widget _txtFieldApellido() {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 20),
      child: TextField(
        controller: registerController.lastNameController,
        keyboardType: TextInputType.text,
        decoration: InputDecoration(
            hintText: 'Apellido', prefixIcon: Icon(Icons.person_outline)),
      ),
    );
  }

  Widget _txtFieldPhone() {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 20),
      child: TextField(
        controller: registerController.phoneController,
        keyboardType: TextInputType.phone,
        decoration: InputDecoration(
            hintText: 'Telefono', prefixIcon: Icon(Icons.phone)),
      ),
    );
  }

  Widget _txtFieldPassword() {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 20),
      child: TextField(
        controller: registerController.passwordController,
        keyboardType: TextInputType.text,
        obscureText: true,
        decoration: InputDecoration(
            hintText: 'Contraseña', prefixIcon: Icon(Icons.lock)),
      ),
    );
  }

  Widget _txtFieldConfirmPassword() {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 20),
      child: TextField(
        controller: registerController.confirmPasswordController,
        keyboardType: TextInputType.text,
        obscureText: true,
        decoration: InputDecoration(
            hintText: 'Confirmar Contraseña',
            prefixIcon: Icon(Icons.lock_outline)),
      ),
    );
  }

  Widget _buttonRegister() {
    return Container(
      width: double.infinity,
      margin: EdgeInsets.symmetric(horizontal: 20, vertical: 40),
      child: ElevatedButton(
          onPressed: () => registerController.register(),
          style: ElevatedButton.styleFrom(
              padding: EdgeInsets.symmetric(vertical: 15)),
          child: Text(
            'Registrarme',
            style: TextStyle(
                color: Colors.black, fontWeight: FontWeight.bold, fontSize: 15),
          )),
    );
  }
}

Widget buttonBack() {
  return SafeArea(
      child: Container(
    margin: EdgeInsets.only(left: 20),
    child: IconButton(
        onPressed: () => Get.back(),
        icon: Icon(
          Icons.arrow_back_ios,
          color: Colors.amber,
          size: 30,
        )),
  ));
}

Widget imageUser() {
  return SafeArea(
    child: Container(
      alignment: Alignment.topCenter,
      margin: EdgeInsets.only(top: 20),
      child: GestureDetector(
        onTap: () {},
        child: CircleAvatar(
          backgroundImage: AssetImage('assets/img/user_profile.png'),
          radius: 60,
          backgroundColor: Colors.amber,
        ),
      ),
    ),
  );
}