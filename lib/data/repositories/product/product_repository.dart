import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:flutter_ecommerce_app/data/services/firebase_storage_service.dart';
import 'package:flutter_ecommerce_app/features/shop/models/product_model.dart';
import 'package:flutter_ecommerce_app/utils/constants/enums.dart';
import 'package:flutter_ecommerce_app/utils/exceptions/firebase_exceptions.dart';
import 'package:flutter_ecommerce_app/utils/exceptions/platform_exceptions.dart';
import 'package:get/get.dart';

class ProductRepository extends GetxController {
  static ProductRepository get instance => Get.find();

  final _db = FirebaseFirestore.instance;

  /// Get limited featured products
  Future<List<ProductModel>> getFeaturedProducts() async {
    try {
      final snapshot = await _db.collection('products').where('isFeatured', isEqualTo: true).limit(4).get();
      return snapshot.docs.map((e) => ProductModel.fromSnapshot(e)).toList();
    } on FirebaseException catch (e) {
      throw TFirebaseException(e.code).message;
    } on PlatformException catch (e) {
      throw TPlatformException(e.code).message;
    } catch (e) {
      if (kDebugMode) {
        print('UNEXPECTED_EXCEPTION - ProductRepository.getFeaturedProducts() | error => $e');
      }
      throw 'Something went wrong. Please try again';
    }
  }

  /// Upload dummy data to the Cloud Firestore
  Future<void> uploadDummyData(List<ProductModel> products) async {
    try {
      // Upload all the products along with their images
      final storage = Get.put(TFirebaseStorageService());

      // Loop through each product
      for (var product in products) {
        // Get image data link from the local assets
        final thumbnail = await storage.getImageDataFromAssets(product.thumbnail);

        // Upload image and get its URL
        final url = await storage.uploadImageData('products/images', thumbnail, product.thumbnail.toString());

        // Assign URL to product.thumbnail attribute
        product.thumbnail = url;

        // Product list of images
        if (product.images != null && product.images!.isNotEmpty) {
          List<String> imagesUrl = [];
          for (var image in product.images!) {
            // Get image data link from local assets
            final assetImage = await storage.getImageDataFromAssets(image);

            // Upload image and get its URL
            final url = await storage.uploadImageData('products/images', assetImage, image);

            // add URL to imagesUrl list
            imagesUrl.add(url);
          }
          product.images!.clear();
          product.images!.addAll(imagesUrl);
        }

        // Upload Variation images
        if (product.productType == ProductType.variable.toString()) {
          for (var variation in product.productVariations!) {
            // Get image data link from local assets
            final assetImage = await storage.getImageDataFromAssets(variation.image);

            // Upload image and get its URL
            final url = await storage.uploadImageData('products/images', assetImage, variation.image);

            // Assign URL to variation.image attribute
            variation.image = url;
          }
        }

        // Store product in Firestore
        await _db.collection('products').doc(product.id).set(product.toJson());
      }
    } on FirebaseException catch (e) {
      throw TFirebaseException(e.code).message;
    } on PlatformException catch (e) {
      throw TPlatformException(e.code).message;
    } catch (e) {
      if (kDebugMode) {
        print('UNEXPECTED_EXCEPTION - ProductRepository.uploadDummyData() | error => $e');
      }
      throw 'Something went wrong. Please try again';
    }
  }
}
