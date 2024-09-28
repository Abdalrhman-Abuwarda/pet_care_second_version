library auth_module;

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:pet_care_second_version/features/base_provider/base_provider.dart';
import 'package:pet_care_second_version/utils/extension/responsive_extension.dart';
import 'package:pet_care_second_version/utils/extension/validate_extension.dart';
import 'package:pinput/pinput.dart';
import 'package:provider/provider.dart';

import '../../../../common_widgets/common_widgets.dart';
import '../../../../locator.dart';
import '../../../../resources/assets_manager.dart';
import '../../../../resources/colors_manager.dart';
import '../../../../resources/size_config.dart';
import '../../../../resources/strings_manager.dart';
import '../../../../resources/styles_manager.dart';
import '../../../../resources/values_manager.dart';
import '../../../../routing/routing_module.dart';
import '../../../../utils/enums.dart';
import '../../auth_contoller/auth_provider.dart';

part 'forget_password_screen.dart';
part 'login_screen.dart';
part 'main_auth_screen.dart';
part 'reset_password.dart';
part 'sign_up_screen.dart';
part 'verify_email_screen.dart';