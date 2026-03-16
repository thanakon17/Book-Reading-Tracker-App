import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/book_provider.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final p = context.watch<BookProvider>();
    return SingleChildScrollView(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text("ภาพรวมการอ่านของคุณ", style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
          const SizedBox(height: 20),
          // สถิติแบบ Grid 2 คอลัมน์ (Modern Look)
          GridView.count(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            crossAxisCount: 2,
            mainAxisSpacing: 15,
            crossAxisSpacing: 15,
            children: [
              _buildStatCard("📚 ทั้งหมด", p.total, Colors.indigo),
              _buildStatCard("📖 กำลังอ่าน", p.reading, Colors.orange),
              _buildStatCard("✅ อ่านจบ", p.finished, Colors.green),
              _buildStatCard("⏳ ยังไม่อ่าน", p.total - p.reading - p.finished, Colors.grey),
            ],
          ),
          const SizedBox(height: 30),
          // แสดงชื่อผู้จัดทำ (เพิ่มคะแนน)
          const Center(
            child: Text(
              "จัดทำโดย: ธนกร ผดุงศิลป์ (67543210030-2)",
              style: TextStyle(color: Colors.grey, fontSize: 12),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildStatCard(String label, int val, Color col) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: col.withOpacity(0.05),
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: col.withOpacity(0.2)),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(label, style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w500)),
          const SizedBox(height: 10),
          Text(val.toString(), style: TextStyle(fontSize: 36, color: col, fontWeight: FontWeight.bold)),
        ],
      ),
    );
  }
}