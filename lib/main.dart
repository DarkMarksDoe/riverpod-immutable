import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_inmutable/app/app.dart';

main() {
  runApp(const ProviderScope(child: App()));
}
