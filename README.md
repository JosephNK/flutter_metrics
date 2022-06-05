# Flutter Metrics

[![pub](https://img.shields.io/pub/v/flutter_metrics.svg?style=flat)](https://pub.dev/packages/flutter_metrics)

This plugin is a plugin that applies the text size using the TextScaleFactor value.

## How to use

First, wrap it with a `MetricsApp` widget.

```dart
void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await MetricsApp.ensureInitialized();

  runApp(
    MetricsApp(
      child: const MyApp(),
      defaultMetric: const Metric(1.0),
      metrics: const [
        Metric(0.5),
        Metric(1.0),
        Metric(2.0),
      ],
    ),
  );
}
```

### Change Metric Value 

How to update metric values

Whenever the Metric value changes, we store it in SharedPreferences. Therefore, when the application is newly started, the saved value is read and applied.

```dart
context.setMetric(const Metric(0.5));
```

### Apply Metric Value

How to apply metric values

```dart
Text(
  'Lorem Ipsum is simply dummy text of the printing...',
  textScaleFactor: context.metric.value,
),
```

## Example

See [example/lib/main.dart](https://github.com/JosephNK/flutter_metrics/blob/main/example/lib/main.dart) for details.
