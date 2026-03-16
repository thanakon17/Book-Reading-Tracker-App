# 📚 Book Reading Tracker App

**วิชา:** การพัฒนาโมบายแอปพลิเคชัน (Mobile Application Development)  
**โปรเจกต์:** ข้อสอบปฏิบัติการพัฒนาแอปพลิเคชันด้วย Flutter (Final Project)

---

## 👤 ข้อมูลผู้จัดทำ
* **ชื่อ-นามสกุล:** นายธนกร ผดุงศิลป์
* **รหัสนักศึกษา:** 67543210030-2
* **GitHub:** [thanakon17](https://github.com/thanakon17)
* **Email:** thanakon.170147@gmail.com

---

## 📋 รายละเอียดโปรเจกต์ (Project Overview)
แอปพลิเคชันสำหรับบริหารจัดการข้อมูลการอ่านหนังสือส่วนบุคคล ช่วยให้ผู้ใช้งานสามารถติดตามความคืบหน้า บันทึกรายละเอียดหนังสือ และดูสถิติภาพรวมผ่าน Dashboard ที่สวยงามและทันสมัยตามมาตรฐาน **Material 3**

### คุณสมบัติเด่น (Features)
* 📊 **Dashboard:** สรุปสถิติภาพรวมการอ่านหนังสือ
* 🔍 **Search & Filter:** ระบบค้นหาและคัดกรองรายการหนังสือตามเงื่อนไข
* 📝 **CRUD Operations:** เพิ่ม แก้ไข ลบ และเรียกดูข้อมูลหนังสือแบบ Real-time
* 📅 **DatePicker:** บันทึกวันที่เริ่มอ่านหนังสือในรูปแบบที่ใช้งานง่าย
* 🗄️ **Local Database:** จัดเก็บข้อมูลอย่างปลอดภัยภายในเครื่องด้วย SQLite

---

## 🗄 โครงสร้างฐานข้อมูล (Relational Schema)
1. **Table `books`**: เก็บข้อมูลหลัก (id, title, author, category_id, pages, status, startDate)
2. **Table `categories`**: เก็บหมวดหมู่หนังสือ (id, name)

---

## 🚀 วิธีการติดตั้ง (Installation)

1. **Clone โปรเจกต์:**
   `git clone https://github.com/thanakon17/Book-Reading-Tracker-App.git`

2. **ติดตั้ง Dependencies:**
   `flutter pub get`

3. **รันแอปพลิเคชัน:**
   `flutter run`

---

## 📸 ตัวอย่างหน้าจอ (Screenshots)

### 📊 สรุปผลและรายการหนังสือ

| <img src="https://github.com/user-attachments/assets/af8bccc2-b945-4e21-bc2a-93ac8e081c4e" width="200" alt="Dashboard"> | <img src="https://github.com/user-attachments/assets/cbbf5938-ea42-42da-938f-2ebe2b0f0406" width="200" alt="Book List"> | <img src="https://github.com/user-attachments/assets/a1f16c01-ce44-4fef-ab45-1583332615c8" width="200" alt="Filtered List"> |
| :---: | :---: | :---: |
| ** | ** | ** |

### 📝 รายละเอียดและการจัดการข้อมูล

| <img src="https://github.com/user-attachments/assets/2fd2900c-04f1-4ae4-a15e-d70168ecaae6" width="200" alt="Detail"> | <img src="https://github.com/user-attachments/assets/9d163498-50b6-4832-b9c6-2fb96e65a44a" width="200" alt="Form"> |
| :---: | :---: |
| ** | ** |

---
## 🏗 โครงสร้างโปรเจกต์ (Project Structure)
```text
lib/
├── models/
│   └── book.dart            # โครงสร้างข้อมูล (Model)
├── providers/
│   └── book_provider.dart   # จัดการ Logic และ State Management
├── services/
│   └── database_helper.dart # จัดการฐานข้อมูล SQLite
├── screens/
│   ├── home_screen.dart      # หน้าหลักพร้อมระบบ Navigation
│   ├── dashboard_screen.dart # ส่วนแสดงสถิติภาพรวม
│   ├── list_screen.dart      # รายการหนังสือ (Modern Card UI)
│   ├── form_screen.dart      # แบบฟอร์มเพิ่ม/แก้ไขข้อมูล
│   └── detail_screen.dart    # แสดงรายละเอียดเชิงลึก
└── main.dart                # จุดเริ่มต้นแอป
© 2026 Thanakon Phadungsilp. All Rights Reserved.
