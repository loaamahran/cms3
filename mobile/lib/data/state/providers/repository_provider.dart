import 'package:cms_final/data/repositories/repository.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart';

final repositoryProvider = Provider(
  (ref) => Repository(Client()),
);
