// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

class DetailScreen extends StatelessWidget {
  DetailScreen({super.key, required this.prode});

  var prode;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('DEFO'),
        automaticallyImplyLeading: false,
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.only(top:20),
              child: Container(
                width: 300,
                height: 300,
                child: Image.network(
                  prode['image'].toString(),
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Text(
              // ignore: avoid_dynamic_calls
              prode['productName'].toString(),
              style: const TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: 20,
            ),
            Text(
              // ignore: avoid_dynamic_calls
              prode['description'].toString(),
              style: const TextStyle(fontWeight: FontWeight.w500),
            ),
            SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton.icon(
                    style: ElevatedButton.styleFrom(
                        backgroundColor: Color(0xFFF50514),),
                    onPressed: () {},
                    icon: Icon(Icons.currency_rupee),
                    label: Text(prode['price'].toString()),),

                    

              ],
            )
          ],
        ),
      ),
    );
  }
}
