import 'package:e_commerce_app/core/_core_exports.dart';

class AppWidgetBuilderByState<T> extends StatelessWidget {
  AppWidgetBuilderByState._({
    super.key,
    required this.response,
    required this.builder,
    this.idleWidget,
    this.loadingWidget,
    this.errorWidget,
    required WidgetType widgetType,
  }) {
    _type = widgetType;
  }

  final UIState<T> response;
  final Widget Function(T) builder;
  final Widget? idleWidget;
  final Widget? loadingWidget;
  final Widget Function(Failure)? errorWidget;
  late final WidgetType _type;

  factory AppWidgetBuilderByState.none({
    required UIState<T> response,
    required Widget Function(T) builder,
    Widget? idleWidget,
    Widget? loadingWidget,
    Widget Function(Failure)? errorWidget,
  }) {
    return AppWidgetBuilderByState._(
      response: response,
      builder: builder,
      idleWidget: idleWidget,
      loadingWidget: loadingWidget,
      errorWidget: errorWidget,
      widgetType: WidgetType.none,
    );
  }

  factory AppWidgetBuilderByState.sliver({
    required UIState<T> response,
    required Widget Function(T) builder,
    Widget? idleWidget,
    Widget? loadingWidget,
    Widget Function(Failure)? errorWidget,
  }) {
    return AppWidgetBuilderByState._(
      response: response,
      builder: builder,
      idleWidget: idleWidget,
      loadingWidget: loadingWidget,
      errorWidget: errorWidget,
      widgetType: WidgetType.sliver,
    );
  }
  @override
  Widget build(BuildContext context) {
    switch (_type) {
      case WidgetType.none:
        switch (response.status) {
          case UIStateStatus.idle:
            return idleWidget ?? const SizedBox.shrink();
          case UIStateStatus.loading:
            return Center(child: loadingWidget ?? const CircularProgressIndicator.adaptive());
          case UIStateStatus.success:
            return builder(response.data);
          case UIStateStatus.error:
            return errorWidget != null ? errorWidget!(response.failure) : AppText(response.failure.message);
        }

      case WidgetType.sliver:
        switch (response.status) {
          case UIStateStatus.idle:
            return (idleWidget ?? const SizedBox.shrink()).toSliver;
          case UIStateStatus.loading:
            return Center(child: (loadingWidget ?? const CircularProgressIndicator.adaptive()).toSliver);
          case UIStateStatus.success:
            return builder(response.data);
          case UIStateStatus.error:
            return errorWidget != null ? errorWidget!(response.failure) : AppText(response.failure.message);
        }
    }
  }
}
