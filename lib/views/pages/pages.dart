import 'dart:async';

import 'package:connectivity/connectivity.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:provider/provider.dart';
import 'package:restaurant_app/data/api/api_service.dart';
import 'package:restaurant_app/data/models/restaurant.dart';
import 'package:restaurant_app/provider/enum_result_state.dart';
import 'package:restaurant_app/provider/favorite_restaurant_provider.dart';
import 'package:restaurant_app/provider/restaurant_detail_provider.dart';
import 'package:restaurant_app/provider/restaurant_provider.dart';
import 'package:restaurant_app/provider/scheduling_provider.dart';
import 'package:restaurant_app/provider/search_restaurant_provider.dart';
import 'package:restaurant_app/utils/app_color.dart';
import 'package:restaurant_app/utils/notification_helper.dart';
import 'package:restaurant_app/views/widgets/widgets.dart';

part 'splash_screen.dart';
part 'home_page.dart';
part 'restaurant_list_page.dart';
part 'restaurant_list_search_page.dart';
part 'restaurant_list_favorite_page.dart';
part 'restaurant_detail_page.dart';
part 'search_page.dart';
part 'favorite_page.dart';
part 'setting_page.dart';
