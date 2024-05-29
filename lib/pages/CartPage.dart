import 'package:bbboooook/modules/CartModel.dart';
import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';

class CartPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _CartPageState();
  }
}

class _CartPageState extends State<CartPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.indigo,
        title: Text("Корзина"),
        actions: <Widget>[
          TextButton(
            child: Text(
              "Очистить",
              style: TextStyle(color: Colors.white),
            ),
            onPressed: () => ScopedModel.of<CartModel>(context).clearCart(),
          ),
        ],
      ),
      body: ScopedModelDescendant<CartModel>(
        builder: (context, child, model) {
          if (model.cart.isEmpty) {
            return Center(child: Text("Корзина пуста"));
          }
          return Container(
            padding: EdgeInsets.all(8.0),
            child: Column(
              children: <Widget>[
                Expanded(
                  child: ListView.builder(
                    itemCount: model.cart.length,
                    itemBuilder: (context, index) {
                      return ListTile(
                        title: Text(model.cart[index].title),
                        subtitle: Text(
                          '${model.cart[index].qty} x ${model.cart[index].price} = ${model.cart[index].qty * model.cart[index].price}',
                        ),
                        trailing: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            IconButton(
                              icon: Icon(Icons.add),
                              onPressed: () {
                                model.updateProduct(model.cart[index],
                                    model.cart[index].qty + 1);
                              },
                            ),
                            IconButton(
                              icon: Icon(Icons.remove),
                              onPressed: () {
                                model.updateProduct(model.cart[index],
                                    model.cart[index].qty - 1);
                              },
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                ),
                Container(
                  padding: EdgeInsets.all(8.0),
                  child: Text(
                    "Итог: ${model.totalCartValue} Рублей ",
                    style:
                        TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold),
                  ),
                ),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      foregroundColor: Colors.white,
                      backgroundColor: Colors.yellow[900],
                      elevation: 0,
                    ),
                    child: Text("Купить сейчас"),
                    onPressed: () {},
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
