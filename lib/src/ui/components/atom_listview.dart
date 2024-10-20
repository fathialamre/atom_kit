import 'package:atom_kit/atom_kit.dart';
import 'package:atom_kit/src/ui/placeholders/atom_empty_list.dart';
import 'package:atom_kit/src/ui/placeholders/atom_error_list.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DataListview<T extends DataController, R> extends StatelessWidget {
  final T controller;
  final Widget? emptyList;
  final Widget? loading;
  final bool canRefresh;
  final Widget Function(
    BuildContext context,
    int index,
    R item,
  ) itemBuilder;

  const DataListview.data({
    super.key,
    required this.controller,
    required this.itemBuilder,
    this.emptyList,
    this.loading,
    this.canRefresh = true,
  });

  @override
  Widget build(BuildContext context) {
    return controller.obx(
      (state) {
        List<R> data = state as List<R>;
        ListView list = ListView.builder(
          itemCount: data.length,
          itemBuilder: (context, index) {
            return itemBuilder(context, index, data[index]);
          },
        );
        return canRefresh
            ? RefreshIndicator(
                onRefresh: controller.getData,
                child: list,
              )
            : list;
      },
      onError: (error) {
        return AtomErrorList(
          message: error,
          onRetry: () {
            controller.getData();
          },
        );
      },
      onEmpty: emptyList ??
          AtomEmptyList(
            onRetry: () {
              controller.getData();
            },
          ),
      onLoading: loading ??
          const Center(
            child: CircularProgressIndicator(),
          ),
    );
  }
}
