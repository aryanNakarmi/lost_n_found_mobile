import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive/hive.dart';
import 'package:lost_n_found/core/constants/hive_table_constant.dart';
import 'package:lost_n_found/features/batch/data/models/batch_hive_model.dart';
import 'package:lost_n_found/features/batch/data/models/category_hive_model.dart';
import 'package:path_provider/path_provider.dart';


final hiveServiceProvider = Provider<HiveService>((ref){
  return HiveService();
});

class HiveService {
  //Initial Hive
  Future <void> init() async{
    final directory = await getApplicationDocumentsDirectory();
    final path = '${directory.path}/${HiveTableConstant.dbName}';
    
     Hive.init(path);
    _registerAdapters();
    await _openBoxes();
  }


Future<void> insertDummyBatches() async{
  final box =await Hive.openBox<BatchHiveModel>(
    HiveTableConstant.batchTable
  );
  final dummyBatches = [
    BatchHiveModel(batchName: '35-A'),
    BatchHiveModel(batchName: '35-B'),
    BatchHiveModel(batchName: '35-C'),
    BatchHiveModel(batchName: '35-D'),
    BatchHiveModel(batchName: '35-E'),
  ];
}
  //Register all type adapters
  void _registerAdapters(){
    if(!Hive.isAdapterRegistered(HiveTableConstant.batchTypeId)){
      Hive.registerAdapter(BatchHiveModelAdapter());
    }
  }

  //Open all boxes
  Future<void> _openBoxes() async {
    await Hive.openBox<BatchHiveModel>(HiveTableConstant.batchTable);
  }

  //Delete all batches
  Future<void> deleteAllBatches() async{
    await _batchBox.clear();
  }

  //Close all boxes
  Future<void> close() async{
    await Hive.close();
  }

  //==========Batch CRUD Operation=============//

  //get batch box
  Box<BatchHiveModel> get _batchBox=>
  Hive.box<BatchHiveModel>(HiveTableConstant.batchTable);
  
  //create a new Batch
  Future<BatchHiveModel> createBatch(BatchHiveModel batch) async {
    await _batchBox.put(batch.batchId, batch);
    return batch;
  }

  //Get all batches
  List<BatchHiveModel> getAllBatches(){
    return _batchBox.values.toList();
  }
  
  //get batch by id
  BatchHiveModel?getBatchbyId(String batchId){
    return _batchBox.get(batchId);
  }
  
  // Update a batch
  Future<void> updateBatch(BatchHiveModel batch) async {
    await _batchBox.put(batch.batchId, batch);
  }

  // Delete a batch
  Future<void> deleteBatch(String batchId) async {
    await _batchBox.delete(batchId);
  }



  //==========Category CRUD Operation=============//

  //get category box
  Box<CategoryHiveModel> get _categoryBox=>
  Hive.box<CategoryHiveModel>(HiveTableConstant.categoryTable);
  
  //create a new category
  Future<CategoryHiveModel> createCategory(CategoryHiveModel category) async {
    await _categoryBox.put(category.categoryId, category);
    return category;
  }

  //Get all batches
  List<CategoryHiveModel> getAllCategories(){
    return _categoryBox.values.toList();
  }
  
  //get batch by id
  CategoryHiveModel?getCategoryById(String categoryId){
    return _categoryBox.get(categoryId);
  }
  
  // Update a batch
  Future<void> updateCategory(CategoryHiveModel category) async {
    await _categoryBox.put(category.categoryId, category);
  }

  // Delete a batch
  Future<void> deleteCategory(String categoryId) async {
    await _categoryBox.delete(categoryId);
  }
}