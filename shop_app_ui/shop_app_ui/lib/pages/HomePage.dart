import 'package:badges/badges.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shop_app_ui/widgets/BottomCartSheet.dart';
import 'package:shop_app_ui/widgets/CategoriesWidget.dart';
import 'package:shop_app_ui/widgets/ItemsWidget.dart';
import 'package:shop_app_ui/widgets/NavigationdrawerWidget.dart';
import 'package:shop_app_ui/widgets/PopularItemsWidget.dart';
import 'package:sliding_sheet/sliding_sheet.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.green.shade700,
      body: SafeArea(
       child: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.only(right: 15, left: 15, top: 10),
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [                    
                    InkWell(
                      onTap: () {
                      },
                      child: Icon(
                        Icons.menu,
                        color: Colors.white,
                        size: 30,
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.all(8),
                      decoration: BoxDecoration(
                          color: Colors.green.shade700,
                          borderRadius: BorderRadius.circular(10),
                          boxShadow: [
                            BoxShadow(color: Colors.white70, blurRadius: 2)
                          ]),
                      child: Badge(
                        badgeColor: Colors.red,
                        padding: EdgeInsets.all(6),
                        badgeContent: Text(
                          "9",
                          style: TextStyle(color: Colors.white),
                        ),
                        child: InkWell(
                          onTap: () {
                            showSlidingBottomSheet(
                              context,
                              builder: (context) {
                                return SlidingSheetDialog(
                                    elevation: 8,
                                    cornerRadius: 16,
                                    builder: (context, state) {
                                      return BottomCartSheet();
                                    });
                              },
                            );
                          },
                          child: Icon(
                            CupertinoIcons.cart,
                            size: 30,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ]),
            ),
            //text chào mừng
            Container(
              alignment: Alignment.centerLeft,
              padding: EdgeInsets.symmetric(horizontal: 15),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Welcome",
                      style: TextStyle(
                        fontSize: 35,
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      "What do you want to Buy?",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ]),
            ),

            //search widget
            Container(
              margin: EdgeInsets.all(15),
              padding: EdgeInsets.symmetric(horizontal: 15),
              height: 50,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
              ),
              child: Row(
                children: [
                  Icon(Icons.search),
                  Container(
                    margin: EdgeInsets.only(left: 10),
                    width: 250,
                    child: TextFormField(
                      decoration: InputDecoration(
                        hintText: "Search here...",
                        border: InputBorder.none,
                      ),
                    ),
                  ),
                  Spacer(),
                  Icon(Icons.filter_list),
                ],
              ),
            ),
            // products widget
            Container(
              padding: EdgeInsets.only(top: 20),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(30),
                    topRight: Radius.circular(30)),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CategoriesWidget(),
                  PopularItemsWidget(),
                  ItemsWidget(),
                ],
              ),
            )
          ],
        ),
      )),
    );
  }
}
