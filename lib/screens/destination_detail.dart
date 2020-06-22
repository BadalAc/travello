import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:travello/shared/constants.dart';

class DestinationDetail extends StatefulWidget {
  @override
  _DestinationDetailState createState() => _DestinationDetailState();
}

class _DestinationDetailState extends State<DestinationDetail> {

  String destinationName = "Island Peak Climb in Everest region";
  String destinationPhoto = "https://www.bookmundi.com/blog/wp-content/uploads/2015/10/island-peak.jpg";
  String destinationCategory = "Mountaineering";
  String destinationLocation = "Solukhumbu";
  String destinationDays = "16";
  String destinationPrice = "50,000";
  String destinationDiscount = "30";
  String destinationCollaboration = "assets/images/ingGroup.png";
  String destinationPerson = "1";

  List<String> photos = [
    "https://www.bookmundi.com/blog/wp-content/uploads/2015/10/island-peak.jpg",
    "https://www.sunriseadventuretrek.com/wp-content/uploads/2018/01/Island-Peak-Climbing-990x490.jpg",
    "https://www.caingram.info/Nepalpeaks/Island_peak/Island_pk_ama-dablam-fb-2.jpg",
    "https://www.snowyhorizon.com/slider/island-peak-climbing60.jpg"
  ];

  int current = 0;

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: Color(0xfff9f9f9),
      body: Stack(
        alignment: Alignment.bottomRight,
        children: <Widget>[
          SingleChildScrollView(
            child: SafeArea(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.only(right: 10, top: 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.only(left: 15),
                          child: InkWell(
                            onTap: () {
                              Navigator.pop(context);
                              },
                              child: Icon(Icons.arrow_back, color: Color(0xff003893), size: 24,)),
                        ),
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.only(left: 20, right: 10),
                            child: Stack(
                              alignment: Alignment.centerLeft,
                              children: <Widget>[
                                Container(
                                  height: 35,
                                  child: TextField(
                                      cursorColor: Color(0xff003893),
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
                  SizedBox(height: 10,),
                  CarouselSlider(
                    options: CarouselOptions(
                      height: 200,
                      initialPage: 0,
                      viewportFraction: 0.95,
                      autoPlay: true,
                      reverse: false,
                      autoPlayInterval: Duration(seconds: 2),
                      autoPlayAnimationDuration: Duration(milliseconds: 1000),
                      pauseAutoPlayOnTouch: true,
                      autoPlayCurve: Curves.easeInOut,
                      enlargeCenterPage: true,
                      scrollDirection: Axis.horizontal,
                      onPageChanged: (index, reason) {
                        setState(() {
                          current = index;
                        });
                      }
                    ),
                    items: photos.map(
                            (i) {
                              return Container(
                                decoration: BoxDecoration(
                                  color: Color(0xffffffff),
                                  borderRadius: BorderRadius.circular(15),
                                ),
                                child: ClipRRect(
                                  child: Image.network(
                                    '$i',
                                    width: MediaQuery.of(context).size.width,
                                    fit: BoxFit.cover,
                                  ),
                                  borderRadius: BorderRadius.circular(15),
                                ),
                              );
                            }
                    ).toList(),
                  ),
                  SizedBox(height: 5,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: photos.map((url) {
                      int index = photos.indexOf(url);
                      return AnimatedContainer(
                        duration: Duration(milliseconds: 600),
                        curve: Curves.easeInOut,
                        width: current == index ? 30 : 10,
                        height: 3.0,
                        margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 3),
                        decoration: BoxDecoration(
                          color: current == index
                              ? Color(0xffDC143C)
                              : Color(0xff808080),
                          borderRadius: BorderRadius.circular(10)
                        ),
                      );
                    }).toList(),
                  ),
                  Container(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Center(
                        child: Text(
                          destinationName,
                          textAlign: TextAlign.center,
                          style: GoogleFonts.rubik(
                              textStyle: TextStyle(
                                  fontSize: 23,
                                  fontWeight: FontWeight.w500
                              )
                          ),
                        ),
                      ),
                    ),
                  ),
                  Divider(indent: 40, endIndent: 40,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.only(left: 20),
                        child: Container(
                          height: 40,
                          width: 30,
                          child: destinationCollaboration != null ? Image.asset('$destinationCollaboration') : SizedBox(),
                        ),
                      ),
                      Container(
                        child: Padding(
                          padding: const EdgeInsets.fromLTRB(0,5,20,10),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: <Widget>[
                              destinationDiscount != null ? Text(
                                '-$destinationDiscount%',
                                style: GoogleFonts.rubik(
                                    textStyle: TextStyle(
                                        fontSize: 10,
                                        color: Color(0xffDC143C)
                                    )
                                ),
                              ) : SizedBox(),
                              SizedBox(width: 5,),
                              Text(
                                'Rs. $destinationPrice',
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
                  Padding(
                    padding: const EdgeInsets.fromLTRB(20,5,20,10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Row(
                              children: <Widget>[
                                Icon(Icons.category, size: 18,),
                                SizedBox(width: 10,),
                                Text(
                                  destinationCategory,
                                  style: GoogleFonts.rubik(
                                      textStyle: TextStyle(
                                          fontSize: 15
                                      )
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(height: 5,),
                            Row(
                              children: <Widget>[
                                Icon(Icons.location_on, size: 18,),
                                SizedBox(width: 10,),
                                Text(
                                  destinationLocation,
                                  style: GoogleFonts.rubik(
                                      textStyle: TextStyle(
                                          fontSize: 15
                                      )
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(height: 5,),
                            Row(
                              children: <Widget>[
                                Icon(Icons.person, size: 18,),
                                SizedBox(width: 10,),
                                Text(
                                  destinationPerson,
                                  style: GoogleFonts.rubik(
                                      textStyle: TextStyle(
                                          fontSize: 15
                                      )
                                  ),
                                ),
                              ],
                            )
                          ],
                        ),
                        Stack(
                          alignment: Alignment.center,
                          children: <Widget>[
                            SvgPicture.asset('assets/icons/calendar.svg',height: 55, width: 55,),
                            Positioned(
                              bottom: 3,
                              child: Column(
                                children: <Widget>[
                                  Text(
                                    '$destinationDays',
                                    style: GoogleFonts.rubik(
                                        textStyle: TextStyle(
                                            fontSize: 23,
                                            fontWeight: FontWeight.w500,
                                            color: Color(0xffffffff)
                                        )
                                    ),
                                  ),Text(
                                    'days',
                                    style: GoogleFonts.rubik(
                                        textStyle: TextStyle(
                                            fontSize: 8,
                                            fontWeight: FontWeight.w500,
                                            color: Color(0xffffffff)
                                        )
                                    ),
                                  ),
                                ],
                              ),
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 20, right: 20),
                    child: Center(
                      child: MaterialButton(
                        elevation: 4,
                        height: 40,
                        minWidth: MediaQuery.of(context).size.width,
                        color: Color(0xffffffff),
                        onPressed: () {},
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15)
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            SvgPicture.asset('assets/icons/google.svg', height: 20,),
                            Text(
                              'Search for Nearby Hotels',
                              style: GoogleFonts.rubik(
                                  textStyle: TextStyle(
                                      fontSize: 13,
                                  )
                              ),
                            ),
                            Icon(Icons.search)
                          ],
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 15,),
                  Padding(
                    padding: const EdgeInsets.only(left: 20, right: 20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Text(
                          'Rating and Reviews',
                          style: GoogleFonts.rubik(
                              textStyle: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.w500
                              )
                          ),
                        ),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: <Widget>[
                            Icon(Icons.star, size: 18, color: Colors.amber,),
                            Icon(Icons.star, size: 18, color: Colors.amber,),
                            Icon(Icons.star, size: 18, color: Colors.amber,),
                            Icon(Icons.star, size: 18, color: Colors.amber,),
                            Icon(Icons.star_half, size: 18, color: Colors.amber,),
                            SizedBox(width: 10,),
                            Icon(Icons.group, size: 20,),
                            Text('15', style: TextStyle(fontSize: 10),)
                          ],
                        )
                      ],
                    ),
                  ),
                  SizedBox(height: 10,),
                  Padding(
                    padding: const EdgeInsets.only(left: 20, right: 20),
                    child: Row(
                      children: <Widget>[
                        ClipRRect(
                          borderRadius: BorderRadius.circular(10),
                          child: Container(
                            height: 25,
                            width: 25,
                            decoration: BoxDecoration(
                                border: Border.all(color: Color(0xff003893), width: 2),
                                borderRadius: BorderRadius.all(Radius.circular(10))
                            ),
                            child: Center(child: Text('S', style: GoogleFonts.rubik(textStyle: TextStyle(fontWeight: FontWeight.w500, fontSize: 13, color: Color(0xffDC143C))),)),
                          ),
                        ),
                        SizedBox(width: 10,),
                        Expanded(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: <Widget>[
                              Text(
                                'Sanjiv Gurung',
                                style: GoogleFonts.rubik(
                                    textStyle: TextStyle(
                                        fontSize: 13,
                                    )
                                ),
                              ),
                              SizedBox(width: 5,),
                              Text(
                                '2020-06-22',
                                style: GoogleFonts.rubik(
                                    textStyle: TextStyle(
                                      fontSize: 10,
                                      color: Color(0xff808080)
                                    )
                                ),
                              ),
                            ],
                          ),
                        ),

                      ],
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.fromLTRB(20,5,20,10),
                    child: Text(
                      'This is a very good app with very nice and easy User Interface. All the essential features are included in this app. Thank You.',
                      style: GoogleFonts.rubik(textStyle: TextStyle(color: Color(0xff808080))),
                      textAlign: TextAlign.justify,
                    ),
                  ),
                  Divider(indent: 70, endIndent: 70,),
                  Center(child: Text(
                      'View All Reviews',
                    style: GoogleFonts.rubik(textStyle: TextStyle(color: Color(0xff003893), fontSize: 12)),
                  ),),
                  SizedBox(height: 5,),
                  Padding(
                    padding: const EdgeInsets.only(left: 20),
                    child: Text(
                      'Description',
                      style: GoogleFonts.rubik(
                          textStyle: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w500
                          )
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(20,5,20,10),
                    child: Text(
                      'On your 16-day Island Peak Expedition you will not only reach the summit of the magnificent Island Peak but also experience trekking in the most coveted Everest region. Island Peak also called Imja Tse by the Nepalese is a popular choice among novice climbers who wish to begin their mountaineering journey by summiting Island Peak and then move on to other peaks.  The mountain was named "Island Peak" in 1952 AD due to its striking location in the middle of the Chhukung valley, like an island on a sea of ice. Island Peak has an impressive, highly glaciated west face that rises from the Lhotse Glacier which is a bit tough to do; however, the magnificent views from the summit are certainly a fitting reward for your efforts.',
                      style: GoogleFonts.rubik(),
                      textAlign: TextAlign.justify,
                    ),
                  ),
                  SizedBox(height: 60,)
                ],
              ),
            ),
          ),
          Positioned(
            bottom: 10,
            child: Row(
              children: <Widget>[
                MaterialButton(
                  height: 45,
                  minWidth: 250,
                  color: Color(0xff003893),
                  onPressed: () {},
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15)
                  ),
                  child: Text(
                      'Book Now',
                    style: GoogleFonts.rubik(
                      textStyle: TextStyle(
                        fontSize: 16,
                        color: Color(0xffffffff)
                      )
                    ),
                  ),
                ),
                SizedBox(width: 10,),
                Stack(
                  alignment: Alignment.topRight,
                  children: <Widget>[
                    Icon(Icons.chat_bubble, size: 37, color: Color(0xffDC143C),),
                    Container(
                      height: 10,
                      width: 10,
                      child: CircleAvatar(
                        backgroundColor: Colors.blue,
                      ),
                    )
                  ],
                ),
                SizedBox(width: 10,)
              ],
            ),
          )
        ],
      )
    );
  }
}
