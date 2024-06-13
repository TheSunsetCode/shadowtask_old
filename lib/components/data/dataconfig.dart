library dataConfig;

import 'dart:io';
import 'dart:convert';

import 'package:shadowtask/screens/register/registerv2.dart';

class DataConfig extends registerv2 {
  final jsondata = '{}';
  final File file = File('lib/components/data/config.json');
}
