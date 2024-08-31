import 'package:app/widget_support/Widget_support.dart';
import 'package:app/widget_support/cartlist.dart';
import 'package:flutter/material.dart';

class Details extends StatefulWidget {
  final String imagePath;
  final String foodName;
  final String description;
  final int quantity;
  final double price;
  final int? cartListIndex;
  final bool? update;
  final double? singleprice;

  const Details({
    required this.imagePath,
    required this.foodName,
    required this.description,
    required this.price,
    required this.quantity,
    this.cartListIndex,
    this.singleprice,
    this.update,
    super.key,
  });

  @override
  State<Details> createState() => _DetailsState();
}

class _DetailsState extends State<Details> {
  int? quantity;
  double? totalPrice;
  @override
  void initState() {
    super.initState();
    // Initialize totalPrice here
    totalPrice = widget.price;
    quantity = widget.quantity;
  }

  @override
  Widget build(BuildContext context) {
    final bool isSmallScreen = MediaQuery.of(context).size.height < 427;
    return Scaffold(
        body: isSmallScreen
            ? SingleChildScrollView(
                scrollDirection: Axis.vertical,
                child: detailstruc(context, isSmallScreen),
              )
            : detailstruc(context, isSmallScreen));
  }

  Widget detailstruc(BuildContext context, bool isSmallScreen) {
    return Container(
      margin: EdgeInsets.only(top: 40.0, left: 20.0, right: 20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },
            child: Icon(
              Icons.arrow_back_ios_outlined,
              color: Colors.black,
            ),
          ),
          Image.asset(
            widget.imagePath,
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height / 3,
            fit: BoxFit.scaleDown,
          ),
          Row(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    widget.foodName,
                    style: AppWidget.smallBoldTextFieldStyle(),
                  ),
                  Text(
                    widget.description,
                    style: AppWidget.smallBoldTextFieldStyle(),
                  ),
                ],
              ),
              Spacer(),
              Row(
                children: [
                  GestureDetector(
                    onTap: () {
                      if (quantity! >= 2) {
                        quantity = quantity! - 1;
                        if (widget.update == true) {
                          totalPrice = totalPrice! -
                              cartList[widget.cartListIndex!]['singleprice'];
                        } else {
                          totalPrice = totalPrice! - widget.price;
                        }
                      }
                      setState(() {});
                    },
                    child: Container(
                        decoration: BoxDecoration(
                            color: Colors.black,
                            borderRadius: BorderRadius.circular(8.0)),
                        child: Icon(
                          Icons.remove,
                          color: Colors.white,
                        )),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Text(
                    quantity.toString(),
                    style: AppWidget.semiBoldTextFieldStyle(),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  GestureDetector(
                    onTap: () {
                      quantity = quantity! + 1;
                      if (widget.update == true) {
                        totalPrice = totalPrice! +
                            cartList[widget.cartListIndex!]['singleprice'];
                      } else {
                        totalPrice = totalPrice! + widget.price;
                      }
                      setState(() {});
                    },
                    child: Container(
                        decoration: BoxDecoration(
                            color: Colors.black,
                            borderRadius: BorderRadius.circular(8.0)),
                        child: const Icon(
                          Icons.add,
                          color: Colors.white,
                        )),
                  ),
                ],
              ),
            ],
          ),
          SizedBox(
            height: 10.0,
          ),
          Text(
            "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.",
            style: AppWidget.lightSmallTextFieldStyle(),
          ),
          SizedBox(
            height: 15.0,
          ),
          Row(
            children: [
              Text(
                "Delivery Time",
                style: AppWidget.smallBoldTextFieldStyle(),
              ),
              SizedBox(
                width: 20.0,
              ),
              Icon(
                Icons.alarm,
                color: Colors.black54,
              ),
              Text(
                "30 min",
                style: AppWidget.semiBoldTextFieldStyle(),
              )
            ],
          ),
          isSmallScreen
              ? const SizedBox(
                  height: 40,
                )
              : const Spacer(),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Total Price",
                    style: AppWidget.semiBoldTextFieldStyle(),
                  ),
                  Text(
                    "\$${totalPrice?.toStringAsFixed(2)}",
                    style: AppWidget.headLineTextFieldStyle(),
                  ),
                ],
              ),
              Spacer(),
              GestureDetector(
                onTap: () {
                  cartList.add({
                    'name': widget.foodName,
                    'price': totalPrice,
                    'quantity': quantity,
                    'image': widget.imagePath,
                    'description': widget.description,
                    'singleprice': widget.singleprice,
                  });
                  if (widget.cartListIndex != null) {
                    cartList.removeAt(widget.cartListIndex!);
                  }

                  Navigator.pop(context, "refresh");
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
                            'Updated to cart!',
                            style: TextStyle(
                                fontSize: 18,
                                color: Color(0xFF4CAF50),
                                fontFamily: "Poppins"),
                          ),
                        );
                      });
                },
                child: Container(
                  padding: EdgeInsets.all(10.0),
                  decoration: BoxDecoration(
                      color: Colors.black,
                      borderRadius: BorderRadius.circular(10)),
                  child: Row(
                    children: [
                      SizedBox(
                        width: 10,
                      ),
                      Text(
                        "Add to cart",
                        style: TextStyle(
                          fontFamily: "Poppins",
                          fontSize: 14,
                          color: Colors.white,
                        ),
                      ),
                      SizedBox(
                        width: 10.0,
                      ),
                      Container(
                        padding: EdgeInsets.all(5),
                        decoration: BoxDecoration(
                            color: Colors.grey,
                            borderRadius: BorderRadius.circular(8)),
                        child: Icon(
                          Icons.shopping_cart_outlined,
                          color: Colors.white,
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 10,
          )
        ],
      ),
    );
  }
}
