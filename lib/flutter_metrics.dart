library flutter_metrics;

import 'package:flutter/cupertino.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'src/metric.dart';
part 'src/metrics_app.dart';
part 'src/metrics_controller.dart';
part 'src/metrics_extension.dart';
part 'src/metrics_provider.dart';

const kMetricsKey = 'METRICS_VALUE';
const kDefaultMetricsValue = 1.0;
