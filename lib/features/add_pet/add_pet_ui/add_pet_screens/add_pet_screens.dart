library add_pet_module;

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:pet_care_second_version/utils/extension/responsive_extension.dart';
import 'package:pet_care_second_version/utils/extension/validate_extension.dart';
import 'package:wheel_chooser/wheel_chooser.dart';

import '../../../../common_widgets/common_widgets.dart';
import '../../../../resources/assets_manager.dart';
import '../../../../resources/colors_manager.dart';
import '../../../../resources/strings_manager.dart';
import '../../../../resources/styles_manager.dart';
import '../../../../resources/values_manager.dart';
import '../../../../routing/routing_module.dart';
import '../../../../utils/enums.dart';
import '../../add_pet_controller/add_pet_controller.dart';
import '../add_pet_widgets/add_pet_widgets.dart';
import 'abstract_page_widget.dart';

part 'add_old_pet.dart';
part 'add_pet_gender.dart';
part 'add_pet_preed.dart';
part 'add_pet_species_screen.dart';
part 'add_photo_for_pet.dart';
part 'add_pet_name_screen.dart';
part 'is_pat_neuter_screen.dart';
part 'main_add_pet_screen.dart';
part 'success_add_pet.dart';