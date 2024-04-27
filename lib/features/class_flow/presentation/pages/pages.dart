library com.curi.app.classflow.pages;

import 'package:flutter/material.dart' hide Colors;
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';

import '../../../../core/ui/colors_brand.dart';
import '../../../../core/ui/layout.dart';
import '../../../chats/presentation/pages/pages.dart';
import '../../../classes_list/data/models/class_model.dart';
import '../../../classes_list/presentation/widgets/widgets.dart';
import '../../../common_widgets/widgets.dart';
import '../../data/models/tutor_model.dart';
import '../bloc/class_dashboard/class_dashboard_bloc.dart';
import '../bloc/fav_tutors/fav_tutors_bloc.dart';
import '../widgets/widgets.dart';

part './class_dashboard.dart';
part './chat_with_tutor.dart';
part './find_tutors.dart';
