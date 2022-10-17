import 'package:flutter/material.dart';
import 'package:shop_app_ui/pages/ItemPage.dart';
import 'Items.dart';

class ItemsWidget extends StatelessWidget {
  ItemsWidget({Key? key}) : super(key: key);
  List<item> items = [
    item('images/Raiden.png', 'Raiden Shogun figure', 150, 68,4.7),
    item('images/Book1.png', 'Đắc nhân tâm', 15, 73,5),
    item('images/ao1.png', 'Áo phông nam', 74, 120,4.6),
    item('images/3x3.png', 'Rubik 3x3', 5, 96,3.9),
    item('images/banphim1.png', 'Bàn phím cơ', 56, 137,4.2),
    item('images/Yae.png', 'Yae Miko figure', 150, 97,4.7),
    item('images/ao3.png', 'Áo phông nam', 74, 120,4.1),
    item('images/4x4.png', 'Rubik 4x4', 5, 96,4.5),
    item('images/banphim1.png', 'Bàn phím cơ', 56, 137,5),
    item('images/Ayaka.png', 'Ayaka figure', 150, 68,4.2),
    item('images/Ganyu.png', 'Ganyu Figure', 15, 73,4.4),
    item('images/ao2.png', 'Áo phông nam', 74, 120,4.8),
    item('images/5x5.png', 'Rubik 5x5', 5, 96,4.2),
    item('images/banphim2.png', 'Bàn phím cơ', 56, 137,5),
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.only(left: 10, right: 10, top: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Top",
                style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                    color: Colors.green.shade800),
              ),
            ],
          ),
        ),
         GridView.count(
          padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
          crossAxisCount: 2,
          childAspectRatio: 0.8,
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
          physics: NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          children: items.map((Item) {
            return StationItem(Item: Item); 
          }).toList(),
        ),
      ],
    );
  }
}

class StationItem extends StatelessWidget {
  const StationItem({Key? key, required this.Item}) : super(key: key);
  final item Item;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Container(
        alignment: Alignment.center,
        child: 
        Column(
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
                    width: 120,
                    height: 120,
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
    );
  }
}
