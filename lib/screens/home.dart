import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:travello/modals/category.dart';
import 'package:travello/modals/destinations.dart';
import 'package:travello/screens/destination_detail.dart';
import 'package:travello/screens/search.dart';
import 'package:travello/shared/constants.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  List<Categories> categories = [
    Categories(categoryName: 'Mountaineering', categoryPicture: 'assets/categoryImages/mountaineering.png'),
    Categories(categoryName: 'Bungee Jumping', categoryPicture: 'assets/categoryImages/bungeeJumping.png'),
    Categories(categoryName: 'River Rafting', categoryPicture: 'assets/categoryImages/rafting.png'),
    Categories(categoryName: 'Hiking and Trekking', categoryPicture: 'assets/categoryImages/hiking.png'),
  ];

  List<Destinations> featuredDestinations = [
    Destinations(
      destinationName: 'Island Peak Climb in Everest region',
      destinationCategory: 'Mountaineering',
      destinationPhoto: 'https://www.bookmundi.com/blog/wp-content/uploads/2015/10/island-peak.jpg',
      destinationLocation: 'Solukhumbu',
      destinationDays: '12',
      destinationPrice: '50,000'
    ),
    Destinations(
      destinationName: 'Manaslu Circuit and Tsum Valley Trek',
      destinationCategory: 'Hiking and Trekking',
      destinationPhoto: 'https://bookatrekking.com/data/images/2019/11/manaslu-circuit-trek-all-you-need-to-know1__header.jpg',
      destinationLocation: 'Manaslu',
      destinationDays: '14',
      destinationPrice: '1,00,000'
    )
  ];
  List<Destinations> popularDestinations = [
    Destinations(
      destinationName: 'HighGround Bungee Jumping in pokhara',
      destinationCategory: 'Bungee Jumping',
      destinationPhoto: 'https://cdn.stunningnepal.com/wp-content/uploads/2018/12/Bungee-Jumping-in-Pokhara.jpg',
      destinationLocation: 'Pokhara',
      destinationDays: '1',
      destinationDiscount: '30',
      destinationPrice: '9,500',
      destinationCollaboration: 'assets/images/ingGroup.png'
    ),
    Destinations(
      destinationName: 'Manaslu Circuit and Tsum Valley Trek',
      destinationCategory: 'Hiking and Trekking',
      destinationPhoto: 'https://bookatrekking.com/data/images/2019/11/manaslu-circuit-trek-all-you-need-to-know1__header.jpg',
      destinationLocation: 'Manaslu',
      destinationDays: '14',
      destinationPrice: '1,00,000'
    )
  ];

  String name = 'Sanjiv';

  GlobalKey<ScaffoldState> _drawerKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _drawerKey,
      backgroundColor: Color(0xfff9f9f9),
      drawer: Drawer(),
      body: SingleChildScrollView(
        child: SafeArea(
          child: Column(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.fromLTRB(13,10,10,10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Container(
                        height: 30,
                        width: 30,
                        child: InkWell(
                          onTap: () {
                            _drawerKey.currentState.openDrawer();
                          },
                            child: SvgPicture.asset('assets/icons/menu.svg',color: Color(0xff003893),)),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        Container(height: 30, width: 30,child: SvgPicture.asset('assets/icons/icon.svg',)),
                        SizedBox(width: 10,),
                        Text(
                          'Travello',
                          style: GoogleFonts.zhiMangXing(
                              textStyle: TextStyle(
                                  fontSize: 25,
                                  letterSpacing: 1
                              )
                          ),
                        ),
                      ],
                    ),
                    ClipRRect(
                      borderRadius: BorderRadius.circular(15),
                      child: Container(
                        height: 40,
                        width: 40,
                        decoration: BoxDecoration(
                          border: Border.all(color: Color(0xff003893), width: 2),
                          borderRadius: BorderRadius.all(Radius.circular(15))
                        ),
                        child: Icon(Icons.person, color: Color(0xffDC143C),),
                      ),
                    )
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 15),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: <Widget>[
                    Text(
                      'Welcome',
                      style: GoogleFonts.rubik(
                        textStyle: TextStyle(
                          fontSize: 30,
                          fontWeight: FontWeight.w500
                        )
                      ),
                    ),
                    SizedBox(width: 5,),
                    Text(
                      '$name,',
                      style: GoogleFonts.rubik(
                        textStyle: TextStyle(
                          fontSize: 20,
                          color: Color(0xff003893)
                        )
                      ),
                    ),
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.only(left: 8.0, right: 15),
                        child: InkWell(
                          onTap: () {
                            Navigator.push(context, MaterialPageRoute(
                                builder: (context) {
                                  return Search();
                                }
                            ));
                          },
                          child: Stack(
                            alignment: Alignment.centerLeft,
                            children: <Widget>[
                              Container(
                                height: 35,
                                child: TextField(
                                  cursorColor: Color(0xff003893),
                                  enabled: false,
                                  decoration: textInputDecoration.copyWith(hintText: 'Search...',contentPadding: new EdgeInsets.only(left: 35, right: 10))
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(left: 8.0),
                                child: Icon(Icons.search, color: Colors.grey,),
                              )
                            ],
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
              SizedBox(height: 10,),
              Padding(
                padding: const EdgeInsets.all(10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.only(left: 10),
                      child: Text(
                        'Categories',
                        style: GoogleFonts.rubik(
                            textStyle: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.w500
                            )
                        ),
                      ),
                    ),
//                  ClipRRect(
//                    borderRadius: BorderRadius.circular(20),
//                    child: Container(
//                      height: 20,
//                      width: 65,
//                      color: Color(0xff003893),
//                      child: Row(
//                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                        children: <Widget>[
//                          Padding(
//                            padding: const EdgeInsets.only(left: 3),
//                            child: Text(
//                              'See all',
//                              style: GoogleFonts.rubik(
//                                textStyle: TextStyle(
//                                  fontSize: 12,
//                                  color: Colors.white
//                                )
//                              ),
//                            ),
//                          ),
//                          Icon(Icons.arrow_forward_ios,color: Colors.white, size: 12,)
//                        ],
//                      ),
//                    ),
//                  )
                  ],
                ),
              ),
              NotificationListener<OverscrollIndicatorNotification>(
                onNotification: (OverscrollIndicatorNotification overscroll) {
                  overscroll.disallowGlow();
                  return false;
                },
                child: Container(
                  height: 125,
                  color: Color(0xfff4f4f4),
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    padding: EdgeInsets.fromLTRB(10,0,0,10),
                    itemCount: categories.length,
                    itemBuilder: (BuildContext context, index) {
                      return Padding(
                        padding: const EdgeInsets.only(right: 10),
                        child: Stack(
                          alignment: Alignment.bottomCenter,
                          children: <Widget>[
                            ClipRRect(
                              borderRadius: BorderRadius.circular(10),
                              child: Container(
                                width: 140,
                                height: 60,
                                color: Color(0xffffffff),
                                child: Align(
                                  alignment: Alignment.bottomCenter,
                                  child: Padding(
                                    padding: const EdgeInsets.only(top: 8),
                                    child: Container(
                                      child: Center(
                                        child: Padding(
                                          padding: const EdgeInsets.all(2),
                                          child: Text(
                                            '${categories[index].categoryName}',
                                            textAlign: TextAlign.center,
                                            style: GoogleFonts.rubik(
                                                textStyle: TextStyle(
                                                )
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            Positioned(
                              top: 5,
                              child: Image.asset(
                                '${categories[index].categoryPicture}',
                                height: 70,
                                width: 120,
                                fit: BoxFit.contain,
                              ),
                            )
                          ],
                        ),
                      );
                    },
                  ),
                ),
              ),
              SizedBox(height: 10,),
              Padding(
                padding: const EdgeInsets.fromLTRB(10,10,20,0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.only(left: 10),
                      child: Text(
                        'Featured  Destinations',
                        style: GoogleFonts.rubik(
                            textStyle: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.w500
                            )
                        ),
                      ),
                    ),
                    ClipRRect(
                      borderRadius: BorderRadius.circular(20),
                      child: Container(
                        height: 23,
                        width: 65,
                        color: Color(0xff003893),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: <Widget>[
                            Padding(
                              padding: const EdgeInsets.only(left: 3),
                              child: Text(
                                'See all',
                                style: GoogleFonts.rubik(
                                  textStyle: TextStyle(
                                    fontSize: 12,
                                    color: Color(0xffffffff)
                                  )
                                ),
                              ),
                            ),
                            Icon(Icons.arrow_forward_ios,color: Color(0xffffffff), size: 12,)
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ),
              Container(
                height: 265,
                child: NotificationListener<OverscrollIndicatorNotification>(
                  onNotification: (OverscrollIndicatorNotification overScroll) {
                    overScroll.disallowGlow();
                    return false;
                  },
                  child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: featuredDestinations.length,
                      itemBuilder: (BuildContext context, index) {
                        return Padding(
                          padding: const EdgeInsets.all(10),
                          child: InkWell(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) {
                                        return DestinationDetail();
                                      }
                                  ));
                            },
                            child: Card(
                              elevation: 3,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20)
                              ),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: <Widget>[
                                  Container(
                                    height: 150,
                                    width: 300,
                                    child: ClipRRect(
                                        borderRadius: BorderRadius.only(topLeft: Radius.circular(20), topRight: Radius.circular(20)),
                                        child: Image.network(featuredDestinations[index].destinationPhoto,fit: BoxFit.cover,height: 100,)),
                                  ),
                                  Container(
                                    height: 25,
                                    width: 300,
                                    child: Center(
                                      child: Padding(
                                        padding: const EdgeInsets.only(left: 10,right: 10),
                                        child: Text(
                                          '${featuredDestinations[index].destinationCategory}',
                                          textAlign: TextAlign.center,
                                          style: GoogleFonts.rubik(
                                              textStyle: TextStyle(
                                                  fontSize: 16,
                                                  color: Color(0xff808080)
                                              )
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                  Container(
                                    height: 60,
                                    width: 300,
                                    child: Center(
                                      child: Padding(
                                        padding: const EdgeInsets.only(left: 5,right: 5),
                                        child: Text(
                                          featuredDestinations[index].destinationName,
                                          textAlign: TextAlign.center,
                                          style: GoogleFonts.rubik(
                                              textStyle: TextStyle(
                                                  fontSize: 20,
                                                  fontWeight: FontWeight.w500
                                              )
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        );
                      }
                  ),
                ),
              ),
              Container(
                padding: EdgeInsets.only(top: 20, bottom: 20),
                decoration: BoxDecoration(
                    color: Color(0xffF0F0F4),
                    borderRadius: BorderRadius.only(topLeft: Radius.circular(20), topRight: Radius.circular(20))
                ),
                child: Column(
                  children: <Widget>[
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.only(left: 20),
                          child: Text(
                              'Popular  Destinations',
                              style: GoogleFonts.rubik(
                                textStyle: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.w500,
                                ),
                              )
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(right: 20),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(20),
                            child: Container(
                              height: 23,
                              width: 65,
                              color: Color(0xff003893),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                children: <Widget>[
                                  Padding(
                                    padding: const EdgeInsets.only(left: 3),
                                    child: Text(
                                      'See all',
                                      style: GoogleFonts.rubik(
                                          textStyle: TextStyle(
                                              fontSize: 12,
                                              color: Color(0xffffffff)
                                          )
                                      ),
                                    ),
                                  ),
                                  Icon(Icons.arrow_forward_ios,color: Color(0xffffffff), size: 12,)
                                ],
                              ),
                            ),
                          )
                        )
                      ],
                    ),
                    SizedBox(height: 5,),
                    Column(
                        children: popularDestinations.map((popularDestinations) {
                          return Padding(
                            padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
                            child: Card(
                              elevation: 3,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20)
                              ),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Container(
                                    height: 121.1,
                                    width: 100,
                                    child: ClipRRect(
                                        child: Image.network(popularDestinations.destinationPhoto, fit: BoxFit.cover,),
                                        borderRadius: BorderRadius.only(topLeft: Radius.circular(20), bottomLeft: Radius.circular(20))
                                    ),
                                  ),
                                  Expanded(
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.center,
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: <Widget>[
                                        SizedBox(height: 5,),
                                        Container(
                                          height: 55,
                                          child: Padding(
                                            padding: const EdgeInsets.only(left: 5, right: 5),
                                            child: Center(
                                              child: Text(
                                                popularDestinations.destinationName,
                                                textAlign: TextAlign.center,
                                                style: GoogleFonts.rubik(
                                                    textStyle: TextStyle(
                                                        fontSize: 17,
                                                        fontWeight: FontWeight.w500
                                                    )
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                        Row(
                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                          children: <Widget>[
                                            Padding(
                                              padding: const EdgeInsets.only(left: 20),
                                              child: Text(
                                                'Days :  ${popularDestinations.destinationDays}',
                                                style: GoogleFonts.rubik(
                                                    textStyle: TextStyle(
                                                        fontSize: 15,
                                                        color: Color(0xff808080)
                                                    )
                                                ),
                                              ),
                                            ),
                                            Padding(
                                              padding: const EdgeInsets.only(right: 20),
                                              child: Text(
                                                '${popularDestinations.destinationLocation}',
                                                style: GoogleFonts.rubik(
                                                    textStyle: TextStyle(
                                                        fontSize: 15,
                                                        color: Color(0xff808080)
                                                    )
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                        Row(
                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                          children: <Widget>[
                                            Padding(
                                              padding: const EdgeInsets.only(left: 20),
                                              child: Container(
                                                height: 40,
                                                width: 30,
                                                child: popularDestinations.destinationCollaboration != null ? Image.asset('${popularDestinations.destinationCollaboration}') : SizedBox(),
                                              ),
                                            ),
                                            Container(
                                              child: Padding(
                                                padding: const EdgeInsets.fromLTRB(0,5,20,10),
                                                child: Row(
                                                  crossAxisAlignment: CrossAxisAlignment.end,
                                                  mainAxisAlignment: MainAxisAlignment.end,
                                                  children: <Widget>[
                                                    popularDestinations.destinationDiscount != null ? Text(
                                                      '-${popularDestinations.destinationDiscount}%',
                                                      style: GoogleFonts.rubik(
                                                          textStyle: TextStyle(
                                                              fontSize: 10,
                                                              color: Color(0xffDC143C)
                                                          )
                                                      ),
                                                    ) : SizedBox(),
                                                    SizedBox(width: 5,),
                                                    Text(
                                                      'Rs. ${popularDestinations.destinationPrice}',
                                                      style: GoogleFonts.rubik(
                                                          textStyle: TextStyle(
                                                              fontSize: 20,
                                                              color: Colors.green,
                                                              fontWeight: FontWeight.w500
                                                          )
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  )
                                ],
                              ),
                            ),
                          );
                        }
                        ).toList()
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
