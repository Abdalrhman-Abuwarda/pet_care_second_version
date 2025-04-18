library shop_screens;

import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:pet_care_second_version/common_widgets/common_widgets.dart';
import 'package:pet_care_second_version/common_widgets/custom_circularProgressIndicator.dart';
import 'package:pet_care_second_version/features/shop/controllers/card_provider.dart';
import 'package:pet_care_second_version/features/shop/controllers/order_Inforamtion_provider.dart';
import 'package:pet_care_second_version/features/shop/controllers/product_provider.dart';
import 'package:pet_care_second_version/features/shop/core/shop_controller/shop_controller.dart';
import 'package:pet_care_second_version/features/shop/models/product_model.dart';
import 'package:pet_care_second_version/features/shop/ui/widgets/shop_widgets.dart';
import 'package:pet_care_second_version/locator.dart';
import 'package:pet_care_second_version/resources/assets_manager.dart';
import 'package:pet_care_second_version/resources/colors_manager.dart';
import 'package:pet_care_second_version/resources/size_config.dart';
import 'package:pet_care_second_version/resources/styles_manager.dart';
import 'package:pet_care_second_version/resources/values_manager.dart';
import 'package:pet_care_second_version/routing/routing_module.dart';
import 'package:pet_care_second_version/utils/extension/responsive_extension.dart';
import 'package:pet_care_second_version/utils/extension/validate_extension.dart';
import 'package:provider/provider.dart';

import '../../../../resources/strings_manager.dart';

part 'accesso_shop_screen.dart';
part 'add_new_card.dart';
part 'cart_screen.dart';
part 'furniture_shop.dart';
part 'main_shop_screen.dart';
part 'order_information.dart';
part 'order_success.dart';
part 'pet_food_shop.dart';
part 'pharmacy_shop_screen.dart';
part 'product_details.dart';
