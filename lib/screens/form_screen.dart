import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:intl/intl.dart'; // อย่าลืมเพิ่ม intl ใน pubspec.yaml เพื่อจัดการรูปแบบวันที่
import '../models/book.dart';
import '../providers/book_provider.dart';

class FormScreen extends StatefulWidget {
  final Book? book;
  const FormScreen({super.key, this.book});

  @override
  State<FormScreen> createState() => _FormScreenState();
}

class _FormScreenState extends State<FormScreen> {
  final _formKey = GlobalKey<FormState>();
  late TextEditingController _title, _author, _pages;
  String _cat = "นิยาย", _st = "กำลังอ่าน";
  DateTime _selectedDate = DateTime.now(); // ตัวแปรเก็บวันที่เลือก

  @override
  void initState() {
    super.initState();
    _title = TextEditingController(text: widget.book?.title ?? "");
    _author = TextEditingController(text: widget.book?.author ?? "");
    _pages = TextEditingController(text: widget.book?.pages.toString() ?? "");
    _cat = widget.book?.category ?? "นิยาย";
    _st = widget.book?.status ?? "กำลังอ่าน";
    
    // ถ้าเป็นการแก้ไข ให้ดึงวันที่เดิมมาแสดง
    if (widget.book != null && widget.book!.startDate.isNotEmpty) {
      _selectedDate = DateTime.parse(widget.book!.startDate);
    }
  }

  // ฟังก์ชันแสดงตัวเลือกวันที่
  Future<void> _pickDate() async {
    DateTime? picked = await showDatePicker(
      context: context,
      initialDate: _selectedDate,
      firstDate: DateTime(2000),
      lastDate: DateTime(2100),
    );
    if (picked != null) {
      setState(() => _selectedDate = picked);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(widget.book == null ? "เพิ่มข้อมูล" : "แก้ไขข้อมูล")),
      body: Form(
        key: _formKey,
        child: ListView(
          padding: const EdgeInsets.all(16),
          children: [
            TextFormField(controller: _title, decoration: const InputDecoration(labelText: "ชื่อหนังสือ *"), validator: (v) => v!.isEmpty ? "ห้ามว่าง" : null),
            const SizedBox(height: 10),
            TextFormField(controller: _author, decoration: const InputDecoration(labelText: "ผู้แต่ง")),
            const SizedBox(height: 10),
            
            // ส่วนแสดงและเลือกวันที่
            ListTile(
              contentPadding: EdgeInsets.zero,
              title: Text("วันที่เริ่มอ่าน: ${DateFormat('dd/MM/yyyy').format(_selectedDate)}"),
              trailing: const Icon(Icons.calendar_today, color: Colors.indigo),
              onTap: _pickDate, // กดที่แถวเพื่อเลือกวันที่
            ),
            const Divider(),
            
            DropdownButtonFormField<String>(
              value: _cat,
              items: ["นิยาย", "วิชาการ", "การ์ตูน", "พัฒนาตนเอง"].map((s) => DropdownMenuItem(value: s, child: Text(s))).toList(),
              onChanged: (v) => _cat = v!,
              decoration: const InputDecoration(labelText: "หมวดหมู่"),
            ),
            const SizedBox(height: 10),
            TextFormField(controller: _pages, decoration: const InputDecoration(labelText: "จำนวนหน้า"), keyboardType: TextInputType.number),
            const SizedBox(height: 10),
            DropdownButtonFormField<String>(
              value: _st,
              items: ["กำลังอ่าน", "อ่านจบแล้ว", "ยังไม่อ่าน"].map((s) => DropdownMenuItem(value: s, child: Text(s))).toList(),
              onChanged: (v) => _st = v!,
              decoration: const InputDecoration(labelText: "สถานะการอ่าน"),
            ),
            const SizedBox(height: 30),
            ElevatedButton(
              style: ElevatedButton.styleFrom(minimumSize: const Size(double.infinity, 50), backgroundColor: Colors.indigo, foregroundColor: Colors.white),
              onPressed: () {
                if (_formKey.currentState!.validate()) {
                  final b = Book(
                    id: widget.book?.id,
                    title: _title.text,
                    author: _author.text,
                    category: _cat,
                    pages: int.tryParse(_pages.text) ?? 0,
                    status: _st,
                    startDate: _selectedDate.toIso8601String(), // บันทึกเป็น ISO String
                  );
                  
                  if (widget.book == null) {
                    context.read<BookProvider>().addBook(b);
                  } else {
                    context.read<BookProvider>().updateBook(b);
                  }
                  Navigator.pop(context);
                }
              },
              child: const Text("บันทึกข้อมูล"),
            ),
          ],
        ),
      ),
    );
  }
}