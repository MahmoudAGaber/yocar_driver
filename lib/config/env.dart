import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter_common/config/constants.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

class Env {
  static final String serverUrl = dotenv.maybeGet('BASE_URL') ?? "http://ec2-13-48-192-175.eu-north-1.compute.amazonaws.com:4002/";
  static final String gqlEndpoint = '${serverUrl}graphql';
  static bool isDemoMode = dotenv.maybeGet('DEMO_MODE') == 'true';
}
