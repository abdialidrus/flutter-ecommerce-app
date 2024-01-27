import 'package:flutter_ecommerce_app/data/repositories/banners/banner_repository.dart';
import 'package:flutter_ecommerce_app/data/services/dummy_data.dart';
import 'package:flutter_ecommerce_app/features/shop/models/banner_model.dart';
import 'package:flutter_ecommerce_app/utils/popups/loaders.dart';
import 'package:get/get.dart';

class BannerController extends GetxController {
  static BannerController get instance => Get.find();

  /// Variables
  final _bannerRepository = Get.put(BannerRepository());
  final carouselCurrentIndex = 0.obs;
  final isLoading = false.obs;
  final RxList<BannerModel> banners = <BannerModel>[].obs;

  @override
  void onInit() {
    fetchBanners();
    super.onInit();
  }

  /// Update page navigation dots
  void updatePageIndicator(index) {
    carouselCurrentIndex.value = index;
  }

  /// Fetch Banners
  Future<void> fetchBanners() async {
    try {
      // Show loader while loading categories
      isLoading.value = true;

      // Fetch banners
      final banners = await _bannerRepository.fetchBanners();

      // Assign banners
      this.banners.assignAll(banners);
    } catch (e) {
      TLoaders.errorSnackBar(title: 'Oh Snap!', message: e.toString());
    } finally {
      // Stop Loading
      isLoading.value = false;
    }
  }

  Future<void> uploadDummyBanners() async {
    try {
      final dummyBanners = TDummyData.banners;
      await _bannerRepository.uploadDummyBannersData(dummyBanners);
    } catch (e) {}
  }
}
