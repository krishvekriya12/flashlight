import 'dart:async';

import 'package:flashlight/components/flash_light_app_bar.dart';
import 'package:flashlight/core/core.dart';
import 'package:flashlight/generated/assets.gen.dart';
import 'package:flashlight/resource/resource.dart';
import 'package:flashlight/ui/screen_light/screen_light.dart';
import 'package:flashlight/ui/setting/setting.dart';
import 'package:flashlight/ui/stroboscope/stroboscope.dart';
import 'package:flashlight/utils/common_button.dart';
import 'package:flashlight/utils/app_wake_lock.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:gap/gap.dart';
import 'package:provider/provider.dart';

part 'flash_light_sos_provider.dart';
part 'flash_light_sos_screen.dart';
