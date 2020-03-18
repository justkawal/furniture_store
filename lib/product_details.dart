import 'package:flutter/material.dart';
import 'package:furniture_store/category_model.dart';
import 'package:rating_bar/rating_bar.dart';
import 'header.dart';

class ProductDetails extends StatefulWidget {
  final CategoryModel model;
  ProductDetails(this.model);

  @override
  _ProductDetailsState createState() => _ProductDetailsState();
}

class _ProductDetailsState extends State<ProductDetails> {
  List images = List<String>(), similarImages = List<String>();
  List<int> colorList = [0xFF304B82, 0xFFBB4747, 0xFFF8C187, 0xFF5ABE65];
  int selectedColorIndex = 0,
      scrolledImageIndex = 0,
      selectedSimilarColorIndex = 0;
  int purchaseCount = 1;

  Widget getColors(int index) {
    return GestureDetector(
      onTap: () {
        selectedColorIndex = index;
        setState(() {});
      },
      child: Container(
        padding: EdgeInsets.all(5),
        width: 31,
        height: 31,
        decoration: BoxDecoration(
          border: Border.all(
              color: selectedColorIndex == index
                  ? Color(colorList[index])
                  : Colors.white,
              width: 1),
          color: Colors.transparent,
          borderRadius: BorderRadius.all(
            Radius.circular(31),
          ),
        ),
        child: Container(
          width: 15,
          height: 15,
          decoration: BoxDecoration(
            color: Color(colorList[index]),
            borderRadius: BorderRadius.all(
              Radius.circular(15),
            ),
          ),
        ),
      ),
    );
  }

  Widget getSimilarColorImage(int index) {
    return GestureDetector(
      onTap: () {
        setState(() {
          selectedSimilarColorIndex = index;
        });
      },
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 5),
        margin: EdgeInsets.only(top: 2, bottom: 2, right: 20),
        width: 100,
        decoration: BoxDecoration(
          border: Border.all(
              color: selectedSimilarColorIndex == index
                  ? Color(0xFFC2D8FD)
                  : Colors.transparent,
              width: 2),
          boxShadow: <BoxShadow>[
            BoxShadow(
                color: Color(0xFFE7EEF8),
                blurRadius: 1,
                offset: Offset(2.6, 2.6))
          ],
          color: Color(0xFFFFFFFF),
          borderRadius: BorderRadius.all(
            Radius.circular(20),
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Image(
              image: AssetImage("assets/images/${similarImages[index]}"),
            )
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    images = widget.model.differentImageUrl.keys.toList();
    similarImages = widget.model.differentImageUrl[images[scrolledImageIndex]];
    return Scaffold(
      body: SafeArea(
        child: Container(
          color: Color(0xFFF8F8F8),
          child: Padding(
            padding: EdgeInsets.only(left: 20, right: 20, top: 20),
            child: Column(
              children: <Widget>[
                header(context),
                Expanded(
                  child: ListView(
                    children: <Widget>[
                      SizedBox(height: 28),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Expanded(
                            flex: 12,
                            child: Stack(
                              children: [
                                Container(
                                  height: 220,
                                  padding: EdgeInsets.symmetric(vertical: 30),
                                  decoration: BoxDecoration(
                                    boxShadow: <BoxShadow>[
                                      BoxShadow(
                                        color: Color(0xFFE7EEF8),
                                        blurRadius: 1,
                                        offset: Offset(4.6, 4.6),
                                      )
                                    ],
                                    color: Color(0xFFFFFFFFF),
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(30)),
                                  ),
                                  child: PageView.builder(
                                    itemCount: images?.length ?? 0,
                                    controller:
                                        PageController(viewportFraction: 0.55),
                                    onPageChanged: (i) => setState(() {
                                      selectedSimilarColorIndex = 0;
                                      purchaseCount = 0;
                                      scrolledImageIndex = i;
                                    }),
                                    itemBuilder: (_, i) {
                                      return Container(
                                        margin: EdgeInsets.symmetric(
                                            horizontal: 20),
                                        child: Image(
                                          width: 90,
                                          height: 90,
                                          image: AssetImage(
                                              "assets/images/${images[i]}.png"),
                                        ),
                                      );
                                    },
                                  ),
                                ),
                                Positioned.directional(
                                  end: 15,
                                  top: 15,
                                  textDirection: TextDirection.ltr,
                                  child: GestureDetector(
                                    onTap: () {
                                      print("Heart Pressed");
                                    },
                                    child: Container(
                                      width: 45,
                                      height: 45,
                                      decoration: BoxDecoration(
                                          boxShadow: <BoxShadow>[
                                            BoxShadow(
                                                color: Color(0xFFE3EFFE),
                                                blurRadius: 4.0,
                                                offset: Offset(3.6, 1.7))
                                          ],
                                          color: Color(0xFFFFFFFF),
                                          borderRadius:
                                              BorderRadius.circular(20)),
                                      child: Icon(
                                        Icons.favorite_border,
                                        color: Colors.black,
                                      ),
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ),
                          Expanded(child: SizedBox()),
                          Expanded(
                            flex: 2,
                            child: Container(
                                height: 220,
                                decoration: BoxDecoration(
                                  boxShadow: <BoxShadow>[
                                    BoxShadow(
                                        color: Color(0xFFE7EEF8),
                                        blurRadius: 1,
                                        offset: Offset(2.6, 2.6))
                                  ],
                                  color: Color(0xFFFFFFFF),
                                  borderRadius: BorderRadius.only(
                                    topRight: Radius.circular(45),
                                    bottomLeft: Radius.circular(45),
                                  ),
                                ),
                                child: Padding(
                                  padding: EdgeInsets.symmetric(vertical: 25.0),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    children: colorList
                                        .asMap()
                                        .entries
                                        .map((MapEntry map) =>
                                            getColors(map.key))
                                        .toList(),
                                  ),
                                )),
                          )
                        ],
                      ),
                      SizedBox(height: 28),
                      Container(
                        height: 70,
                        child: ListView(
                          scrollDirection: Axis.horizontal,
                          children: similarImages
                              .asMap()
                              .entries
                              .map((MapEntry map) =>
                                  getSimilarColorImage(map.key))
                              .toList(),
                        ),
                      ),
                      SizedBox(height: 28),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Expanded(
                            flex: 12,
                            child: Container(
                                height: 200,
                                padding: EdgeInsets.symmetric(vertical: 30),
                                decoration: BoxDecoration(
                                  boxShadow: <BoxShadow>[
                                    BoxShadow(
                                      color: Color(0xFFE7EEF8),
                                      blurRadius: 1,
                                      offset: Offset(4.6, 4.6),
                                    )
                                  ],
                                  borderRadius: BorderRadius.only(
                                    topRight: Radius.circular(90),
                                    bottomLeft: Radius.circular(90),
                                  ),
                                  color: Color(0xFFFFFFFFF),
                                ),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: <Widget>[
                                    Text(
                                      widget.model.fullName,
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 28,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    SizedBox(height: 7),
                                    RatingBar.readOnly(
                                      initialRating: 3.5,
                                      size: 25,
                                      filledColor: Color(0xFFF9C532),
                                      isHalfAllowed: false,
                                      filledIcon: Icons.star,
                                      emptyIcon: Icons.star,
                                    ),
                                    SizedBox(height: 7),
                                    Text(
                                      widget.model.price,
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 27,
                                          fontWeight: FontWeight.bold),
                                    )
                                  ],
                                )),
                          ),
                          Expanded(child: SizedBox()),
                          Expanded(
                            flex: 3,
                            child: Container(
                              height: 200,
                              decoration: BoxDecoration(
                                boxShadow: <BoxShadow>[
                                  BoxShadow(
                                      color: Color(0xFFE7EEF8),
                                      blurRadius: 1,
                                      offset: Offset(2.6, 2.6))
                                ],
                                color: Color(0xFFFFFFFF),
                                borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(65),
                                  bottomRight: Radius.circular(65),
                                ),
                              ),
                              child: Padding(
                                padding: EdgeInsets.symmetric(vertical: 25.0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: <Widget>[
                                    GestureDetector(
                                      onTap: () {
                                        if (purchaseCount > 1) {
                                          purchaseCount -= 1;
                                        } else {
                                          purchaseCount = 1;
                                        }
                                        setState(() {});
                                      },
                                      child: Container(
                                        child: Icon(
                                          Icons.remove,
                                          size: 30,
                                          color: purchaseCount < 2
                                              ? Colors.grey
                                              : Colors.black,
                                        ),
                                      ),
                                    ),
                                    Container(
                                        width: 35,
                                        height: 35,
                                        decoration: BoxDecoration(
                                          color: Colors.grey.withOpacity(0.3),
                                          borderRadius: BorderRadius.all(
                                            Radius.circular(35),
                                          ),
                                        ),
                                        child: Center(
                                          child: Text(
                                            purchaseCount.toString(),
                                            style: TextStyle(
                                                fontSize: 18,
                                                fontWeight: FontWeight.bold),
                                          ),
                                        )),
                                    GestureDetector(
                                      onTap: () {
                                        setState(() {
                                          purchaseCount += 1;
                                        });
                                      },
                                      child: Container(
                                        child: Icon(
                                          Icons.add,
                                          size: 30,
                                          color: Colors.black,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
                      SizedBox(height: 28),
                      Padding(
                        padding: EdgeInsets.only(left: 8, right: 8),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: <Widget>[
                            Expanded(
                              child: Text(
                                widget.model.description,
                                maxLines: 2,
                                overflow: TextOverflow.clip,
                                style: TextStyle(fontSize: 25),
                              ),
                            )
                          ],
                        ),
                      ),
                      SizedBox(height: 28),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          Expanded(
                            child: GestureDetector(
                              onTap: () {
                                print("Cart Tapped");
                              },
                              child: Container(
                                margin: EdgeInsets.only(left: 32, right: 32),
                                padding: EdgeInsets.only(left: 35, right: 35),
                                height: 50,
                                decoration: BoxDecoration(
                                  boxShadow: <BoxShadow>[
                                    BoxShadow(
                                        color: Color(0xFFE7EEF8),
                                        blurRadius: 1,
                                        offset: Offset(2.6, 2.6))
                                  ],
                                  color: Color(0xFF06041C),
                                  borderRadius: BorderRadius.only(
                                    topRight: Radius.circular(75),
                                    bottomLeft: Radius.circular(55),
                                  ),
                                ),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: <Widget>[
                                    Icon(Icons.shopping_cart,
                                        color: Colors.white),
                                    SizedBox(width: 9),
                                    Text("Add to cart",
                                        style: TextStyle(
                                            color: Colors.white, fontSize: 24))
                                  ],
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
