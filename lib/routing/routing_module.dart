library routing_module;

import 'package:flutter/material.dart';
import 'package:pet_care_second_version/features/article/article_module.dart';
import 'package:pet_care_second_version/features/auth/auth_ui/screens/splash_screen.dart';
import 'package:pet_care_second_version/features/home/controllers/search_provider.dart';
import 'package:pet_care_second_version/features/home/ui/home_ui_module.dart';
import 'package:pet_care_second_version/features/pets/pets_module.dart';
import 'package:pet_care_second_version/features/reminder/reminder_module.dart';
import 'package:pet_care_second_version/features/vets/vets_module.dart';
import 'package:pet_care_second_version/locator.dart';
import 'package:provider/provider.dart';

import '../features/add_pet/add_pet_ui/add_pet_screens/add_pet_screens.dart';
import '../features/auth/auth_ui/screens/auth_module.dart';
import '../features/home/controllers/home_provider.dart';
import '../features/home/ui/screens/all_vets_doctor.dart';
import '../features/location/controller/address_provider.dart';
import '../features/location/location_module.dart';
import '../features/profile/profile_module.dart';
import '../features/shop/controllers/card_provider.dart';
import '../features/shop/controllers/order_Inforamtion_provider.dart';
import '../features/shop/controllers/product_provider.dart';
import '../features/shop/ui/screens/shop_screens.dart';

part 'route_generator.dart';
part 'route_service.dart';
part 'routes_generate.dart';
