library com.curi.app.auth.pages;

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart' hide Colors;
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get_utils/src/extensions/internacionalization.dart';
import 'package:get/route_manager.dart';

import '../../../../core/ui/colors_brand.dart';
import '../../../../core/ui/layout.dart';
import '../../../../core/ui/spacing.dart';
import '../../../../core/ui/typography.dart';
import '../../../../injection_container.dart';
import '../../../common_widgets/widgets.dart';
import '../bloc/forgot_password_bloc/forgot_password_bloc.dart';
import '../bloc/login_bloc/login_bloc.dart';
import '../bloc/register_bloc/register_bloc.dart';
import '../widgets/widgets.dart';

part './forgot_password.dart';
part './login.dart';
part './register.dart';
