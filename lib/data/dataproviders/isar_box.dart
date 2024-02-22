import 'package:fluttertutorial2/data/models/cat/cat.dart';
import 'package:isar/isar.dart';
import 'package:path_provider/path_provider.dart';

class IsarBox {
  // Singleton
  IsarBox._privateConstructor();
  static final IsarBox instance = IsarBox._privateConstructor();

  static Isar? _database;
  Future<Isar> get database async => _database ??= await init();

  static Future<Isar> init() async {
    final dir = await getApplicationDocumentsDirectory();

    return await Isar.open(
      [CatSchema],
      directory: dir.path,
    );
  }

  // insert & update
  Future<int> addCat(Cat cat) async {
    Isar box = await instance.database;
    return await box.cats.put(cat);
  }

  // get all
  Future<IsarCollection> getCats() async {
    Isar box = await instance.database;
    return box.cats;
  }

  // get by id
  Future<Cat?> getCat(int id) async {
    Isar box = await instance.database;
    return await box.cats.get(id);
  }
}
