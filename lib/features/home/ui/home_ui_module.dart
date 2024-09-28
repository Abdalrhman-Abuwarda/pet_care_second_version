library home_ui_module;

import 'dart:io';

import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:pet_care_second_version/utils/extension/responsive_extension.dart';
import 'package:pet_care_second_version/utils/extension/time_extension.dart';
import 'package:pet_care_second_version/utils/extension/validate_extension.dart';
import 'package:provider/provider.dart';

import '../../../common_widgets/common_widgets.dart';
import '../../../common_widgets/custom_circularProgressIndicator.dart';
import '../../../locator.dart';
import '../../../resources/assets_manager.dart';
import '../../../resources/colors_manager.dart';
import '../../../resources/strings_manager.dart';
import '../../../resources/styles_manager.dart';
import '../../../resources/values_manager.dart';
import '../../../routing/routing_module.dart';
import '../../article/article_module.dart';
import '../../notification/provider/notification_provider.dart';
import '../../pets/pets_module.dart';
import '../../profile/profile_module.dart';
import '../../reminder/reminder_module.dart';
import '../../shop/controllers/product_provider.dart';
import '../../shop/ui/screens/shop_screens.dart';
import '../../shop/ui/widgets/shop_widgets.dart';
import '../controllers/home_provider.dart';
import '../controllers/search_provider.dart';
import '../models/vets_model.dart';
import '../widgets/star_rating_widget.dart';
import '../widgets/vet_card.dart';

part 'screens/home_screen.dart';
part 'screens/main_screen_app.dart';
part 'screens/search_screen.dart';
part 'screens/all_pet_product.dart';
