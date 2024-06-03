import 'package:flutter_share/flutter_share.dart';
import 'package:get/get.dart';

class CardDetailController extends GetxController{

RxInt selectedIndex = 0.obs;

Future<void> share() async {
  await FlutterShare.share(
    title: 'Festival studio',
    linkUrl: 'app link attached',
  );
}
}