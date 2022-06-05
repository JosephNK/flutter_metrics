part of flutter_metrics;

extension BuildContextExtension on BuildContext {
  Metric get metric => MetricsApp.of(this)!.metric;

  Future<void> setMetric(Metric metric) =>
      MetricsApp.of(this)!.setMetric(metric);
}
