class DeleteBatchUsecaseParams extends Equatable {
  final String batchId;

  const DeleteBatchUsecaseParams({required this.batchId});

  @override
  List<Object?> get props => [batchId];
}

class DeleteBatchUsecase implements