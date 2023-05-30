import 'package:cms_final/data/state/notifiers/courses_state_notifier.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final courseProvider = StateNotifierProvider(
  (_) => CoursesStateNotifier(),
);
