import 'package:flutter/material.dart';
import 'package:testapp/utilities/constants.dart';

class ItemCard extends StatelessWidget {
  final CreditType creditType;
  final double price;
  final String reason;
  const ItemCard({required this.creditType, this.price: 0, this.reason: ''});

  @override
  Widget build(BuildContext context) {
    late IconData _icon;
    late String _typeText;
    switch (creditType) {
      case CreditType.Sent:
        _icon = Icons.north;
        _typeText = 'Sent';
        break;
      case CreditType.Receive:
        _icon = Icons.south;
        _typeText = 'Receive';
        break;
      case CreditType.Loan:
        _icon = Icons.paid;
        _typeText = 'Loan';
        break;
      default:
    }

    return Container(
      width: double.infinity,
      height: 80,
      padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
      decoration: BoxDecoration(
        color: white,
        borderRadius: BorderRadius.circular(25),
        boxShadow: [
          BoxShadow(
            color: gray.withOpacity(0.1),
            offset: Offset(0, 4),
            spreadRadius: 2,
            blurRadius: 6,
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Row(
            children: [
              Container(
                height: 50,
                width: 50,
                decoration: BoxDecoration(
                    color: lightBlue, borderRadius: BorderRadius.circular(20)),
                child: Center(
                  child: Icon(_icon),
                ),
              ),
              SizedBox(width: 10),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    _typeText,
                    style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    reason,
                    style: TextStyle(
                      fontSize: 11,
                      color: gray,
                    ),
                  ),
                ],
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(top: 15),
            child: Text(
              '\$${price.toInt().toString()}',
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
