import "package:app/widget_support/Widget_support.dart";
import "package:flutter/material.dart";

class Profile extends StatefulWidget {
  const Profile({super.key});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Stack(
          children: [
            Container(
              decoration: BoxDecoration(color: Colors.white),
            ),
            Container(
              width: MediaQuery.of(context).size.width / 1,
              height: MediaQuery.of(context).size.height / 4,
              decoration: BoxDecoration(
                  color: Colors.black,
                  borderRadius: BorderRadius.only(
                      bottomRight: Radius.elliptical(150, 40),
                      bottomLeft: Radius.elliptical(150, 40))),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SizedBox(
                  height: 20,
                ),
                Text(
                  "Name",
                  style: TextStyle(fontSize: 18, color: Colors.white),
                ),
                SizedBox(
                  height: 10,
                ),
                Container(
                  alignment: Alignment.topCenter,
                  width: MediaQuery.of(context).size.width / 2.6,
                  height: MediaQuery.of(context).size.height / 3.5,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(100),
                      color: Colors.amber),
                ),
                Column(
                    children:
                        List.generate(5, (index) => profilebox(context, index)))
              ],
            )
          ],
        ),
      ),
    );
  }

  Widget profilebox(BuildContext context, index) {
    Icon? thisicon;
    String? boxtitle;
    String? profiledata;

    if (index == 0) {
      thisicon = const Icon(Icons.person) as Icon?;
      boxtitle = "Name";
      profiledata = "person";
    } else if (index == 1) {
      thisicon = const Icon(Icons.email) as Icon?;
      boxtitle = "Email";
      profiledata = "person@email.com";
    } else if (index == 2) {
      thisicon = const Icon(Icons.pages) as Icon?;
      boxtitle = "Terms and Condition";
    } else if (index == 3) {
      thisicon = const Icon(Icons.delete) as Icon?;
      boxtitle = "Delete Account";
    } else if (index == 4) {
      thisicon = const Icon(Icons.logout);
      boxtitle = "LogOut";
    }
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Material(
        elevation: 5,
        borderRadius: BorderRadius.circular(10),
        child: SizedBox(
          width: MediaQuery.of(context).size.width / 1.1,
          height: MediaQuery.of(context).size.height / 7,
          child: Row(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: thisicon,
              ),
              Column(
                children: [
                  Text(
                    boxtitle!,
                    style: TextStyle(fontSize: 18, color: Colors.black),
                  ),
                  index < 2
                      ? Text(
                          profiledata!,
                          style: TextStyle(fontSize: 18, color: Colors.black),
                        )
                      : SizedBox.shrink()
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
