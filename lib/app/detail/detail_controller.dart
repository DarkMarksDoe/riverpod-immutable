import 'dart:math';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:lorem_gen/lorem_gen.dart';
part 'detail_controller.freezed.dart';

final detailControllerProvider = StateNotifierProvider.autoDispose
    .family<DetailController, DetailState, DetailEntity>(
  (ref, detail) => DetailController(
    entity: detail,
    repository: DetailRepository(),
  ),
);

class DetailController extends StateNotifier<DetailState> {
  DetailController({
    required this.entity,
    required DetailRepository repository,
  })  : _repository = repository,
        super(const DetailState.loading());

  final DetailRepository _repository;
  final DetailEntity entity;

  Future<void> getEntityById() async {
    state = const DetailState.loading();
    try {
      final apiEntity = await _repository.getDetailEntityById(entity.id, entity.tabs.length);
      state = DetailState.data(entity: apiEntity);
    } catch (e) {
      state = DetailState.error(message: 'Error: ${e.toString()}');
    }
  }
}

@freezed
class DetailState with _$DetailState {
  const factory DetailState.loading() = Loading;

  const factory DetailState.data({required DetailEntity entity}) = Data;

  const factory DetailState.error({required String message}) = Error;
}

class DetailDataSaver {

}

class DetailEntity {
  final int id;
  final String name;
  final List<DetailTab> tabs;

  DetailEntity(this.id, this.name, this.tabs);
}

class DetailTab {
  final String name;
  final int id;

  DetailTab({required this.name, required this.id});
}

class DetailRepository {
  Future<DetailEntity> getDetailEntityById(
    int id,
    int maxTabs,
  ) async {
    await Future.delayed(const Duration(seconds: 1));
    final Random r = Random();
    final int random = r.nextInt(10);

    final randomDetailEntities = _detailGeneratorRandom(maxTabs);

    if (random % 2 == 0) {
      return randomDetailEntities.first;
    } else {
      throw Exception('Error getting my entities');
    }
  }

  List<DetailEntity> _detailGeneratorRandom(int maxTabs) {
    return List.generate(
      5,
      (index) => DetailEntity(
        index,
        Lorem.word(numWords: 2),
        _tabGeneratorRandom(maxTabs),
      ),
    );
  }

  List<DetailTab> _tabGeneratorRandom(int max) {
    final Random r = Random();
    return List.generate(
      max,
      (index) => DetailTab(
        name: Lorem.word(numWords: 2),
        id: r.nextInt(10),
      ),
    );
  }
}
