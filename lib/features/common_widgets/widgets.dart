library com.curi.app.commonwidgets.widgets;

import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart' hide Colors;
import 'package:flutter/services.dart';

import '../../core/ui/colors_brand.dart';
import '../../core/ui/constants.dart';
import '../../core/ui/decorators.dart';
import '../../core/ui/typography.dart';

part './input.dart';
part './sunset_button.dart';

enum TextInputFormatterType { none, custom, money, creditCart, phone }
