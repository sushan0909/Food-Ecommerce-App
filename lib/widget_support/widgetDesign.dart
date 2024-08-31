import "package:app/page/details.dart";
import "package:app/widget_support/Widget_support.dart";
import "package:flutter/material.dart";

Widget foodItem(BuildContext context, String image, String foodName,
    String foodDescription, double price, double singleprice) {
  return GestureDetector(
    onTap: () {
      Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => Details(
              imagePath: image,
              foodName: foodName,
              description: foodDescription,
              price: price,
              quantity: 1,
              singleprice: singleprice,
            ),
          ));
    },
    child: Container(
      margin: EdgeInsets.all(4),
      child: Material(
        elevation: 5.0,
        borderRadius: BorderRadius.circular(20.0),
        child: Container(
          padding: EdgeInsets.all(14),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image.asset(
                image,
                width: MediaQuery.of(context).size.width / 2,
                height: MediaQuery.of(context).size.height / 3,
                fit: BoxFit.scaleDown,
              ),
              Text(
                foodName,
                style: AppWidget.smallBoldTextFieldStyle(),
              ),
              Text(
                foodDescription,
                style: AppWidget.lightSmallTextFieldStyle(),
              ),
              Text(
                "\$${price.toString()}",
                style: AppWidget.semiBoldTextFieldStyle(),
              )
            ],
          ),
        ),
      ),
    ),
  );
}

Widget vfoodItem(BuildContext context, String image, String foodName,
    String foodDescription, double price) {
  return Container(
    margin: EdgeInsets.only(right: 20.0, bottom: 20.0),
    child: Material(
      elevation: 5.0,
      borderRadius: BorderRadius.circular(20.0),
      child: Container(
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset(
              image,
              width: MediaQuery.of(context).size.width / 3,
              height: MediaQuery.of(context).size.height / 5,
              fit: BoxFit.scaleDown,
            ),
            SizedBox(
              width: 10,
            ),
            Column(
              children: [
                Container(
                  width: MediaQuery.of(context).size.width / 2,
                  child: Text(
                    foodName,
                    style: AppWidget.smallBoldTextFieldStyle(),
                  ),
                ),
                SizedBox(
                  height: 5.0,
                ),
                Container(
                  width: MediaQuery.of(context).size.width / 2,
                  child: Text(foodDescription,
                      style: AppWidget.lightSmallTextFieldStyle()),
                ),
                SizedBox(
                  height: 5.0,
                ),
                Container(
                  width: MediaQuery.of(context).size.width / 2,
                  child: Text(
                    "\$${price.toString()}",
                    style: AppWidget.semiBoldTextFieldStyle(),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    ),
  );
}

Widget cartContainer(BuildContext context) {
  return Text(
    "hello",
    style: AppWidget.boldTextFieldStyle(),
  );
}
