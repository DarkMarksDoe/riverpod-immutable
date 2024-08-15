import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:lorem_gen/lorem_gen.dart';
import 'package:riverpod_inmutable/app/detail/counter/counter_widget.dart';
import 'package:riverpod_inmutable/app/detail/detail_controller.dart';
import 'package:riverpod_inmutable/routes/app_routes.dart';

class DetailPage extends ConsumerStatefulWidget {
  const DetailPage({required this.entity, super.key});

  final DetailEntity entity;

  @override
  ConsumerState createState() => _DetailPageState();
}

class _DetailPageState extends ConsumerState<DetailPage> {
  @override
  void initState() {
    super.initState();
    // Initialize the controller for the given entity id.
    ref.read(detailControllerProvider(widget.entity).notifier).getEntityById();
  }

  @override
  Widget build(BuildContext context) {
    // Watch the specific controller instance tied to this entity id.
    final state = ref.watch(detailControllerProvider(widget.entity));
    final controller =
        ref.read(detailControllerProvider(widget.entity).notifier);

    print('State with id ${widget.entity.id}: $state');

    return state.when(
      loading: () => const Material(
        child: Center(child: CircularProgressIndicator()),
      ),
      data: (entity) => Detail(entity: entity),
      error: (message) => Material(
        child: Center(
          child: TextButton(
            onPressed: () => controller.getEntityById(),
            child: const Text('Error try again'),
          ),
        ),
      ),
    );
  }
}

class Detail extends ConsumerWidget {
  const Detail({required this.entity, super.key});

  final DetailEntity entity;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final Random r = Random();

    return Scaffold(
      appBar: AppBar(
        title: Text(entity.name),
      ),
      body: DefaultTabController(
        length: entity.tabs.length,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            SizedBox(
              height: 300,
              child: Center(
                child: Column(
                  children: [
                    const Text('Detail'),
                    const SizedBox(height: 16),
                    const CounterWidget(),
                    TextButton(
                      onPressed: () {
                        final newIntId = r.nextInt(2000);
                        final numberOfTabs = r.nextInt(9);

                        context.push(
                          AppRoutes.detail,
                          extra: DetailEntity(
                            newIntId,
                            Lorem.word(numWords: 1),
                            List.generate(
                              numberOfTabs,
                              (index) => DetailTab(
                                id: index,
                                name: Lorem.word(numWords: 1),
                              ),
                            ),
                          ),
                        );
                      },
                      child: const Text('Go to Another Detail Page'),
                    )
                  ],
                ),
              ),
            ),
            TabBar(
              tabs: entity.tabs
                  .map(
                    (tab) => Tab(
                      text: tab.name,
                    ),
                  )
                  .toList(),
            ),
            Flexible(
              child: TabBarView(
                children: entity.tabs
                    .map(
                      (DetailTab tab) => TabContent(tab: tab),
                    )
                    .toList(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class TabContent extends ConsumerWidget {
  const TabContent({required this.tab, super.key});

  final DetailTab tab;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Center(
      child: Text(tab.name),
    );
  }
}
