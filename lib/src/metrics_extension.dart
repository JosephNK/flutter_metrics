part of flutter_metrics;

extension BuildContextExtension on BuildContext {
  Metric get metric {
    final provider = MetricsApp.of(this);
    if (provider != null) {
      return provider.metric;
    }
    return const Metric(1.0);
  }

  Future<void> setMetric(Metric metric) async {
    final provider = MetricsApp.of(this);
    assert(provider != null, 'MetricsProvider is null');
    if (provider != null) {
      provider.setMetric(metric);
    }
  }
}
