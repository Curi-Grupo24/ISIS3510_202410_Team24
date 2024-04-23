library com.curi.app.dashboard.widgets;

import 'dart:math' as math;
import 'dart:math';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart' hide Colors;
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:shimmer/shimmer.dart';

import '../../../../core/models/card_bash_type.dart';
import '../../../../core/models/dashboard_data.dart';
import '../../../../core/ui/colors_brand.dart';
import '../../../../core/ui/constants.dart';
import '../../../../core/ui/layout.dart';
import '../../../../core/ui/spacing.dart';
import '../../../../core/ui/typography.dart';
import '../../../classes_list/data/models/class_model.dart';
import '../../../classes_list/presentation/widgets/widgets.dart';

part './calendar_home_dashboard.dart';
part './class_card.dart';
part './event_card.dart';
part './horizontal_card_scroll.dart';
part './tab.dart';
part './tab_bar.dart';
part './product_badge.dart';
part './shimmer_classes.dart';
