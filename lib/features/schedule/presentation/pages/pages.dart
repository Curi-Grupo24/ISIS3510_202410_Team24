library com.curi.app.schedule.pages;

import 'dart:math' as math;
import 'package:flutter/material.dart' hide Colors;
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:timezone/data/latest_all.dart' as tz;
import 'package:timezone/timezone.dart' as tz;

import '../../../../core/constants/dates_constants.dart';
import '../../../../core/ui/colors_brand.dart';
import '../../../../core/ui/layout.dart';
import '../../../class_flow/presentation/widgets/widgets.dart';
import '../../../common_widgets/widgets.dart';
import '../bloc/schedule_register/schedule_register_bloc.dart';
import '../widgets/widgets.dart';
import '../../../notifications/presentation/widgets/local_notifications.dart';

part './schedule_home.dart';
part './schedule_register.dart';
part './schedule_detail.dart';
