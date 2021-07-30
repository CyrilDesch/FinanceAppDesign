import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:testapp/utilities/constants.dart';
import 'package:testapp/widgets/itemCard.dart';

class AddScreen extends StatefulWidget {
  const AddScreen({Key? key}) : super(key: key);

  @override
  _AddScreenState createState() => _AddScreenState();
}

class _AddScreenState extends State<AddScreen> {
  @override
  Widget build(BuildContext context) {
    return NotificationListener<OverscrollIndicatorNotification>(
      onNotification: (overscroll) {
        overscroll.disallowGlow();
        return true;
      },
      child: SingleChildScrollView(
        padding: EdgeInsets.fromLTRB(20, 0, 20, 50),
        child: Column(
          children: [
            SizedBox(height: 10),
            FadeInUp(
              delay: Duration(milliseconds: 500),
              duration: Duration(milliseconds: 800),
              from: 10,
              child: Container(
                height: 310,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: white,
                  borderRadius: BorderRadius.circular(20),
                  boxShadow: [
                    BoxShadow(
                      color: gray.withOpacity(0.1),
                      offset: Offset(0, 4),
                      spreadRadius: 2,
                      blurRadius: 6,
                    ),
                  ],
                ),
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Icon(
                            Icons.drag_handle,
                            color: blue,
                          ),
                          Icon(
                            Icons.more_vert,
                            color: blue,
                            size: 18,
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 5),
                    CircleAvatar(
                      radius: 45,
                      backgroundColor: white,
                      backgroundImage: NetworkImage(
                          "https://upload.wikimedia.org/wikipedia/commons/thumb/b/b6/Image_created_with_a_mobile_phone.png/250px-Image_created_with_a_mobile_phone.png",
                          scale: 1),
                    ),
                    SizedBox(height: 15),
                    Text(
                      "Victor Pointet",
                      style: TextStyle(
                        color: blue,
                        fontSize: 22,
                        fontWeight: FontWeight.w900,
                      ),
                    ),
                    SizedBox(height: 3),
                    Text(
                      "Fisherman",
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 11,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 30),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Column(
                            children: [
                              Text(
                                '\$8050',
                                style: TextStyle(
                                  color: blue,
                                  fontWeight: FontWeight.w500,
                                  fontSize: 17,
                                ),
                              ),
                              SizedBox(height: 8),
                              Text(
                                "Income",
                                style: TextStyle(
                                  fontSize: 10,
                                ),
                              ),
                            ],
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 18),
                            child: Container(
                              height: 45,
                              width: 0.5,
                              color: gray,
                            ),
                          ),
                          Column(
                            children: [
                              Text(
                                '\$5500',
                                style: TextStyle(
                                  color: blue,
                                  fontWeight: FontWeight.w500,
                                  fontSize: 17,
                                ),
                              ),
                              SizedBox(height: 8),
                              Text(
                                "Expanses",
                                style: TextStyle(
                                  fontSize: 10,
                                ),
                              ),
                            ],
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 18),
                            child: Container(
                              height: 45,
                              width: 0.5,
                              color: gray,
                            ),
                          ),
                          Column(
                            children: [
                              Text(
                                '\$890',
                                style: TextStyle(
                                  color: blue,
                                  fontWeight: FontWeight.w500,
                                  fontSize: 17,
                                ),
                              ),
                              SizedBox(height: 8),
                              Text(
                                "Loan",
                                style: TextStyle(
                                  fontSize: 10,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 20),
            FadeInUp(
              delay: Duration(milliseconds: 1000),
              duration: Duration(milliseconds: 800),
              from: 10,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Text(
                        "Overview",
                        style: TextStyle(
                            color: blue,
                            fontSize: 23,
                            fontWeight: FontWeight.bold),
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(10, 1, 0, 0),
                        child: Icon(
                          Icons.notifications_active_outlined,
                          size: 20,
                        ),
                      ),
                    ],
                  ),
                  Text(
                    "Jun 19, 2021",
                    style: TextStyle(
                      color: blue,
                      fontSize: 12,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 20),
            FadeInUp(
              delay: Duration(milliseconds: 1300),
              duration: Duration(milliseconds: 800),
              from: 10,
              child: ItemCard(
                creditType: CreditType.Sent,
                reason: 'Sending Payment to Clients',
                price: 205.5,
              ),
            ),
            SizedBox(height: 13),
            FadeInUp(
              delay: Duration(milliseconds: 1600),
              duration: Duration(milliseconds: 800),
              from: 10,
              child: ItemCard(
                creditType: CreditType.Receive,
                reason: 'Receiving Salary from company',
                price: 8050,
              ),
            ),
            SizedBox(height: 13),
            FadeInUp(
              delay: Duration(milliseconds: 1900),
              duration: Duration(milliseconds: 800),
              from: 10,
              child: ItemCard(
                creditType: CreditType.Loan,
                reason: 'Loan for the car',
                price: 450,
              ),
            ),
            SizedBox(height: 13),
          ],
        ),
      ),
    );
  }
}
