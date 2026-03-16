import 'package:flutter/material.dart';
import '../models/book.dart';
import '../services/database_helper.dart';

class BookProvider with ChangeNotifier {
  List<Book> _books = [];
  List<String> _categories = [];
  String _searchQuery = "";
  String _filterStatus = "ทั้งหมด";

  List<Book> get books => _books.where((b) {
    final matchSearch = b.title.toLowerCase().contains(_searchQuery.toLowerCase());
    final matchFilter = _filterStatus == "ทั้งหมด" || b.status == _filterStatus;
    return matchSearch && matchFilter;
  }).toList();

  List<String> get categories => _categories;
  String get filterStatus => _filterStatus;

  Future<void> loadData() async {
    _books = await DatabaseHelper.instance.fetchAll();
    _categories = await DatabaseHelper.instance.getCategories();
    notifyListeners();
  }

  ThemeMode _themeMode = ThemeMode.light;

ThemeMode get themeMode => _themeMode;

void toggleTheme() {
  _themeMode = _themeMode == ThemeMode.light ? ThemeMode.dark : ThemeMode.light;
  notifyListeners(); // ทำให้ทั้งแอปเปลี่ยนสีตาม
}

  void setSearch(String q) { _searchQuery = q; notifyListeners(); }
  void setFilter(String s) { _filterStatus = s; notifyListeners(); }

  Future<void> addBook(Book b) async { await DatabaseHelper.instance.insert(b); await loadData(); }
  Future<void> updateBook(Book b) async { await DatabaseHelper.instance.update(b); await loadData(); }
  Future<void> deleteBook(int id) async { await DatabaseHelper.instance.delete(id); await loadData(); }

  int get total => _books.length;
  int get reading => _books.where((b) => b.status == "กำลังอ่าน").length;
  int get finished => _books.where((b) => b.status == "อ่านจบแล้ว").length;
}