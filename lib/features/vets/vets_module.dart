library vets_module;

import 'dart:convert';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pet_care_second_version/common_widgets/common_widgets.dart';
import 'package:pet_care_second_version/features/home/widgets/star_rating_widget.dart';
import 'package:pet_care_second_version/resources/colors_manager.dart';
import 'package:pet_care_second_version/resources/styles_manager.dart';
import 'package:pet_care_second_version/resources/values_manager.dart';
import 'package:pet_care_second_version/utils/enums.dart';
import 'package:pet_care_second_version/utils/extension/responsive_extension.dart';

import 'model/main_vets_model.dart';
part 'ui/screens/vets_screen.dart';
part 'repositories/vets_repo.dart';
part 'ui/widgets/vet_card.dart';
part 'controllers/vets_controller.dart';
part 'ui/screens/vet_details.dart';