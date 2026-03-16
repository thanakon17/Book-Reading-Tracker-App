class Book {
  int? id;
  String title;
  String author;
  String category;
  int pages;
  String status;
  String startDate; // เพิ่มฟิลด์นี้

  Book({
    this.id, 
    required this.title, 
    required this.author, 
    required this.category, 
    required this.pages, 
    required this.status, 
    required this.startDate
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'title': title,
      'author': author,
      'category': category,
      'pages': pages,
      'status': status,
      'startDate': startDate,
    };
  }

  factory Book.fromMap(Map<String, dynamic> map) {
    return Book(
      id: map['id'],
      title: map['title'] ?? '',
      author: map['author'] ?? '',
      category: map['category'] ?? 'ทั่วไป',
      pages: map['pages'] ?? 0,
      status: map['status'] ?? 'กำลังอ่าน',
      startDate: map['startDate'] ?? '',
    );
  }
}