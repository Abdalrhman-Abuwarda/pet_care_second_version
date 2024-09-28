library location_module;

import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:pet_care_second_version/utils/extension/responsive_extension.dart';
import 'package:provider/provider.dart';

import '../../common_widgets/common_widgets.dart';
import '../../common_widgets/custom_circularProgressIndicator.dart';
import '../../locator.dart';
import '../../resources/assets_manager.dart';
import '../../resources/colors_manager.dart';
import '../../resources/styles_manager.dart';
import '../../resources/values_manager.dart';
import '../../routing/routing_module.dart';
import 'controller/address_provider.dart';

part 'controller/location_controller.dart';
part 'ui/screens/add_address_manually.dart';
part 'ui/screens/add_new_address_screen.dart';
part 'ui/widgets/select_location_type.dart';
