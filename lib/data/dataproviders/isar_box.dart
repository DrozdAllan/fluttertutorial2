import 'package:fluttertutorial2/data/models/cat/cat.dart';
import 'package:isar/isar.dart';
import 'package:path_provider/path_provider.dart';

class IsarBox {
  static Isar? _box;

  static Future<Isar> init() async {
    final dir = await getApplicationDocumentsDirectory();
    return _box = await Isar.open(
      [CatSchema],
      directory: dir.path,
    );
  }

  // insert & update
  static Future<int> addCat(Cat cat) async {
    return await _box!.writeTxn(() async {
      return await _box!.cats.put(cat);
    });
  }

  // get all
  static Future<List<Cat?>> getCats() async {
    return await _box!.cats.where().findAll();
  }

  // get 1 by id
  static Future<Cat?> getCat(int id) async {
    return await _box!.cats.get(id);
  }

  // delete
  static Future<bool> deleteCat(int id) async {
    return await _box!.writeTxn(() async => await _box!.cats.delete(id));
  }
}
