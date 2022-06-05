part of flutter_metrics;

class MetricsController extends ChangeNotifier {
  static Metric? _storeMetric;

  late Metric _metric;

  MetricsController({
    required List<Metric> metrics,
    Metric? defaultMetric,
  }) : assert(metrics.isNotEmpty) {
    /// MetricsController Init

    // Default Metric
    if (defaultMetric != null) {
      _metric = defaultMetric;
    } else {
      _metric = metrics[0];
    }

    // Set from Preference Metric Value
    if (_storeMetric != null) {
      _metric = _storeMetric!;
    }
  }

  Metric get metric => _metric;

  static Future<void> ensureMetrics() async {
    final value = await readMetricPreferences();
    _storeMetric = Metric(value);
  }

  Future<void> setMetric(Metric metric) async {
    await changeMetric(metric);
    await updateMetricPreferences(metric);
  }

  Future<void> changeMetric(Metric metric) async {
    _metric = metric;
    notifyListeners();
  }

  // CRUD

  static Future<void> createMetricPreferences() async {
    final pref = await SharedPreferences.getInstance();
    await pref.setDouble(kMetricsKey, kDefaultMetricsValue);
  }

  static Future<double> readMetricPreferences() async {
    final pref = await SharedPreferences.getInstance();
    return pref.getDouble(kMetricsKey) ?? kDefaultMetricsValue;
  }

  static Future<void> updateMetricPreferences(Metric metric) async {
    final pref = await SharedPreferences.getInstance();
    await pref.setDouble(kMetricsKey, metric.value);
  }

  static Future<void> deleteMetricPreferences() async {
    final pref = await SharedPreferences.getInstance();
    await pref.remove(kMetricsKey);
  }
}
