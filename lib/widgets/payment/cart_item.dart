import 'package:flutter/material.dart';
import 'package:retro_shopping/helpers/Styles.dart';

class CartItem extends StatefulWidget {
  @override
  _CartItemState createState() => _CartItemState();
}

class _CartItemState extends State<CartItem> {
  TextEditingController controller;

  @override
  void initState() {
    super.initState();
    controller = TextEditingController();
    controller.text = '1';
  }

  @override
  Widget build(BuildContext context) {
    final double height = MediaQuery.of(context).size.height;
    return Padding(
      padding: const EdgeInsets.only(bottom: 10.0),
      child: SingleChildScrollView(
        child: Column(
          // ignore: always_specify_types
          children: [
            Row(
              children: <Widget>[
                Stack(
                  children: <Widget>[
                    Transform.translate(
                      offset: const Offset(3.5, 4),
                      child: Container(
                        height: 75,
                        width: 75,
                        decoration: const BoxDecoration(
                          color: Colors.black,
                          // image: DecorationImage(image: null)
                        ),
                      ),
                    ),
                    Container(
                      height: 75,
                      width: 75,
                      decoration: const BoxDecoration(
                        color: Colors.white,
                        // image: DecorationImage(image: null)
                      ),
                    ),
                  ],
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 12),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                         Text(
                          'Product Name',
                          style: Styles.productName(),
                        ),
                        const Text(
                          'Name',
                          style: TextStyle(color: Colors.white),
                        ),
                        SizedBox(
                          height: height * 0.005,
                        ),
                        Container(
                          width: 75,
                          height: 25,
                          decoration: const BoxDecoration(
                              color: Colors.white,
                              boxShadow: <BoxShadow>[
                                BoxShadow(
                                    offset: Offset(0, 4),
                                    blurRadius: 8,
                                    color: Colors.black26)
                              ]),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: <Widget>[
                              GestureDetector(
                                onTap: addQuantity,
                                child: const Icon(Icons.add),
                              ),
                              Expanded(
                                  child: TextField(
                                textAlign: TextAlign.center,
                                style: const TextStyle(
                                  fontSize: 17,
                                  fontWeight: FontWeight.bold,
                                ),
                                readOnly: true,
                                controller: controller,
                                decoration: const InputDecoration(
                                    border: InputBorder.none,
                                    isDense: true,
                                    contentPadding: EdgeInsets.all(0)),
                              )),
                              GestureDetector(
                                onTap: subQuantity,
                                child: const Icon(Icons.remove),
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                Text(
                  '₹65654',
                  style: Styles.price(),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }

  void subQuantity() {
    if (int.parse(controller.text) > 1) {
      controller.text = (int.parse(controller.text) - 1).toString();
    }
  }

  void addQuantity() {
    if (int.parse(controller.text) < 50) {
      controller.text = (int.parse(controller.text) + 1).toString();
    }
  }
}
