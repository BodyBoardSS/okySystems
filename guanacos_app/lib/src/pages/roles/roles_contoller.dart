import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:guanacos_app/src/models/rol.dart';
import 'package:guanacos_app/src/models/user.dart';

class RolesController extends GetxController {
  User user = User.fromJson(GetStorage().read('user') ?? {});

  void goToPageRole(Rol rol){
    Get.offNamedUntil(rol.route ?? '', (route) => false);
  }
}