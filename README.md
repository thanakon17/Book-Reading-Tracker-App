# 📚 Book Reading Tracker App
# 📖 แอปบันทึกการอ่านหนังสือ

**วิชา:** การพัฒนาโมบายแอปพลิเคชัน (Mobile Application Development)
**โปรเจกต์:** ข้อสอบปฏิบัติการพัฒนาแอปพลิเคชันด้วย Flutter (Final Project)

---

## 👤 ข้อมูลผู้จัดทำ
* **ชื่อ-นามสกุล:** นายธนกร ผดุงศิลป์
* **รหัสนักศึกษา:** 67543210030-2
* **GitHub:** thanakon17 (https://github.com/thanakon17)
* **Email:** thanakon.170147@gmail.com

---

## 📋 รายละเอียดโปรเจกต์ (Project Overview)
แอปพลิเคชันสำหรับบริหารจัดการข้อมูลการอ่านหนังสือส่วนบุคคล ช่วยให้ผู้ใช้งานสามารถติดตามความคืบหน้า บันทึกรายละเอียดหนังสือ และดูสถิติภาพรวมผ่าน Dashboard ที่สวยงามและทันสมัยตามมาตรฐาน Material 3

### คุณสมบัติเด่น (Features)
* 📊 Dashboard: สรุปสถิติภาพรวมการอ่านหนังสือ
* 🔍 Search & Filter: ระบบค้นหาและคัดกรองรายการหนังสือตามเงื่อนไข
* 📝 CRUD Operations: เพิ่ม แก้ไข ลบ และเรียกดูข้อมูลหนังสือแบบ Real-time
* 📅 DatePicker: บันทึกวันที่เริ่มอ่านหนังสือในรูปแบบที่ใช้งานง่าย
* 🗄️ Local Database: จัดเก็บข้อมูลอย่างปลอดภัยภายในเครื่องด้วย SQLite

---

## 🏗 โครงสร้างโปรเจกต์ (Project Structure)
```text
lib/
├── models/
│   └── book.dart           # โครงสร้างข้อมูล (Model) และ Factory Methods
├── providers/
│   └── book_provider.dart  # จัดการ Logic, Theme, Search, Filter
├── services/
│   └── database_helper.dart # จัดการฐานข้อมูล SQLite (2 ตาราง)
├── screens/
│   ├── home_screen.dart      # หน้าหลักพร้อมระบบ Navigation และ Theme Toggle
│   ├── dashboard_screen.dart # หน้าที่ 1: สรุปสถิติภาพรวม (Dashboard)
│   ├── list_screen.dart      # หน้าที่ 2: รายการหนังสือ (Modern Card UI)
│   ├── form_screen.dart      # หน้าที่ 3: แบบฟอร์มเพิ่ม/แก้ไขข้อมูล และ DatePicker
│   └── detail_screen.dart    # หน้าที่ 4: แสดงรายละเอียดเชิงลึกและปุ่มดำเนินการ
└── main.dart                # จุดเริ่มต้นแอปและการตั้งค่า MultiProvider / Theme

---

## 🛠 เทคโนโลยีที่ใช้ (Tech Stack)
* Core: Flutter SDK & Dart Language
* State Management: provider
* Database: sqflite, path
* Utilities: intl (สำหรับจัดรูปแบบวันที่ dd/MM/yyyy)
* Design: Material 3 Design System

---

## 🗄 โครงสร้างฐานข้อมูล (Relational Schema)
ออกแบบให้มี 2 ตารางที่มีความสัมพันธ์กันตามข้อกำหนดเชิงเทคนิค:

1. Table books (เก็บข้อมูลหลัก)
   - id (Primary Key)
   - title (หัวข้อหนังสือ)
   - author (ชื่อผู้แต่ง)
   - category_id (เชื่อมโยงกับตารางหมวดหมู่)
   - pages (จำนวนหน้า)
   - status (สถานะการอ่าน)
   - startDate (วันที่เริ่มอ่าน)

2. Table categories (เก็บหมวดหมู่)
   - id (Primary Key)
   - name (ชื่อหมวดหมู่หนังสือ)

---

## 🚀 วิธีการติดตั้ง (Installation)

1. Clone โปรเจกต์ ลงเครื่องคอมพิวเตอร์ของคุณ:
   git clone https://github.com/thanakon17/book-reading-tracker.git

2. ติดตั้ง Dependencies โดยรันคำสั่งใน Terminal:
   flutter pub get

3. รันแอปพลิเคชัน เพื่อทดสอบ:
   flutter run

---

## 📸 ตัวอย่างหน้าจอ (Screenshots)

### 📊 สรุปผลและรายการหนังสือ

| <img src="image_3.png" width="200" alt="Dashboard Screen"> | <img src="image_1.png" width="200" alt="All Books List"> | <img src="image_2.png" width="200" alt="Filtered Books List"> |
| :---: | :---: | :---: |
| **หน้า Dashboard**<br>แสดงสถิติภาพรวมการอ่านของคุณ | **หน้ารายการหนังสือทั้งหมด**<br>แสดงหนังสือที่บันทึกไว้ | **หน้ารายการตามสถานะ**<br>แสดงหนังสือที่ "อ่านจบแล้ว" |

### 📝 รายละเอียดและการจัดการข้อมูล

| <img src="image_0.png" width="200" alt="Book Detail Screen"> | <img src="image_4.png" width="200" alt="Add Book Form"> |
| :---: | :---: |
| **หน้ารายละเอียดหนังสือ**<br>แสดงข้อมูลเชิงลึกและเมนูจัดการ | **หน้าเพิ่มข้อมูลหนังสือ**<br>แบบฟอร์มบันทึกหนังสือเล่มใหม่ |

---
© 2026 Thanakon Phadungsilp. All Rights Reserved.
