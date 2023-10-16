// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:e_commerce_app/core/error/failure/failure.dart';
import 'package:e_commerce_app/core/shared/app_widget_state_builder.dart';
import 'package:e_commerce_app/core/shared/enum/widget_type.dart';
import 'package:e_commerce_app/core/utils/base_controller.dart';
import 'package:e_commerce_app/core/utils/ui_state.dart';

class ConsumerAppWidgetStateBuilder<T extends BaseController, K> extends StatelessWidget {
  ConsumerAppWidgetStateBuilder._({
    super.key,
    required this.builder,
    required this.response,
    this.idleWidget,
    this.loadingWidget,
    this.errorWidget,
    required WidgetType widgetType,
  }) {
    _type = widgetType;
  }

  final Widget Function(K) builder;
  final UIState<K> Function(T) response;
  final Widget? idleWidget;
  final Widget? loadingWidget;
  Widget Function(Failure)? errorWidget;

  late final WidgetType _type;

  factory ConsumerAppWidgetStateBuilder.none({
    required Widget Function(K) builder,
    required UIState<K> Function(T) response,
    Widget? idleWidget,
    Widget? loadingWidget,
    Widget Function(Failure)? errorWidget,
  }) {
    return ConsumerAppWidgetStateBuilder._(
      builder: builder,
      idleWidget: idleWidget,
      loadingWidget: loadingWidget,
      errorWidget: errorWidget,
      response: response,
      widgetType: WidgetType.none,
    );
  }

  factory ConsumerAppWidgetStateBuilder.sliver({
    required Widget Function(K) builder,
    required UIState<K> Function(T) response,
    Widget? idleWidget,
    Widget? loadingWidget,
    Widget Function(Failure)? errorWidget,
  }) {
    return ConsumerAppWidgetStateBuilder._(
      builder: builder,
      idleWidget: idleWidget,
      loadingWidget: loadingWidget,
      errorWidget: errorWidget,
      response: response,
      widgetType: WidgetType.sliver,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<T>(
      builder: (context, T provider, child) {
        switch (_type) {
          case WidgetType.none:
            return AppWidgetBuilderByState<K>.none(
              errorWidget: errorWidget,
              idleWidget: idleWidget,
              loadingWidget: loadingWidget,
              response: response(provider),
              builder: builder,
            );
          case WidgetType.sliver:
            return AppWidgetBuilderByState<K>.sliver(
              errorWidget: errorWidget,
              idleWidget: idleWidget,
              loadingWidget: loadingWidget,
              response: response(provider),
              builder: builder,
            );
        }
      },
    );
  }
}
