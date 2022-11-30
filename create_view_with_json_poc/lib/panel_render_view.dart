import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:json_dynamic_widget/json_dynamic_widget.dart';
import 'package:widget_rx/widget_rx.dart';

import 'get_it_config.dart';
import 'view_model.dart';

class PanelRenderView extends StatefulWidget {
  const PanelRenderView({Key? key}) : super(key: key);

  @override
  State<PanelRenderView> createState() => _PanelRenderViewState();
}

class _PanelRenderViewState extends State<PanelRenderView> {
  Map<dynamic, dynamic> mapData = {};
  var registry = JsonWidgetRegistry.instance;

  @override
  Widget build(BuildContext context) {
    final ViewModel viewModel = getIt.get<ViewModel>();

    return Wrx<String, void>(
      stream: viewModel.subject.stream,
      onSuccess: (value) {
        var widget = JsonWidgetData.fromDynamic(value, registry: registry);
        return widget!.build(context: context);
      },
    );
  }

  Future<Map> readJson() async {
    final String response = await rootBundle.loadString('assets/sample.json');
    final data = await json.decode(response);
    return data;
  }
}
