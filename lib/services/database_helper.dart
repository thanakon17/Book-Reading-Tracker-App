import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import '../models/book.dart';

class DatabaseHelper {
  static final DatabaseHelper instance = DatabaseHelper._init();
  static Database? _database;
  DatabaseHelper._init();

  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initDB('book_tracker_exam.db');
    return _database!;
  }

  Future<Database> _initDB(String filePath) async {
    final dbPath = await getDatabasesPath();
    final path = join(dbPath, filePath);
    return await openDatabase(path, version: 1, onCreate: _createDB);
  }

  Future _createDB(Database db, int version) async {
    await db.execute('''
      CREATE TABLE books (
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        title TEXT NOT NULL,
        author TEXT,
        category TEXT,
        pages INTEGER,
        status TEXT,
        startDate TEXT
      )
    ''');
    // ตารางที่ 2 สำหรับหมวดหมู่ (ข้อ 1.3)
    await db.execute('CREATE TABLE categories (id INTEGER PRIMARY KEY AUTOINCREMENT, name TEXT)');
    for (var cat in ["นิยาย", "วิชาการ", "การ์ตูน", "พัฒนาตนเอง"]) {
      await db.insert('categories', {'name': cat});
    }
  }

  Future<List<String>> getCategories() async {
    final db = await database;
    final res = await db.query('categories');
    return res.map((e) => e['name'] as String).toList();
  }

  Future<int> insert(Book book) async => (await database).insert('books', book.toMap());
  Future<List<Book>> fetchAll() async {
    final db = await database;
    final res = await db.query('books', orderBy: 'id DESC');
    return res.map((json) => Book.fromMap(json)).toList();
  }
  Future<int> update(Book book) async => (await database).update('books', book.toMap(), where: 'id = ?', whereArgs: [book.id]);
  Future<int> delete(int id) async => (await database).delete('books', where: 'id = ?', whereArgs: [id]);
}