import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:intl/intl.dart'; // สำหรับจัดรูปแบบวันที่
import '../providers/book_provider.dart';
import 'detail_screen.dart';

class ListScreen extends StatelessWidget {
  const ListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final books = context.watch<BookProvider>().books;

    if (books.isEmpty) {
      return const Center(child: Text("ยังไม่มีข้อมูลหนังสือ..."));
    }

    return ListView.separated(
      padding: const EdgeInsets.all(16),
      itemCount: books.length,
      separatorBuilder: (context, index) => const SizedBox(height: 12),
      itemBuilder: (context, index) {
        final b = books[index];

        // จัดการรูปแบบวันที่
        String formattedDate = "ไม่ได้ระบุ";
        if (b.startDate.isNotEmpty) {
          try {
            DateTime date = DateTime.parse(b.startDate);
            formattedDate = DateFormat('dd/MM/yyyy').format(date);
          } catch (e) {
            formattedDate = b.startDate;
          }
        }

        return Card(
          elevation: 0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
            side: BorderSide(color: Colors.grey.shade200),
          ),
          child: InkWell(
            borderRadius: BorderRadius.circular(16),
            onTap: () => Navigator.push(
              context,
              MaterialPageRoute(builder: (c) => DetailScreen(book: b)),
            ),
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                children: [
                  // ไอคอนสมุดด้านหน้า
                  Container(
                    width: 50,
                    height: 50,
                    decoration: BoxDecoration(
                      color: Colors.indigo.withOpacity(0.1),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: const Icon(Icons.menu_book, color: Colors.indigo),
                  ),
                  const SizedBox(width: 16),

                  // ข้อมูลตัวอักษร
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          b.title,
                          style: const TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 4),
                        // แสดงชื่อผู้แต่ง
                        Row(
                          children: [
                            const Icon(
                              Icons.person_outline,
                              size: 14,
                              color: Colors.grey,
                            ),
                            const SizedBox(width: 4),
                            Text(
                              "ผู้แต่ง: ${b.author}",
                              style: const TextStyle(
                                color: Colors.grey,
                                fontSize: 14,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 2),
                        // แสดงวันที่เริ่มอ่าน
                        Row(
                          children: [
                            const Icon(
                              Icons.calendar_today_outlined,
                              size: 14,
                              color: Colors.grey,
                            ),
                            const SizedBox(width: 4),
                            Text(
                              "เริ่มอ่าน: $formattedDate",
                              style: const TextStyle(
                                color: Colors.grey,
                                fontSize: 14,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 4),
                        // แสดงสถานะ (Badge แบบทันสมัย)
                        Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 10,
                            vertical: 4,
                          ),
                          decoration: BoxDecoration(
                            // ปรับสีพื้นหลัง (Background)
                            color: b.status == "อ่านจบแล้ว"
                                ? Colors.green.shade50
                                : b.status == "กำลังอ่าน"
                                ? Colors.orange.shade50
                                : Colors
                                      .red
                                      .shade50, // สีแดงอ่อนสำหรับ "ยังไม่อ่าน"
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: Text(
                            b.status,
                            style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.bold,
                              // ปรับสีตัวอักษร (Text Color)
                              color: b.status == "อ่านจบแล้ว"
                                  ? Colors.green
                                  : b.status == "กำลังอ่าน"
                                  ? Colors.orange
                                  : Colors.red,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const Icon(
                    Icons.arrow_forward_ios,
                    size: 14,
                    color: Colors.grey,
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
