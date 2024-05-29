import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';
import 'package:bbboooook/modules/CartModel.dart'; // Убедитесь, что CartModel импортирован
import 'package:bbboooook/pages/login.dart';

void main() {
  runApp(
    ScopedModel<CartModel>(
      model: CartModel(), // Создание экземпляра CartModel
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: '/',
      routes: {
        '/': (context) => LoginScreen(),
      },
    );
  }
}
