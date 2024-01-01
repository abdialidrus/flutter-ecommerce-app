import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:get/instance_manager.dart';

class OnBoardingController extends GetxController {
  static OnBoardingController get instance => Get.find();

  /// Variables

  /// Update current index when page scrolls
  void updatePageIndicator(index) {}

  /// Jump to the specific dot selected page
  void dotNavigationClick(index) {}

  // Update current index & jump to the next page
  void nextPage() {}

  // Update current index & jump to the last page
  void skipPage() {}
}
