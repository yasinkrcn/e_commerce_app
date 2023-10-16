// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:e_commerce_app/core/error/failure/failure.dart';
import 'package:e_commerce_app/core/shared/app_widget_state_builder.dart';
import 'package:e_commerce_app/core/shared/enum/widget_type.dart';
import 'package:e_commerce_app/core/utils/base_controller.dart';
import 'package:e_commerce_app/core/utils/ui_state.dart';

class SelectorAppWidgetStateBuilder<T extends BaseController, K> extends StatelessWidget {
  SelectorAppWidgetStateBuilder._({
    super.key,
    required this.selector,
    required this.builder,
    this.idleWidget,
    this.loadingWidget,
    this.errorWidget,
    required WidgetType widgetType,
  }) {
    _type = widgetType;
  }

  final Widget Function(K) builder;
  final UIState<K> Function(BuildContext, T) selector;
  final Widget? idleWidget;
  final Widget? loadingWidget;
  Widget Function(Failure)? errorWidget;
  late final WidgetType _type;

  factory SelectorAppWidgetStateBuilder.none({
    required Widget Function(K) builder,
    required UIState<K> Function(BuildContext, T) selector,
    Widget? idleWidget,
    Widget? loadingWidget,
    Widget Function(Failure)? errorWidget,
  }) {
    return SelectorAppWidgetStateBuilder._(
      builder: builder,
      selector: selector,
      idleWidget: idleWidget,
      loadingWidget: loadingWidget,
      errorWidget: errorWidget,
      widgetType: WidgetType.none,
    );
  }

  factory SelectorAppWidgetStateBuilder.sliver({
    required Widget Function(K) builder,
    required UIState<K> Function(BuildContext, T) selector,
    Widget? idleWidget,
    Widget? loadingWidget,
    Widget Function(Failure)? errorWidget,
  }) {
    return SelectorAppWidgetStateBuilder._(
      builder: builder,
      selector: selector,
      idleWidget: idleWidget,
      loadingWidget: loadingWidget,
      errorWidget: errorWidget,
      widgetType: WidgetType.sliver,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Selector<T, UIState<K>>(
      selector: selector,
      builder: (context, UIState<K> response, child) {
        switch (_type) {
          case WidgetType.none:
            return AppWidgetBuilderByState<K>.none(
              errorWidget: errorWidget,
              idleWidget: idleWidget,
              loadingWidget: loadingWidget,
              response: response,
              builder: builder,
            );
          case WidgetType.sliver:
            return AppWidgetBuilderByState<K>.sliver(
              errorWidget: errorWidget,
              idleWidget: idleWidget,
              loadingWidget: loadingWidget,
              response: response,
              builder: builder,
            );
        }
      },
    );
  }
}
