import 'package:get/get.dart';

import '../controllers/help_us_controller.dart';

class HelpUsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<HelpUsController>(
      () => HelpUsController(),
    );
  }
}
