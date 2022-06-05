part of flutter_metrics;

class MetricsApp extends StatefulWidget {
  final Widget child;
  final List<Metric> metrics;
  final Metric? defaultMetric;

  MetricsApp({
    Key? key,
    required this.child,
    required this.metrics,
    this.defaultMetric,
  })  : assert(metrics.isNotEmpty),
        super(key: key) {
    // MetricsApp Init
  }

  static MetricsProvider? of(BuildContext context) =>
      MetricsProvider.of(context);

  static Future<void> ensureInitialized() async =>
      MetricsController.ensureMetrics();

  @override
  State<MetricsApp> createState() => _MetricsAppState();
}

class _MetricsAppState extends State<MetricsApp> {
  late MetricsController _metricsController;

  @override
  void initState() {
    super.initState();

    _metricsController = MetricsController(
      metrics: widget.metrics,
      defaultMetric: widget.defaultMetric,
    );
    _metricsController.addListener(() {
      if (mounted) {
        setState(() {});
      }
    });
  }

  @override
  void dispose() {
    _metricsController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MetricsProvider(widget, _metricsController);
  }
}
