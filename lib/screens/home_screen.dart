import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/book_provider.dart';
import 'list_screen.dart';
import 'dashboard_screen.dart';
import 'form_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("แอปบันทึกการอ่านหนังสือ"),
        backgroundColor: const Color.fromARGB(255, 0, 107, 153),
        foregroundColor: Colors.white,
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    decoration: const InputDecoration(
                      hintText: "ค้นหาชื่อหนังสือ...",
                      prefixIcon: Icon(Icons.search),
                      border: OutlineInputBorder(),
                    ),
                    onChanged: (v) => context.read<BookProvider>().setSearch(v),
                  ),
                ),
                const SizedBox(width: 8),
                DropdownButton<String>(
                  value: context.watch<BookProvider>().filterStatus,
                  items: ["ทั้งหมด", "กำลังอ่าน", "อ่านจบแล้ว", "ยังไม่อ่าน"]
                      .map((s) => DropdownMenuItem(value: s, child: Text(s))).toList(),
                  onChanged: (v) => context.read<BookProvider>().setFilter(v!),
                ),
              ],
            ),
          ),
          Expanded(child: _selectedIndex == 0 ? const ListScreen() : const DashboardScreen()),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: (index) => setState(() => _selectedIndex = index),
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.list_alt), label: "รายการ"),
          BottomNavigationBarItem(icon: Icon(Icons.dashboard), label: "สรุปผล"),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (c) => const FormScreen())),
        child: const Icon(Icons.add),
      ),
    );
  }
}