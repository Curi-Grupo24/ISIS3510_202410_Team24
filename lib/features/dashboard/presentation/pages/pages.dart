library com.curi.app.dashboard.pages;

import 'dart:math' as math;

import 'package:flutter/material.dart' hide Colors;
import 'package:get/get.dart';
import 'package:get/route_manager.dart';

import '../../../../core/models/dashboard_data.dart';
import '../../../../core/ui/colors_brand.dart';
import '../../../../core/ui/layout.dart';
import '../../../../core/ui/spacing.dart';
import '../../../auth/data/repositories/auth_repository_impl.dart';
import '../../../auth/data/repositories/users_repository_impl.dart';
import '../../../auth/domain/repositories/auth_repository.dart';
import '../../../common_widgets/widgets.dart';
import '../widgets/widgets.dart';

part './dashboard_home.dart';
