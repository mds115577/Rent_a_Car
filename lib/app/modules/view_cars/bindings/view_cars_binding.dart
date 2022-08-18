import 'package:get/get.dart';

import '../controllers/view_cars_controller.dart';

class ViewCarsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ViewCarsController>(
      () => ViewCarsController(),
    );
  }
}
