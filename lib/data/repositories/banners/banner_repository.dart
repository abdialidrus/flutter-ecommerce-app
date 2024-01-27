import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:flutter_ecommerce_app/data/services/firebase_storage_service.dart';
import 'package:flutter_ecommerce_app/features/shop/models/banner_model.dart';
import 'package:flutter_ecommerce_app/utils/exceptions/firebase_exceptions.dart';
import 'package:flutter_ecommerce_app/utils/exceptions/format_exceptions.dart';
import 'package:flutter_ecommerce_app/utils/exceptions/platform_exceptions.dart';
import 'package:get/get.dart';

class BannerRepository extends GetxController {
  static BannerRepository get instance => Get.find();

  /// Variables
  final _db = FirebaseFirestore.instance;

  /// Get all banners related to current user
  Future<List<BannerModel>> fetchBanners() async {
    try {
      final result = await _db.collection('banners').where('active', isEqualTo: true).get();
      return result.docs.map((documentSnapshot) => BannerModel.fromSnapshot(documentSnapshot)).toList();
    } on FirebaseException catch (e) {
      throw TFirebaseException(e.code).message;
    } on FormatException catch (_) {
      throw const TFormatException();
    } on PlatformException catch (e) {
      throw TPlatformException(e.code).message;
    } catch (e) {
      throw 'Something went wrong while fetching the banners. Please try again.';
    }
  }

  /// Upload categories to the Firestore
  Future<void> uploadDummyBannersData(List<BannerModel> banners) async {
    try {
      // Upload all the CAtegories along with their images
      final storage = Get.put(TFirebaseStorageService());

      // Loop through each category
      for (var banner in banners) {
        // Get ImageData link from the local assets
        final file = await storage.getImageDataFromAssets(banner.imageUrl);

        // Upload image and get it's URL
        final bannerName = banner.imageUrl.replaceAll('assets/images/banners/', '');
        final url = await storage.uploadImageData('banners', file, bannerName);

        // Assign URL to category.image attribute
        banner.imageUrl = url;

        // Store category in Firestore
        await _db.collection('banners').add(banner.toJson());
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
