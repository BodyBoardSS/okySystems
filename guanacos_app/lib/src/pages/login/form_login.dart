import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:guanacos_app/src/pages/login/login_controller.dart';

// ignore: must_be_immutable
class FormLogin extends StatelessWidget {
  FormLogin({Key? key}) : super(key: key);

  LoginController con = Get.put(LoginController());

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(
          top: MediaQuery.of(context).size.height * 0.20, left: 50, right: 50),
      height: MediaQuery.of(context).size.height * 0.50,
      width: MediaQuery.of(context).size.height * 1,
      decoration: BoxDecoration(
          color:const Color.fromRGBO(97, 72, 28, 0.7),
          borderRadius: BorderRadius.circular(20)),
      child: SingleChildScrollView(
        child: Column(
          children: [
            _txtYourInfo(),
            _txtFieldEmail(),
            const SizedBox(
              height: 10,
            ),
            _txtFieldPassword(),
            _buttonLogin()
          ],
        ),
      ),
    );
  }

  Widget _txtYourInfo() {
    return Container(
        margin: const EdgeInsets.only(top: 40, bottom: 50),
        child: const Text('Ingrese esta informacion',
            style: TextStyle(
                fontSize: 16,
                color: Colors.white,
                fontWeight: FontWeight.bold)));
  }

  Widget _txtFieldEmail() {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 40),
      child: TextField(
        controller: con.emailController,
        keyboardType: TextInputType.emailAddress,
        decoration: const InputDecoration(
            hintText: 'Correo electronico', prefixIcon: Icon(Icons.email)),
      ),
    );
  }

  Widget _txtFieldPassword() {
    return  Container(
      margin: const EdgeInsets.symmetric(horizontal: 40),
      child: Obx(() => TextField(
        controller: con.passwordController,
        keyboardType: TextInputType.text,
        obscureText: con.isPasswordHidden.value,
        decoration: InputDecoration(
            hintText: 'Contraseña', prefixIcon: const Icon(Icons.lock),
            suffix: InkWell(
              child: Icon(con.isPasswordHidden.value ? 
                Icons.visibility : Icons.visibility_off, color: Colors.grey, size: 20,),
              onTap: (){
                  con.isPasswordHidden.value = 
                  !con.isPasswordHidden.value;
              },
            )),
      ),)
    );
  }

  Widget _buttonLogin() {
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.symmetric(horizontal: 40, vertical: 40),
      child: ElevatedButton(
          onPressed: () => con.login(),
          style: ElevatedButton.styleFrom(
              padding: const EdgeInsets.symmetric(vertical: 15)),
          child: const Text(
            'Ingresar',
            style: TextStyle(
                color: Colors.white, fontWeight: FontWeight.bold, fontSize: 15),
          )),
    );
  }
}
