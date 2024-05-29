import 'package:bbboooook/modules/CartModel.dart';
import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';
//import 'package:bbboooook/modules/Book.dart';
import 'package:bbboooook/pages/CartPage.dart';
import 'package:bbboooook/pages/CountryDetailsPage.dart';

class CountryWidget extends StatelessWidget {
  const CountryWidget({
    super.key,
    required this.title,
    required this.author,
    required this.description,
    required this.price,
    required this.year,
    required this.edition,
    required this.image,
    required this.id,
  });

  final String title;
  final String author;
  final String description;
  final double price;
  final int year;
  final String edition;
  final String image;
  final int id;

  @override
  Widget build(BuildContext context) {
    final book = Book(
      id: id,
      title: title,
      author: author,
      description: description,
      price: price,
      year: year,
      edition: edition,
      image: image,
      qty: 1, // Инициализация qty
    );

    return Container(
      margin: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: const Color.fromARGB(255, 210, 190, 190),
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 3,
            blurRadius: 7,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Column(
        children: <Widget>[
          Text(
            title,
            textAlign: TextAlign.center,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 16,
            ),
          ),
          Image.network(
            image,
            width: 350,
            height: 250,
          ),
          Text(
            'Автор: $author',
            textAlign: TextAlign.center,
            style: const TextStyle(
              fontSize: 14,
            ),
          ),
          Text(
            'Цена: $price руб.',
            textAlign: TextAlign.center,
            style: const TextStyle(
              fontSize: 14,
            ),
          ),
          Text(
            ' $year год',
            textAlign: TextAlign.center,
            style: const TextStyle(
              fontSize: 14,
            ),
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => CountryDetailsPage(
                    name: title,
                    flagUrl: image,
                    description: description,
                  ),
                ),
              );
            },
            child: const Text('Узнать подробнее'),
          ),
          ScopedModelDescendant<CartModel>(
            builder: (context, child, model) {
              return ElevatedButton(
                onPressed: () {
                  model.addProduct(book);
                },
                child: const Text('+'),
              );
            },
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => CartPage()),
              );
            },
            child: const Icon(Icons.shopping_cart),
          )
        ],
      ),
    );
  }
}
