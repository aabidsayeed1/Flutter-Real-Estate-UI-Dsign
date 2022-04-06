// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:homedesign/utils/widget_functions.dart';

class DetailTravel extends StatelessWidget {
  dynamic itemData;
  DetailTravel({Key? key, this.itemData}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    ThemeData themeData = Theme.of(context);
    const double padding = 25;
    const sidepadding = EdgeInsets.symmetric(horizontal: padding);
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        // mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Stack(
            children: [
              SizedBox(
                width: double.infinity,
                height: size.height * 0.52,
                child: Image.asset(
                  itemData['image'],
                  fit: BoxFit.cover,
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 80, horizontal: 25),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    InkWell(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: CircleAvatar(
                        child: Icon(Icons.arrow_back),
                      ),
                    ),
                    CircleAvatar(
                      child: Icon(
                        Icons.favorite,
                        color: Colors.red,
                      ),
                    ),
                  ],
                ),
              ),
              Positioned(
                bottom: -0.1,
                child: Container(
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                        topRight: Radius.circular(30),
                        topLeft: Radius.circular(30),
                      )),
                  width: size.width,
                  height: size.height * 0.04,
                ),
              ),
            ],
          ),
          Container(
            decoration: BoxDecoration(
              color: Colors.white,
            ),
            width: double.infinity,
            height: size.height * 0.48,
            child: Padding(
              padding: sidepadding,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    itemData['name'],
                    style: themeData.textTheme.headline2,
                  ),
                  Row(
                    children: [
                      Icon(
                        Icons.pin_drop,
                        size: 30,
                        color: Color(0xffEE684A),
                      ),
                      Text(itemData['place']),
                    ],
                  ),
                  addVerticalSpace(8),
                  Row(
                    children: [
                      Text(
                        '  ${itemData['rating']}  ',
                        style: themeData.textTheme.headline5,
                      ),
                      star(),
                      star(),
                      star(),
                      star(),
                      star(),
                    ],
                  ),
                  addVerticalSpace(20),
                  Row(
                    children: ['About', 'Review', 'Photo', 'Video']
                        .map((e) => Text("    $e      "))
                        .toList(),
                  ),
                  addVerticalSpace(12),
                  Container(
                    margin: EdgeInsets.only(left: 12),
                    width: 50,
                    height: 2.5,
                    color: Color(0xffEE684A),
                  ),
                  Divider(
                    thickness: 1.2,
                    height: 1,
                  ),
                  addVerticalSpace(25),
                  Text(
                    'Description',
                    style: themeData.textTheme.headline4,
                  ),
                  addVerticalSpace(10),
                  SizedBox(
                    height: 130,
                    child: SingleChildScrollView(
                      child: Column(
                        children: [
                          Text(
                              'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Arcu amet tempor, in massa, habitasse habitasse fermentum, sed faucibus. Augue arcu, ac proin accumsan urna morbi diam nunc, tincidunt. Ac turpis amet vitae dui aliquam vitae nunc. Non enim, lorem duis maecenas odio Read More '),
                        ],
                      ),
                    ),
                  ),
                  addVerticalSpace(8),
                  Container(
                    width: size.width * 0.90,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(18),
                        color: Color(0xffEE684A)),
                    child: MaterialButton(
                      onPressed: () {},
                      child: Text(
                        'Save a Trip',
                        style: themeData.textTheme.headline3!.copyWith(
                            color: Colors.white, fontWeight: FontWeight.w900),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Icon star() {
    return Icon(
      Icons.star,
      size: 20,
      color: Color(0xffEE684A),
    );
  }
}
