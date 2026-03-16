import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:intl/intl.dart';
import '../models/book.dart';
import '../providers/book_provider.dart';
import 'form_screen.dart';

class DetailScreen extends StatelessWidget {
  final Book book;
  const DetailScreen({super.key, required this.book});

  @override
  Widget build(BuildContext context) {
    String formattedDate = book.startDate.isNotEmpty 
        ? DateFormat('dd/MM/yyyy').format(DateTime.parse(book.startDate)) 
        : "ไม่ได้ระบุ";

    return Scaffold(
      appBar: AppBar(
        title: const Text("รายละเอียด"),
        actions: [
          // ปุ่มแก้ไขแบบใสๆ
          IconButton(
            icon: const Icon(Icons.edit_outlined),
            onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (c) => FormScreen(book: book))),
          ),
          // ปุ่มลบแบบใสๆ
          IconButton(
            icon: const Icon(Icons.delete_outline, color: Colors.red),
            onPressed: () => _confirmDelete(context),
          ),
          const SizedBox(width: 8),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(book.title, style: const TextStyle(fontSize: 28, fontWeight: FontWeight.bold, color: Colors.indigo)),
            const SizedBox(height: 8),
            Text("${book.author} | ${book.category}", style: const TextStyle(fontSize: 16, color: Colors.grey)),
            const SizedBox(height: 24),
            const Divider(),
            const SizedBox(height: 24),
            // แสดงข้อมูลเป็นระเบียบ
            _infoItem(Icons.auto_stories, "จำนวนหน้า", "${book.pages} หน้า"),
            _infoItem(Icons.calendar_today, "วันที่เริ่มอ่าน", formattedDate),
            _infoItem(Icons.star_border, "สถานะ", book.status),
          ],
        ),
      ),
    );
  }

  Widget _infoItem(IconData icon, String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10.0),
      child: Row(
        children: [
          Icon(icon, size: 22, color: Colors.indigo.withOpacity(0.6)),
          const SizedBox(width: 12),
          Text("$label: ", style: const TextStyle(fontWeight: FontWeight.w500)),
          Text(value, style: const TextStyle(fontWeight: FontWeight.bold)),
        ],
      ),
    );
  }

  void _confirmDelete(BuildContext context) {
    showDialog(
      context: context,
      builder: (c) => AlertDialog(
        title: const Text("ยืนยันการลบ"),
        content: Text("คุณต้องการลบ '${book.title}' ใช่หรือไม่?"),
        actions: [
          TextButton(onPressed: () => Navigator.pop(c), child: const Text("ยกเลิก")),
          TextButton(onPressed: () {
            context.read<BookProvider>().deleteBook(book.id!);
            Navigator.pop(c); // ปิด Dialog
            Navigator.pop(context); // กลับหน้า List
          }, child: const Text("ลบ", style: TextStyle(color: Colors.red))),
        ],
      ),
    );
  }
}