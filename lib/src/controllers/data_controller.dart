import 'package:atom_kit/atom_kit.dart';
import 'package:dartz/dartz.dart';
import 'package:get/get.dart';

class DataController<T> extends GetxController with StateMixin<T> {
  final Future<Either<ResponseFailure, T>> Function() fetchData;

  DataController({required this.fetchData});

  @override
  void onInit() {
    super.onInit();
    getData();
  }

  Future<void> getData() async {
    change(null, status: RxStatus.loading());
    (await fetchData()).fold(
      (failure) {
        change(null, status: RxStatus.error(failure.message));
      },
      (data) => change(
        data,
        status: RxStatus.success(),
      ),
    );
  }
}
