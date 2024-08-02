import 'dart:async';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:festiveapp_studio/screen/no_internet_screen/no_internet_screen.dart';
import 'package:festiveapp_studio/service/pref_services.dart';
import 'package:festiveapp_studio/utils/pref_keys.dart';
import 'package:get/get.dart';

class NetworkController extends GetxController {
  final RxBool _isConnected = false.obs;

  bool get isConnected => _isConnected.value;

  set isConnected(bool val) => _isConnected.value = val;

  @override
  void onInit() {
    super.onInit();
    checkInternet();
  }

  checkInternet() {
    Connectivity().onConnectivityChanged.listen(
      (ConnectivityResult result) {
        if (result == ConnectivityResult.none) {
          isConnected = false;
          Get.to(
            () => NoInternet(
              onTap: () {
                PrefService.setValue(PrefKeys.internet, true);
                checkConnection();
              },
            ),
          );
        } else {
          PrefService.setValue(PrefKeys.internet, false);

          isConnected = true;
          if (Get.isDialogOpen == true) {
            Get.back();
          }
        }
      },
    );
  }

  void checkConnection() async {
    var result = await Connectivity().checkConnectivity();
    if (result == ConnectivityResult.none) {
      isConnected = false;
      Get.to(
        () => NoInternet(
          onTap: () {
            checkConnection();
          },
        ),
      );
    } else {
      PrefService.setValue(PrefKeys.internet, false);

      isConnected = true;
      Get.back();
    }
  }
}

class ConnectivityService {
  // Singleton pattern
  static final ConnectivityService _instance = ConnectivityService._internal();

  factory ConnectivityService() => _instance;

  ConnectivityService._internal();

  final Connectivity _connectivity = Connectivity();
  final StreamController<ConnectivityResult> _connectivityController =
      StreamController<ConnectivityResult>.broadcast();

  Stream<ConnectivityResult> get connectivityStream =>
      _connectivityController.stream;

  void initialize() {
    // Initial check
    _checkConnectivity();

    // Listen for connectivity changes
    _connectivity.onConnectivityChanged.listen((ConnectivityResult result) {
      _connectivityController.sink.add(result);
    });
  }

  void _checkConnectivity() async {
    ConnectivityResult result = await _connectivity.checkConnectivity();
    _connectivityController.sink.add(result);
  }

  void dispose() {
    _connectivityController.close();
  }
}
