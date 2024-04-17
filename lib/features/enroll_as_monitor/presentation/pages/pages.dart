library com.curi.app.enrollasmonitor.pages;

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart' hide Colors;
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';

import '../../../../core/constants/smester_constants.dart';
import '../../../../core/ui/colors_brand.dart';
import '../../../../core/ui/layout.dart';
import '../../../../core/ui/spacing.dart';
import '../../../../core/ui/typography.dart';
import '../../../classes_list/data/models/class_model.dart';
import '../../../classes_list/presentation/bloc/fetch_subject/fetch_subject_bloc.dart';
import '../../../classes_list/presentation/widgets/widgets.dart';
import '../../../common_widgets/widgets.dart';
import '../../../profile_user/presentation/widgets/modal_case.dart';
import '../widgets/widgets.dart';

part './enroll_home.dart';
part './questionnaire_view.dart';
part './first_question_view.dart';
part './result_view.dart';
