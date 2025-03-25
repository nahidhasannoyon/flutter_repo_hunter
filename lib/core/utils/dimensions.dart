import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../helpers/responsive_helper.dart';

class Dimensions {
  static double fontSizeExtraSmall =
      ResponsiveHelper.isTab(Get.context) ? 14 : 10.0;
  static double fontSizeSmall = ResponsiveHelper.isTab(Get.context) ? 16 : 12.0;
  static double fontSizeDefault =
      ResponsiveHelper.isTab(Get.context) ? 18 : 14.0;
  static double fontSizeLarge = ResponsiveHelper.isTab(Get.context) ? 22 : 16.0;
  static double fontSizeExtraLarge =
      ResponsiveHelper.isTab(Get.context) ? 26 : 18.0;
  static double fontSizeOverLarge =
      ResponsiveHelper.isTab(Get.context) ? 28 : 24.0;
  static const double fontSizeWallet = 24.0;

  static const double paddingSizeExtraExtraSmall = 2.0;
  static const double paddingSizeExtraSmall = 5.0;
  static const double paddingSizeEight = 8.0;
  static const double paddingSizeSmall = 10.0;
  static const double paddingSizeTwelve = 12.0;
  static const double paddingSizeDefault = 15.0;
  static const double homePagePadding = 16.0;
  static const double paddingSizeDefaultAddress = 17.0;
  static const double paddingSizeLarge = 20.0;
  static const double paddingSizeExtraLarge = 25.0;
  static const double paddingSizeThirtyFive = 35.0;
  static const double paddingSizeOverLarge = 50.0;
  static const double paddingSizeExtraOverLarge = 35.0;
  static const double paddingSizeButton = 40.0;

  static const double marginSizeExtraSmall = 5.0;
  static const double marginSizeSmall = 10.0;
  static const double marginSizeDefault = 15.0;
  static const double marginSizeLarge = 20.0;
  static const double marginSizeExtraLarge = 25.0;
  static const double marginSizeAuthSmall = 30.0;
  static const double marginSizeAuth = 50.0;

  static const double iconSizeExtraSmall = 12.0;
  static const double iconSizeSmall = 18.0;
  static const double iconSizeDefault = 24.0;
  static const double iconSizeLarge = 32.0;
  static const double iconSizeExtraLarge = 50.0;

  // image size
  static const double imageSizeExtraSmall = 20.0;
  static const double imageSizeSmall = 30.0;
  static const double imageSizeDefault = 40.0;
  static const double imageSizeLarge = 50.0;
  static const double imageSizeExtraLarge = 60.0;
  static const double imageSizeExtraSeventy = 70.0;
  static const double bannerPadding = 40.0;

  static const double topSpace = 30.0;
  static const double splashLogoWidth = 150.0;

  static const double chooseReviewImageSize = 40.0;
  static const double profileImageSize = 100.0;
  static const double logoHeight = 80.0;
  static const double cardHeight = 265.0;

  static const double radiusSmall = 5.0;
  static const double radiusDefault = 10.0;
  static const double radiusLarge = 15.0;
  static const double radiusExtraLarge = 20.0;
  static const double radiusOverLarge = 25.0;
  static const double radiusButton = 30.0;
  static const double radiusImage = 40.0;
  static const double menuIconSize = 25.0;
  static const double featuredProductCard = 370.0;
  static const double compareCardWidget = 200.0;
  static const double clearanceHomeTitleHeight = 60.0;

  // border
  static const double borderWidthExtraSmall = 0.5;
  static const double borderWidthSmall = 1.0;
  static const double borderWidthDefault = 2.0;
  static const double borderWidthLarge = 3.0;

  // elevation
  static const double elevation = 5.0;
  static const double elevationSmall = 2.0;
  static const double elevationLarge = 10.0;
  static const double elevationExtraLarge = 15.0;

  // size box's
  static const Widget sizedBoxExtraSmallHeight = SizedBox(height: 5);
  static const Widget sizedBoxSmallHeight = SizedBox(height: 10);
  static const Widget sizedBoxDefaultHeight = SizedBox(height: 15);
  static const Widget sizedBoxLargeHeight = SizedBox(height: 20);
  static const Widget sizedBoxExtraLargeHeight = SizedBox(height: 25);

  static const Widget sizedBoxExtraSmallWidth = SizedBox(width: 5);
  static const Widget sizedBoxSmallWidth = SizedBox(width: 10);
  static const Widget sizedBoxDefaultWidth = SizedBox(width: 15);
  static const Widget sizedBoxLargeWidth = SizedBox(width: 20);
  static const Widget sizedBoxExtraLargeWidth = SizedBox(width: 25);
}
