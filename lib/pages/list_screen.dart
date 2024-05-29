import 'package:bbboooook/components/cont_country.dart';
import 'package:bbboooook/modules/Book.dart';
import 'package:flutter/material.dart';

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Книги'),
        centerTitle: true,
      ),
      body: Container(
        decoration: const BoxDecoration(
          color: Color.fromARGB(255, 14, 2, 88),
        ),
        child: GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2),
          itemCount: bookList.length,
          itemBuilder: (BuildContext context, int index) {
            return CountryWidget(
              id: bookList[index].id,
              title: bookList[index].title,
              author: bookList[index].author,
              description: bookList[index].description,
              price: bookList[index].price,
              year: bookList[index].year,
              edition: bookList[index].edition,
              image: bookList[index].image,
            );
          },
        ),
      ),
    );
  }
}
