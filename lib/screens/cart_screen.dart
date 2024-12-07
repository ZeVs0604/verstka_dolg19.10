import 'package:flutter/material.dart';

class CartScreen extends StatelessWidget {
  final VoidCallback onProfileSelected;

  CartScreen({required this.onProfileSelected});

  @override
  Widget build(BuildContext context) {
    double totalAmount = 859998; // Пример общей суммы
    double discount = 10000; // Пример скидки
    double finalAmount = totalAmount - discount; // Итоговая сумма со скидкой

    return Scaffold(
      appBar: AppBar(
        title: Text("Корзина"),
        actions: [
          IconButton(
            onPressed: onProfileSelected,
            icon: Icon(Icons.person),
          ),
        ],
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.blue[100]!, Colors.white],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: ListView(
          padding: EdgeInsets.all(16.0),
          children: [
            CartItem(
              imageUrl: 'https://mac.electrental.webdevia.com/wp-content/uploads/sites/5/2024/02/product_mac_pro-100x100.webp',
              title: "Монитор Apple Pro Display XDR",
              price: "724 999 P",
            ),
            CartItem(
              imageUrl: 'https://3delectronics.ru/image/cache/apple/e05ac6dd4f7cec8fe099304431697433.jpg',
              title: "Ноутбук MacBook Pro",
              price: "134 999 P",
            ),
            // Добавьте больше CartItem по мере необходимости
            SizedBox(height: 20),
            Text(
              "Общая сумма: $totalAmount P",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8),
            Text(
              "Скидка: $discount P",
              style: TextStyle(fontSize: 16, color: Colors.red),
            ),
            SizedBox(height: 8),
            Text(
              "Сумма со скидкой: $finalAmount P",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // Логика для перехода к оформлению
              },
              child: Text("Перейти к оформлению"),
            ),
          ],
        ),
      ),
    );
  }
}

class CartItem extends StatelessWidget {
  final String imageUrl;
  final String title;
  final String price;

  CartItem({required this.imageUrl, required this.title, required this.price});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      margin: EdgeInsets.symmetric(vertical: 8.0),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          children: [
            Image.network(
              imageUrl,
              width: 100,
              height: 100,
              fit: BoxFit.cover,
            ),
            SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                  ),
                  SizedBox(height: 4),
                  Text(
                    price,
                    style: TextStyle(color: Colors.green, fontSize: 14),
                  ),
                ],
              ),
            ),
            IconButton(
              onPressed: () {},
              icon: Icon(Icons.remove_circle_outline),
            ),
            Text("1"),
            IconButton(
              onPressed: () {},
              icon: Icon(Icons.add_circle_outline),
            ),
          ],
        ),
      ),
    );
  }
}