import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:flutter_ecommerce_app/data/services/firebase_storage_service.dart';
import 'package:flutter_ecommerce_app/features/shop/models/category_model.dart';
import 'package:flutter_ecommerce_app/utils/exceptions/firebase_exceptions.dart';
import 'package:flutter_ecommerce_app/utils/exceptions/platform_exceptions.dart';
import 'package:get/get.dart';

class CategoryRepository extends GetxController {
  static CategoryRepository get instance => Get.find();

  /// Variables
  final _db = FirebaseFirestore.instance;

  /// Get all categories
  Future<List<CategoryModel>> getAllCategories() async {
    try {
      final snapshot = await _db.collection('categories').get();
      final list = snapshot.docs.map((document) => CategoryModel.fromSnapshot(document)).toList();
      return list;
    } on FirebaseException catch (e) {
      throw TFirebaseException(e.code).message;
    } on PlatformException catch (e) {
      throw TPlatformException(e.code).message;
    } catch (e) {
      if (kDebugMode) {
        print('UNEXPECTED_EXCEPTION - CategoryRepository.getAllCategories() | error => $e');
      }
      throw 'Something went wrong. Please try again';
    }
  }

  /// Get sub categories

  /// Upload categories to the Firestore
  Future<void> uploadDummyData(List<CategoryModel> categories) async {
    try {
      // Upload all the CAtegories along with their images
      final storage = Get.put(TFirebaseStorageService());

      // Loop through each category
      for (var category in categories) {
        // Get ImageData link from the local assets
        final file = await storage.getImageDataFromAssets(category.image);

        // Upload image and get it's URL
        final url = await storage.uploadImageData('categories', file, category.name);

        // Assign URL to category.image attribute
        category.image = url;

        // Store category in Firestore
        await _db.collection('categories').doc(category.id).set(category.toJson());
      }
    } on FirebaseException catch (e) {
      throw TFirebaseException(e.code).message;
    } on PlatformException catch (e) {
      throw TPlatformException(e.code).message;
    } catch (e) {
      if (kDebugMode) {
        print('UNEXPECTED_EXCEPTION - CategoryRepository.uploadDummyData() | error => $e');
      }
      throw 'Something went wrong. Please try again';
    }
  }
}
