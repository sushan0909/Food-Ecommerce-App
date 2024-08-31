import "package:app/stripe_service.dart";
import "package:app/widget_support/Widget_support.dart";
import "package:app/widget_support/appconstant.dart";
import "package:flutter/material.dart";

class Wallet extends StatefulWidget {
  const Wallet({super.key});

  @override
  State<Wallet> createState() => _WalletState();
}

class _WalletState extends State<Wallet> {
  bool hundred = false,
      fivehundred = false,
      thousand = false,
      twothousand = false;

  void transactioncheck() async {
    await StripeService.instance.makePayment();
    if (StripeService.instance.transaction == true) {
      currentBalance =
          currentBalance + StripeService.instance.money!.toDouble();
      StripeService.instance.money = null;
      StripeService.instance.transaction = false;
    }
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
          preferredSize: Size.fromHeight(kToolbarHeight + 1.0),
          child: Container(
            decoration: BoxDecoration(
                border: Border(
                    bottom: BorderSide(color: Colors.grey[300]!, width: 3.0))),
            child: AppBar(
              title: Center(
                child: Text(
                  "Wallet",
                  style: AppWidget.headLineTextFieldStyle(),
                ),
              ),
            ),
          )),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            decoration: BoxDecoration(color: Color(0xfff2f2f3)),
            padding: EdgeInsets.only(left: 10),
            child: Row(
              children: [
                Image.asset(
                  "images/assets/wallet.png",
                  height: MediaQuery.of(context).size.height / 7,
                  width: MediaQuery.of(context).size.width / 5,
                  fit: BoxFit.scaleDown,
                ),
                SizedBox(
                  width: 20,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Your wallet",
                      style: AppWidget.lightTextFieldStyle(),
                    ),
                    Text(
                      "\$${currentBalance.toStringAsFixed(2)}",
                      style: AppWidget.headLineTextFieldStyle(),
                    )
                  ],
                )
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Text(
              "Add money",
              style: AppWidget.semiBoldTextFieldStyle(),
            ),
          ),
          Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                GestureDetector(
                  onTap: () {
                    hundred = true;
                    fivehundred = false;
                    thousand = false;
                    twothousand = false;
                    StripeService.instance.money = 100;
                    setState(() {});
                  },
                  child: Container(
                    padding: EdgeInsets.all(5),
                    decoration: BoxDecoration(
                        border: Border.all(
                          width: 1,
                          color: hundred
                              ? Color.fromRGBO(0, 150, 136, 1.0)
                              : const Color.fromARGB(125, 158, 158, 158),
                        ),
                        borderRadius: BorderRadius.circular(5)),
                    child: Text(
                      "\$100",
                      style: AppWidget.semiBoldTextFieldStyle(),
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    hundred = false;
                    fivehundred = true;
                    thousand = false;
                    twothousand = false;
                    StripeService.instance.money = 500;
                    setState(() {});
                  },
                  child: Container(
                    padding: EdgeInsets.all(5),
                    decoration: BoxDecoration(
                        border: Border.all(
                          width: 1,
                          color: fivehundred
                              ? Color.fromRGBO(0, 150, 136, 1.0)
                              : const Color.fromARGB(125, 158, 158, 158),
                        ),
                        borderRadius: BorderRadius.circular(5)),
                    child: Text(
                      "\$500",
                      style: AppWidget.semiBoldTextFieldStyle(),
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    hundred = false;
                    fivehundred = false;
                    thousand = true;
                    twothousand = false;
                    StripeService.instance.money = 1000;
                    setState(() {});
                  },
                  child: Container(
                    padding: EdgeInsets.all(5),
                    decoration: BoxDecoration(
                        border: Border.all(
                          width: 1,
                          color: thousand
                              ? Color.fromRGBO(0, 150, 136, 1.0)
                              : const Color.fromARGB(125, 158, 158, 158),
                        ),
                        borderRadius: BorderRadius.circular(5)),
                    child: Text(
                      "\$1000",
                      style: AppWidget.semiBoldTextFieldStyle(),
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    hundred = false;
                    fivehundred = false;
                    thousand = false;
                    twothousand = true;
                    StripeService.instance.money = 2000;
                    setState(() {});
                  },
                  child: Container(
                    padding: EdgeInsets.all(5),
                    decoration: BoxDecoration(
                        border: Border.all(
                          width: 1,
                          color: twothousand
                              ? Color.fromRGBO(0, 150, 136, 1.0)
                              : const Color.fromARGB(125, 158, 158, 158),
                        ),
                        borderRadius: BorderRadius.circular(5)),
                    child: Text(
                      "\$2000",
                      style: AppWidget.semiBoldTextFieldStyle(),
                    ),
                  ),
                )
              ],
            ),
          ),
          SizedBox(
            height: 30,
          ),
          Center(
            child: ElevatedButton(
                onPressed: () {
                  if (hundred == false &&
                      fivehundred == false &&
                      thousand == false &&
                      twothousand == false) {
                    StripeService.instance.money = null;
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
                              'Select the amount..!',
                              style: TextStyle(
                                  fontSize: 18,
                                  color: Colors.black87,
                                  fontFamily: "Poppins"),
                            ),
                          );
                        });
                  } else if (StripeService.instance.money != null) {
                    transactioncheck();
                  }
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color.fromRGBO(0, 150, 136, 1.0),
                ),
                child: Text(
                  "Add Money",
                  style: TextStyle(
                      fontFamily: "Poppins", fontSize: 18, color: Colors.white),
                )),
          )
        ],
      ),
    );
  }
}
