import 'dart:html';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shop_app_ui/widgets/BottomBar.dart';
import 'package:shop_app_ui/widgets/Items.dart';

class ItemPage extends StatelessWidget {
  const ItemPage({Key? key}) : super(key: key);
  static const nameRoute = '/detail';

  @override
  Widget build(BuildContext context) {
    final Item = ModalRoute.of(context)!.settings.arguments as item;
    return Scaffold(
      backgroundColor: Colors.green.shade200,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                alignment: Alignment.topLeft,
                child: InkWell(
                  onTap: () {
                    Navigator.pop(context, "homePage");
                  },
                  child: Icon(
                    Icons.arrow_back_rounded,
                    size: 50,
                    color: Colors.green.shade700,
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.all(15),
                height: 350,
                width: double.infinity,
                alignment: Alignment.topLeft,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    image: DecorationImage(
                      image: AssetImage(Item.image),
                    )),
              ),
              Container(
                height: MediaQuery.of(context).size.height * 0.4,
                margin: EdgeInsets.only(top: 15),
                padding: EdgeInsets.all(15),
                decoration: BoxDecoration(
                    color: Colors.white70,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(30),
                      topRight: Radius.circular(30),
                    )),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(top: 10, bottom: 15),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            Item.name,
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 30,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Icon(
                          Icons.star,
                          color: Colors.amber,
                          size: 30,
                        ),
                        Text(
                          "\$${Item.star}/5",
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(
                            height: 20,
                          ),
                      ],
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                          "Cost: \$${Item.cost}",
                          style: TextStyle(
                            fontSize: 25,
                            color: Colors.green.shade700,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                          "Reviewer: ${Item.review}",
                          style: TextStyle(
                            fontSize: 25,
                            color: Colors.green.shade700,
                            fontWeight: FontWeight.bold,
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
      bottomNavigationBar: BottomBar(),
    );
  }
}
