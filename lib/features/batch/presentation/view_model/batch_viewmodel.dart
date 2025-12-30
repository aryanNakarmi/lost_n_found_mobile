import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lost_n_found/features/batch/domain/usecases/create_batch_usecase.dart';
import 'package:lost_n_found/features/batch/domain/usecases/delete_batch_usecase.dart';
import 'package:lost_n_found/features/batch/domain/usecases/get_batch_by_id_usecase.dart';
import 'package:lost_n_found/features/batch/presentation/state/batch_state.dart';

class BatchViewmodel extends Notifier<BatchState>{
  late final GetBatchByIdUsecase _getBatchByIdUsecase;
  late final CreateBatchUsecase _createBatchUsecase;
  late final DeleteBatchUsecase _deleteBatchUsecase;
  late final 
  @override
  BatchState build() {
    // TODO: implement build
    throw UnimplementedError();
  }
  
}