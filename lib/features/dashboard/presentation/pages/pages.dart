library com.curi.app.dashboard.pages;

import 'dart:math' as math;

import 'package:flutter/material.dart' hide Colors;
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:get/route_manager.dart';

import '../../../../core/models/dashboard_data.dart';
import '../../../../core/ui/colors_brand.dart';
import '../../../../core/ui/constants.dart';
import '../../../../core/ui/layout.dart';
import '../../../../core/ui/spacing.dart';

import '../../../classes_list/presentation/widgets/widgets.dart';
import '../bloc/dashboard_bloc/dashboard_bloc.dart';

import '../bloc/my_classes/my_classes_bloc.dart';
import '../bloc/my_tutor_classes/my_tutor_classes_bloc.dart';
import '../widgets/widgets.dart';

part './dashboard_home.dart';
