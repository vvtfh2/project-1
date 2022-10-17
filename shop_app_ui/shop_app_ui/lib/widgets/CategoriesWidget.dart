import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:scroll_snap_list/scroll_snap_list.dart';
import 'package:shop_app_ui/widgets/Categorie.dart';

@override
class CategoriesWidget extends StatelessWidget {
  CategoriesWidget({Key? key}) : super(key: key);
  List<categorie> categories = [
    categorie(01, 'images/Figure.png', 'Figure'),
    categorie(02, 'images/Rubik.png', 'Rubik'),
    categorie(03, 'images/Book.png', 'Book'),
    categorie(04, 'images/Clothers.png', 'Clothers'),
    categorie(05, 'images/Technological.png', 'Technological'),
  ];

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Padding(
        padding: const EdgeInsets.only(left: 10, right: 10, bottom: 10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "Category",
              style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                  color: Colors.green.shade800),
            ),
          ],
        ),
      ),
      SizedBox(
        height: 150,
        child: ScrollSnapList(
          itemBuilder: _buildListCategorie,
          itemCount: categories.length,
          itemSize: 150,
          onItemFocus: (index) {},
          dynamicItemSize: true,
        ),
      )
    ]);
  }

  Widget _buildListCategorie(BuildContext context, int index) {
    categorie Categorie = categories[index];
    return SizedBox(
      width: 150,
      height: 120,
      child: Card(
        elevation: 12,
        child: ClipRRect(
          borderRadius: BorderRadius.all(Radius.circular(10)),
          child: Column(
            children: [
              Image.asset(
                Categorie.image,
                fit: BoxFit.cover,
                width: 100,
                height: 100,
              ),
              SizedBox(
                height: 5,
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 8),
                child: Text(
                  Categorie.name,
                  style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
