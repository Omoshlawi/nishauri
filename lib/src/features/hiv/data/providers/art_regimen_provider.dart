import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:nishauri/src/features/auth/data/providers/auth_provider.dart';
import 'package:nishauri/src/features/hiv/data/models/regimen/art_regimen.dart';
import 'package:nishauri/src/features/hiv/data/repositories/art_regimen_repository.dart';
import 'package:nishauri/src/features/hiv/data/services/art_regimen_service.dart';

final art_regimen_provider = FutureProvider<List<ARTRegimen>>((ref) async {
  final service = ARTRegimenService();
  final repository = ARTRegimenRepository(service);
  return await repository.getUserRegimenHistory();
});
