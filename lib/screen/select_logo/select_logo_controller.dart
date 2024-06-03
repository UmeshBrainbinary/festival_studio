import 'package:get/get.dart';

class LogoController extends GetxController {
  var selectedLogoIndex = (-1).obs;  // No logo is selected initially

  void selectLogo(int index) {
    selectedLogoIndex.value = index;
  }

  bool isSelected(int index) {
    return selectedLogoIndex.value == index;
  }
}
