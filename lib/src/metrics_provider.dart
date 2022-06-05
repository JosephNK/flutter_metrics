part of flutter_metrics;

class MetricsProvider extends InheritedWidget {
  final MetricsApp app;
  final MetricsController controller;
  final Metric? controllerMetric;

  MetricsProvider(
    this.app,
    this.controller, {
    Key? key,
  })  : controllerMetric = controller.metric,
        super(key: key, child: app.child) {
    // MetricsProvider Init
  }

  /// Get Current Metric
  Metric get metric => controller.metric;

  /// Change App Metric
  Future<void> setMetric(Metric metric) async {
    // Check old metrics data
    if (metric != controller.metric) {
      await controller.setMetric(metric);
    }
  }

  static MetricsProvider? of(BuildContext context) =>
      context.dependOnInheritedWidgetOfExactType<MetricsProvider>();

  @override
  bool updateShouldNotify(MetricsProvider oldWidget) {
    final oldMetricValue =
        oldWidget.controllerMetric?.value ?? kDefaultMetricsValue;
    final currentMetricValue = metric.value;
    return oldMetricValue != currentMetricValue;
  }
}
