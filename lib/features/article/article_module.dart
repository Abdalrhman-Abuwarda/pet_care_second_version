library article_module;

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pet_care_second_version/utils/extension/responsive_extension.dart';
import 'package:provider/provider.dart';

import '../../common_widgets/common_widgets.dart';
import '../../locator.dart';
import '../../resources/assets_manager.dart';
import '../../resources/colors_manager.dart';
import '../../resources/strings_manager.dart';
import '../../resources/styles_manager.dart';
import '../../resources/values_manager.dart';
import '../../routing/routing_module.dart';
import '../../utils/enums.dart';

part 'ui/screens/article-detail.dart';
part 'ui/screens/find_article.dart';
part 'model/article_model.dart';
part 'ui/widgets/article_card.dart';
part 'repositories/article_repo.dart';
part 'controller/article_controller.dart';