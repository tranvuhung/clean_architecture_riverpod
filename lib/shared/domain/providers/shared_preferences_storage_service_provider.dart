import 'package:clean_architecture_riverpod/shared/data/local/shared_prefs_storage_service.dart';
import 'package:clean_architecture_riverpod/shared/data/local/storage_service.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final storageServiceProvider = Provider<StorageService>((ref) {
  final SharedPrefsService prefsService = SharedPrefsService();
  prefsService.init();
  return prefsService;
});
