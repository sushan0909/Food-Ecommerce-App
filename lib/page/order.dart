import "package:app/page/details.dart";
import "package:app/widget_support/Widget_support.dart";
import "package:app/widget_support/appconstant.dart";
import "package:app/widget_support/cartlist.dart";
import "package:flutter/material.dart";

class Order extends StatefulWidget {
  const Order({super.key});

  @override
  State<Order> createState() => _OrderState();
}

class _OrderState extends State<Order> {
  bool checkcart = cartList.isEmpty;
  int cartlistlength = cartList.length;
  double cartTotalPrice = 0.0;
  double totalCartPrice() {
    cartlistlength = cartList.length;
    cartTotalPrice = 0.0;
    for (int i = 0; i < cartlistlength; i++) {
      cartTotalPrice = cartList[i]["price"] + cartTotalPrice;
    }
    return cartTotalPrice;
  }

  void refreshpage() {
    checkcart = cartList.isEmpty;
    cartTotalPrice = totalCartPrice();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    refreshpage();
    return Scaffold(
      appBar: PreferredSize(
          preferredSize: const Size.fromHeight(kToolbarHeight + 1.0),
          child: Container(
            decoration: BoxDecoration(
                border: Border(
                    bottom: BorderSide(color: Colors.grey[300]!, width: 3.0))),
            child: AppBar(
              title: Center(
                child: Text(
                  "Food Cart",
                  style: AppWidget.headLineTextFieldStyle(),
                ),
              ),
            ),
          )),
      bottomNavigationBar: checkcart
          ? null
          : Container(
              height: MediaQuery.of(context).size.width / 2.8,
              decoration: BoxDecoration(
                  border:
                      Border(top: BorderSide(color: Colors.grey, width: 1))),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    children: [
                      SizedBox(
                        width: 10,
                      ),
                      Text("Total Price",
                          style: AppWidget.boldTextFieldStyle()),
                      Spacer(),
                      Text("\$${cartTotalPrice.toStringAsFixed(2)}",
                          style: AppWidget.boldTextFieldStyle()),
                      SizedBox(
                        width: 10,
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 8,
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width / 1.2,
                    child: ElevatedButton(
                        onPressed: () {
                          if (currentBalance >= cartTotalPrice) {
                            currentBalance = currentBalance - cartTotalPrice;
                            cartList.clear();
                            refreshpage();
                            showDialog(
                                context: context,
                                builder: (BuildContext) {
                                  return AlertDialog(
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(
                                          10.0), // <-- Set your desired radius here
                                    ),
                                    backgroundColor: Color(0xFFE8F5E9),
                                    content: Text(
                                      'Order Confirmed!',
                                      style: TextStyle(
                                          fontSize: 18,
                                          color: Color(0xFF4CAF50),
                                          fontFamily: "Poppins"),
                                    ),
                                  );
                                });
                          } else {
                            showDialog(
                                context: context,
                                builder: (BuildContext) {
                                  return AlertDialog(
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(
                                          10.0), // <-- Set your desired radius here
                                    ),
                                    backgroundColor: Color(0xFFFFF9C4),
                                    content: Text(
                                      'Insufficient balance!',
                                      style: TextStyle(
                                          fontSize: 18,
                                          color: Colors.black87,
                                          fontFamily: "Poppins"),
                                    ),
                                  );
                                });
                          }
                        },
                        style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.black, elevation: 10),
                        child: Text(
                          "CheckOut",
                          style: TextStyle(
                              fontFamily: "Poppins",
                              fontSize: 18,
                              color: Colors.white),
                        )),
                  ),
                  SizedBox(
                    height: 10,
                  )
                ],
              )),
      body: checkcart
          ? const Center(
              child: Text(
                "Empty!",
                style: TextStyle(
                    fontFamily: "Poppins",
                    fontSize: 42,
                    fontWeight: FontWeight.bold,
                    color: Colors.grey),
              ),
            )
          : SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: List.generate(
                      cartList.length, (index) => foodcart(context, index))),
            ),
    );
  }

  Widget foodcart(BuildContext context, int index) {
    double price = cartList[index]["price"];
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Material(
        elevation: 5,
        borderRadius: BorderRadius.circular(10),
        child: Container(
          decoration: BoxDecoration(borderRadius: BorderRadius.circular(10)),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              GestureDetector(
                  onTap: () async {
                    String refresh = await Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => Details(
                            imagePath: cartList[index]["image"],
                            foodName: cartList[index]["name"],
                            description: cartList[index]["description"],
                            price: cartList[index]["price"],
                            quantity: cartList[index]["quantity"],
                            cartListIndex: index,
                            update: true,
                            singleprice: cartList[index]["singleprice"],
                          ),
                        ));
                    if (refresh == 'refresh') {
                      refreshpage();
                    }
                  },
                  child: const Icon(Icons.edit_note)),
              Container(
                padding: EdgeInsets.all(8.0),
                decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey, width: 2),
                    borderRadius: BorderRadius.circular(5)),
                child: Center(
                  child: Text(
                    "${cartList[index]["quantity"]}",
                    style: AppWidget.boldTextFieldStyle(),
                  ),
                ),
              ),
              Image.asset(
                cartList[index]["image"],
                fit: BoxFit.scaleDown,
                width: MediaQuery.of(context).size.width / 4,
                height: MediaQuery.of(context).size.height / 5,
              ),
              Column(
                children: [
                  Text(
                    cartList[index]["name"],
                    style: AppWidget.smallBoldTextFieldStyle(),
                  ),
                  Text(
                    "\$${price.toStringAsFixed(2)}",
                    style: AppWidget.semiBoldTextFieldStyle(),
                  )
                ],
              ),
              GestureDetector(
                onTap: () {
                  cartList.removeAt(index);
                  refreshpage();
                },
                child: const Icon(
                  Icons.delete,
                  color: Colors.grey,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
