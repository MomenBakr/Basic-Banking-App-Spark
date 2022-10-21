



import 'package:basic_banking_app/modules/transfer/transfer_money_screen.dart';
import 'package:flutter/material.dart';

Widget DesignScreen() => InkWell(
  onTap: (){
    navigateTo(BuildContext, TransferMoneyScreen());
  },
  child:   Padding(
    padding: EdgeInsets.symmetric(vertical: 25.0, horizontal: 10),
    child: Row(
      children: [
        Icon(
          Icons.person,
          size: 35,
        ),
        SizedBox(
          width: 15,
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              'User Name',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: 15,
            ),
            Text(
              'User Email',
              style: TextStyle(fontSize: 20),
            ),
          ],
        ),
        Spacer(),
        Text(
          '1000000\$',
          style: TextStyle(fontSize: 20, color: Colors.green),
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
        ),
      ],
    ),
  ),
);

void navigateTo(context, widget) => Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => widget),
    );
