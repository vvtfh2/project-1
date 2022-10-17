import 'package:flutter/material.dart';
import 'package:scroll_snap_list/scroll_snap_list.dart';
import 'package:shop_app_ui/widgets/Items.dart';

import '../pages/ItemPage.dart';

class PopularItemsWidget extends StatelessWidget {
   PopularItemsWidget({Key? key}) : super(key: key);
  List<item> items = [
    item('images/Raiden.png', 'Raiden Shogun figure', 150, 68,4.7),
    item('images/Book1.png', 'Đắc nhân tâm', 15, 73,5),
    item('images/ao1.png', 'Áo phông nam', 74, 120,4.6),
    item('images/3x3.png', 'Rubik 3x3', 5, 96,3.9),
    item('images/banphim1.png', 'Bàn phím cơ', 56, 137,4.2),
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.only(left: 10, right: 10, bottom: 5, top: 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Popular",
                style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                    color: Colors.green.shade800),
              ),
            ],
          ),
        ),
        SizedBox(
          height: 250,
          child: ScrollSnapList(
            itemBuilder: _buildListPopularItems,
            itemCount: items.length,
            itemSize: 150,
            onItemFocus: (index) {},
            dynamicItemSize: true,
          ),
        )
      ],
    );
  }
  Widget _buildListPopularItems(BuildContext context, int index) {
    item Item = items[index];
    return SizedBox(
      width: 150,
      height: 250,
      child: Card(
        elevation: 12,
        child: ClipRRect(
          borderRadius: BorderRadius.all(Radius.circular(15)),
          child: Column(
            children: [
              InkWell(
                onTap: () {
                  Navigator.pushNamed(context, ItemPage.nameRoute, arguments: Item);
                },
                child: Container(
                  padding: EdgeInsets.all(10),
                  child: Image.asset(
                    Item.image,
                    fit: BoxFit.cover,
                    width: 150,
                    height: 150,
                  ),
                ),
              ),
              SizedBox(
                height: 5,
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 8),
                child: Container(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    Item.name,
                    style: TextStyle(
                      fontSize: 13,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 5),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Column(
                      children: [
                        Text(
                          "\$${Item.cost}",
                          style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                            color: Colors.green.shade700,
                          ),
                        ),
                        SizedBox(height: 5,),
                        Text(
                          "${Item.review} Revirews",
                          style: TextStyle(
                            fontSize: 10,
                            fontWeight: FontWeight.bold,
                            color: Colors.green.shade700,
                          ),
                        ),
                      ],
                    ),
                    InkWell(
                      onTap: () {},
                      child: Container(
                        padding: EdgeInsets.all(8),
                        decoration: BoxDecoration(
                          color: Colors.green.shade700,
                            borderRadius: BorderRadius.circular(10),
                          ),
                        child: Icon(
                          Icons.add_shopping_cart,
                          color: Colors.white,
                        ),
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
