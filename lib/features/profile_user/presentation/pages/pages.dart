library com.curi.app.profileuser.pages;

import 'dart:io';
import 'dart:typed_data';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart' hide Colors;
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

import '../../../../core/ui/colors_brand.dart';
import '../../../../core/ui/layout.dart';
import '../../../../core/ui/spacing.dart';
import '../../../common_widgets/widgets.dart';
import '../bloc/profile_bloc/profile_bloc.dart';
import '../widgets/image_interface.dart';
import '../widgets/select_image_modal.dart';

import '../../../classes_list/presentation/widgets/widgets.dart';
import '../../../auth/data/repositories/auth_repository_impl.dart';
import '../../../auth/data/repositories/users_repository_impl.dart';
import '../../../auth/domain/repositories/auth_repository.dart';

part './profile_user.dart';
