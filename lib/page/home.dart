import 'package:app/page/content_model.dart';
import 'package:app/widget_support/Widget_support.dart';
import 'package:app/widget_support/foodItemList.dart';
import 'package:app/widget_support/widgetDesign.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  final void Function(int) onPageChanged;
  const Home({super.key, required this.onPageChanged});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  bool pizza = false, burger = false, salad = false, icecream = false;

  List<Map<String, dynamic>> itemtype = saladlist;
  String? itemtypeinstring;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
      scrollDirection: Axis.vertical,
      child: Container(
        margin: const EdgeInsets.only(top: 50, left: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Hello ${UserName.username}",
                    style: AppWidget.boldTextFieldStyle()),
                GestureDetector(
                  onTap: () {
                    widget.onPageChanged(1);
                  },
                  child: Container(
                    margin: const EdgeInsets.only(right: 20),
                    padding: const EdgeInsets.all(3.0),
                    decoration: BoxDecoration(
                        color: Colors.black,
                        borderRadius: BorderRadius.circular(8)),
                    child: const Icon(
                      Icons.shopping_cart_outlined,
                      color: Colors.white,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 15.0,
            ),
            Text("Delecious Food", style: AppWidget.headLineTextFieldStyle()),
            Text("Discover and Get Great Food",
                style: AppWidget.lightTextFieldStyle()),
            const SizedBox(
              height: 20.0,
            ),
            Container(
                margin: const EdgeInsets.only(right: 20), child: showItem()),
            const SizedBox(
              height: 20.0,
            ),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: List.generate(itemtype.length, (index) {
                  return foodItem(
                      context,
                      itemtype[index]['image']!,
                      itemtype[index]['foodName']!,
                      itemtype[index]['foodDescription']!,
                      itemtype[index]['price']!,
                      itemtype[index]['price']!);
                }),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Column(
              children: List.generate(itemtype.length, (index) {
                return vfoodItem(
                  context,
                  itemtype[index]['image']!,
                  itemtype[index]['foodName']!,
                  itemtype[index]['foodDescription']!,
                  itemtype[index]['price']!,
                );
              }),
            )
          ],
        ),
      ),
    ));
  }

  Widget showItem() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        GestureDetector(
          onTap: () {
            icecream = true;
            burger = false;
            pizza = false;
            salad = false;
            itemtype = icecreamlist;
            itemtypeinstring = "icecreamlist";

            setState(() {});
          },
          child: Material(
            elevation: 5.0,
            borderRadius: BorderRadius.circular(10.0),
            child: Container(
              decoration: BoxDecoration(
                  color: icecream ? Colors.black : Colors.white,
                  borderRadius: BorderRadius.circular(10.0)),
              padding: const EdgeInsets.all(8),
              child: Image.asset(
                "images/icecream.png",
                width: 40.0,
                height: 40.0,
                fit: BoxFit.cover,
                color: icecream ? Colors.white : Colors.black,
              ),
            ),
          ),
        ),
        GestureDetector(
          onTap: () {
            icecream = false;
            burger = false;
            pizza = true;
            salad = false;
            itemtype = pizzalist;
            itemtypeinstring = "pizzalist";
            setState(() {});
          },
          child: Material(
            elevation: 5.0,
            borderRadius: BorderRadius.circular(10.0),
            child: Container(
              decoration: BoxDecoration(
                  color: pizza ? Colors.black : Colors.white,
                  borderRadius: BorderRadius.circular(10.0)),
              padding: const EdgeInsets.all(8),
              child: Image.asset(
                "images/pizza.png",
                width: 40.0,
                height: 40.0,
                fit: BoxFit.cover,
                color: pizza ? Colors.white : Colors.black,
              ),
            ),
          ),
        ),
        GestureDetector(
          onTap: () {
            icecream = false;
            burger = true;
            pizza = false;
            salad = false;
            itemtype = burgerlist;
            itemtypeinstring = " burgerlist";
            setState(() {});
          },
          child: Material(
            elevation: 5.0,
            borderRadius: BorderRadius.circular(10.0),
            child: Container(
              decoration: BoxDecoration(
                  color: burger ? Colors.black : Colors.white,
                  borderRadius: BorderRadius.circular(10.0)),
              padding: const EdgeInsets.all(8),
              child: Image.asset(
                "images/burger.png",
                width: 40.0,
                height: 40.0,
                fit: BoxFit.cover,
                color: burger ? Colors.white : Colors.black,
              ),
            ),
          ),
        ),
        GestureDetector(
          onTap: () {
            icecream = false;
            burger = false;
            pizza = false;
            salad = true;
            itemtype = saladlist;
            itemtypeinstring = "saladlist";
            setState(() {});
          },
          child: Material(
            elevation: 5.0,
            borderRadius: BorderRadius.circular(10.0),
            child: Container(
              decoration: BoxDecoration(
                  color: salad ? Colors.black : Colors.white,
                  borderRadius: BorderRadius.circular(10.0)),
              padding: const EdgeInsets.all(8),
              child: Image.asset(
                "images/salad.png",
                width: 40.0,
                height: 40.0,
                fit: BoxFit.cover,
                color: salad ? Colors.white : Colors.black,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
