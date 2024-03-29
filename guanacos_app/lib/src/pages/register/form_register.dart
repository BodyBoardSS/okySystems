import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:guanacos_app/src/pages/register/register_controller.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

// ignore: must_be_immutable
class FormRegister extends StatelessWidget {
  FormRegister({Key? key}) : super(key: key);

  final maskFormatter = MaskTextInputFormatter(
    mask: '####-####'
  );
  
  RegisterController registerController = Get.put(RegisterController());


  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(
          top: MediaQuery.of(context).size.height * 0.30, left: 50, right: 50),
      height: MediaQuery.of(context).size.height * 0.60,
      width: MediaQuery.of(context).size.height * 1,
      decoration: BoxDecoration(
          color:const Color.fromRGBO(97, 72, 28, 0.7),
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
            _buttonRegister(context),
          ],
        ),
      ),
    );
  }

  Widget _txtYourInfo() {
    return Container(
        margin:const EdgeInsets.only(top: 20, bottom: 20),
        child:const Text('Ingrese esta informacion',
            style: TextStyle(
                fontSize: 16,
                color: Colors.white,
                fontWeight: FontWeight.bold)));
  }

  Widget _txtFieldEmail() {
    return Container(
      margin:const EdgeInsets.symmetric(horizontal: 20),
      child: TextField(
        controller: registerController.emailController,
        keyboardType: TextInputType.emailAddress,
        decoration:const InputDecoration(
            hintText: 'Correo electronico', prefixIcon: Icon(Icons.email)),
      ),
    );
  }

  Widget _txtFieldName() {
    return Container(
      margin:const EdgeInsets.symmetric(horizontal: 20),
      child: TextField(
        controller: registerController.nameController,
        keyboardType: TextInputType.text,
        decoration:
            const InputDecoration(hintText: 'Nombre', prefixIcon: Icon(Icons.person)),
      ),
    );
  }

  Widget _txtFieldApellido() {
    return Container(
      margin:const EdgeInsets.symmetric(horizontal: 20),
      child: TextField(
        controller: registerController.lastNameController,
        keyboardType: TextInputType.text,
        decoration:const InputDecoration(
            hintText: 'Apellido', prefixIcon: Icon(Icons.person_outline)),
      ),
    );
  }

  Widget _txtFieldPhone() {
    return Container(
      margin:const EdgeInsets.symmetric(horizontal: 20),
      child: TextField(
        controller: registerController.phoneController,
        keyboardType: TextInputType.number,
        decoration:const InputDecoration(
            hintText: 'Telefono', prefixIcon: Icon(Icons.phone)
        ),
        inputFormatters: [
          maskFormatter
        ],
      ),
    );
  }

  Widget _txtFieldPassword() {
    return Container(
      margin:const EdgeInsets.symmetric(horizontal: 20),
      child: Obx(() => TextField(
        controller: registerController.passwordController,
        keyboardType: TextInputType.text,
        obscureText: registerController.isPasswordHidden.value,
        decoration: InputDecoration(
            hintText: 'Contraseña', prefixIcon: const Icon(Icons.lock),
            suffix: InkWell(
              child: Icon(
                registerController.isPasswordHidden.value ? 
                Icons.visibility : Icons.visibility_off, color: Colors.grey, size: 20,),
              onTap: (){
                  registerController.isPasswordHidden.value = 
                  !registerController.isPasswordHidden.value;
              },
            )    
        ),
      ),)
    );
  }

  Widget _txtFieldConfirmPassword() {
    return Container(
      margin:const EdgeInsets.symmetric(horizontal: 20),
      child:Obx(() => TextField(
        controller: registerController.confirmPasswordController,
        keyboardType: TextInputType.text,
        obscureText: registerController.isPasswordConfirmHidden.value,
        decoration: InputDecoration(
            hintText: 'Confirmar Contraseña',
            prefixIcon: const Icon(Icons.lock_outline),
            suffix: InkWell(
              child: Icon(
                registerController.isPasswordConfirmHidden.value ? 
                Icons.visibility: Icons.visibility_off, color: Colors.grey, size: 20,),
              onTap: (){
                  registerController.isPasswordConfirmHidden.value = 
                  !registerController.isPasswordConfirmHidden.value;
              },
            )
        ),
      ),)
    );
  }

  Widget _buttonRegister(BuildContext context) {
    return Container(
      width: double.infinity,
      margin:const EdgeInsets.symmetric(horizontal: 20, vertical: 40),
      child: ElevatedButton(
          onPressed: () => registerController.register(context),
          style: ElevatedButton.styleFrom(
              padding:const EdgeInsets.symmetric(vertical: 15)),
          child:const Text(
            'Registrarme',
            style: TextStyle(
                color: Colors.black, fontWeight: FontWeight.bold, fontSize: 15),
          )),
    );
  }
}

Widget imageUser(BuildContext context) {
  RegisterController registerController = Get.put(RegisterController());
  return SafeArea(
    child: Container(
      alignment: Alignment.topCenter,
      margin:const EdgeInsets.only(top: 20),
      child: GestureDetector(
        onTap: () => registerController.showAlertDialog(context),
        child: GetBuilder<RegisterController>(
          builder: (value) => CircleAvatar(
            backgroundImage: registerController.imgFile != null
                ? FileImage(registerController.imgFile!)
                :const AssetImage('assets/img/user_profile_plus.png') as ImageProvider,
            radius: 60,
            backgroundColor: Colors.amber,
          ),
        ),
      ),
    ),
  );
}

Widget buttonBack() {
  return SafeArea(
      child: Container(
    margin:const EdgeInsets.only(left: 20),
    child: IconButton(
        onPressed: () => Get.back(),
        icon:const Icon(
          Icons.arrow_back_ios,
          color: Colors.white,
          size: 30,
        )),
  ));
}
