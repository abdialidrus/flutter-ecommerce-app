import 'package:flutter_ecommerce_app/data/repositories/categories/category_repository.dart';
import 'package:flutter_ecommerce_app/data/services/dummy_data.dart';
import 'package:flutter_ecommerce_app/features/shop/models/category_model.dart';
import 'package:flutter_ecommerce_app/utils/popups/loaders.dart';
import 'package:get/get.dart';

class CategoryController extends GetxController {
  static CategoryController get instance => Get.find();

  final isLoading = false.obs;
  final _categoryRepository = Get.put(CategoryRepository());
  final RxList<CategoryModel> allCategories = <CategoryModel>[].obs;
  final RxList<CategoryModel> featuredCategories = <CategoryModel>[].obs;

  @override
  void onInit() {
    fetchCategories();
    super.onInit();
  }

  /// Load category data
  Future<void> fetchCategories() async {
    try {
      // Show loader while loading categories
      isLoading.value = true;

      // Fetch categories from data source (Firestore, API, etc)
      final categories = await _categoryRepository.getAllCategories();

      // Uppdate the categories list
      allCategories.assignAll(categories);

      // Filter featured categories
      featuredCategories.assignAll(allCategories.where((category) => category.isFeatured && category.parentId.isEmpty).take(8).toList());
    } catch (e) {
      TLoaders.errorSnackBar(title: 'Oh Snap!', message: e.toString());
    } finally {
      // Stop Loading
      isLoading.value = false;
    }
  }

  Future<void> uploadDummyCategories() async {
    try {
      final dummyCategories = TDummyData.categories;
      await _categoryRepository.uploadDummyData(dummyCategories);
    } catch (e) {}
  }

  /// Load selected category data

  /// Get category or sub-category products
}
