library reminder_module;

import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:date_picker_timeline/date_picker_timeline.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:pet_care_second_version/common_widgets/common_widgets.dart';
import 'package:pet_care_second_version/features/notification/notification_helper.dart';
import 'package:pet_care_second_version/features/notification/provider/notification_provider.dart';
import 'package:pet_care_second_version/locator.dart';
import 'package:pet_care_second_version/resources/assets_manager.dart';
import 'package:pet_care_second_version/resources/colors_manager.dart';
import 'package:pet_care_second_version/resources/strings_manager.dart';
import 'package:pet_care_second_version/resources/styles_manager.dart';
import 'package:pet_care_second_version/resources/values_manager.dart';
import 'package:pet_care_second_version/routing/routing_module.dart';
import 'package:pet_care_second_version/utils/extension/responsive_extension.dart';
import 'package:pet_care_second_version/utils/extension/time_extension.dart';
import 'package:pet_care_second_version/utils/extension/validate_extension.dart';
import 'package:wheel_chooser/wheel_chooser.dart';

import 'models/remonder.dart';

part "controllers/reminder_controller.dart";
part 'models/reminder_type_model.dart';
part 'ui/screens/add_reminder_screen.dart';
part "ui/screens/reminder_screen.dart";
part 'ui/widgets/add_time_reminder_card.dart';
part "ui/widgets/choose_date_sheet.dart";
part 'ui/widgets/reminder_card.dart';
part "ui/widgets/reminder_picker_card.dart";
