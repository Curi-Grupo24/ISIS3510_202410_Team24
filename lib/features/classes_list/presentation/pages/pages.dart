library com.curi.app.classeslist.pages;

import 'package:flutter/material.dart' hide Colors;
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';

import '../../../../../injection_container.dart';
import '../../../../core/analytics/services/analytics_service.dart';
import '../../../../core/constants/smester_constants.dart';
import '../../../../core/ui/colors_brand.dart';
import '../../../../core/ui/layout.dart';
import '../../../common_widgets/widgets.dart';
import '../../../dashboard/presentation/bloc/my_classes/my_classes_bloc.dart';
import '../../../profile_user/presentation/widgets/modal_case.dart';
import '../../data/models/class_model.dart';
import '../bloc/add_class_bloc/add_class_bloc.dart';
import '../bloc/delete_class/delete_class_bloc.dart';
import '../bloc/fetch_subject/fetch_subject_bloc.dart';
import '../widgets/widgets.dart';

part './add_subject.dart';
part './subject_screen.dart';
