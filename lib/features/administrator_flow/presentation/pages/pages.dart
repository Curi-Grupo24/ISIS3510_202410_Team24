library com.curi.app.administrator.pages;

import 'package:flutter/material.dart' hide Colors;
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:get/get_utils/get_utils.dart';

import '../../../../core/ui/colors_brand.dart';
import '../../../../core/ui/layout.dart';
import '../../../class_flow/presentation/widgets/widgets.dart';
import '../../../classes_list/presentation/widgets/widgets.dart';
import '../../../common_widgets/widgets.dart';
import '../../../dashboard/presentation/bloc/dashboard_bloc/dashboard_bloc.dart';
import '../bloc/available_candidates/available_candidates_bloc.dart';
import '../widgets/description_candidate.dart';

part './home_administrator.dart';
part './candidates_list.dart';
part './add_class_form.dart';
part './available_classes.dart';
part './candidates_detail.dart';
