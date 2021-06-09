import 'package:cozy_kos/models/space.dart';
import 'package:cozy_kos/pages/errorpage.dart';
import 'package:cozy_kos/theme.dart';
import 'package:cozy_kos/widgets/facility.dart';
import 'package:cozy_kos/widgets/rating.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class DetailPage extends StatelessWidget {
  final Space space;

  DetailPage(this.space);

  @override
  Widget build(BuildContext context) {

    // launchUrl(String url) async{
    //   if(await canLaunch(url)){
    //     launch(url);
    //   } 
    //   else {
    //     throw(url);
    //   }
    // };

    launchUrl (String Url) async {
      if (await canLaunch(Url)) {
        await launch(Url, forceWebView: false);
      }
      else {
        // throw(Url);
        Navigator.push(
          context, 
          MaterialPageRoute(
            builder: (context) => ErrorPage(),
          )
        );
      }
    }

    return Scaffold(
      backgroundColor: whiteColor,
      body: SafeArea(
        bottom: false,
        child: Stack(
          children: [
            Image.network(
              space.imageUrl,
              width: MediaQuery.of(context).size.width,
              height: 350,
              fit: BoxFit.cover,
            ),
            
            ListView(
              children: [
                SizedBox(
                  height: 328,
                ),
                Container(
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.vertical(
                      top: Radius.circular(20),
                    ),
                    color: whiteColor,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: 30,
                      ),
                      // NOTE: TITLE
                      Padding(
                        padding: EdgeInsets.symmetric(
                          horizontal: edge,
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  space.name,
                                  style: blackTextStyle.copyWith(
                                    fontSize: 22,
                                  ),
                                ),
                                SizedBox(
                                  height: 2,
                                ),
                                Text.rich(
                                  TextSpan(
                                    text: '\$${space.price}',
                                    style: purpleTextStyle.copyWith(
                                      fontSize: 16,
                                    ),
                                    children: [
                                      TextSpan(
                                        text: ' / month',
                                        style: greyTextStyle.copyWith(
                                          fontSize: 16,
                                        )
                                      )
                                    ]
                                  )
                                ),
                              ],
                            ),
                            Row(
                              children: [1, 2, 3, 4, 5].map((index) {
                                return Container(
                                  margin: EdgeInsets.only(
                                    left: 2,
                                  ),
                                  child: RatingItem(
                                    index: index,
                                    rating: space.rating,
                                  ),
                                );
                              }).toList()
                               
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 30,
                      ),
                      // NOTE: MAIN FACILITIES
                      Padding(
                        padding: EdgeInsets.only(left: edge),
                        child: Text(
                          'Fasilitas Utama',
                          style: regulerTextStyle.copyWith(
                            fontSize: 16,
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 12,
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(
                          horizontal: edge,
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            FacilityItem(
                              name: 'Dapur',
                              imageUrl: 'img/kitchen.png',
                              total: space.numberOfKitchen,
                            ),
                            FacilityItem(
                              name: 'Kasur',
                              imageUrl: 'img/bedroom.png',
                              total: space.numberOfBedroom,
                            ),
                            FacilityItem(
                              name: 'Lemari',
                              imageUrl: 'img/cupboard.png',
                              total: space.numberOfCupboard,
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 30,
                      ),

                      // NOTE: FOTO
                      Padding(
                        padding: EdgeInsets.only(left: edge),
                        child: Text(
                          'Foto',
                          style: regulerTextStyle.copyWith(
                            fontSize: 16,
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 12,
                      ),
                      Container(
                        height: 88,
                        child: ListView(
                          scrollDirection: Axis.horizontal,
                          children: 
                            space.photos.map((item) {
                              return Container(
                                margin: EdgeInsets.only(
                                  left: 24,
                                ),
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(16),
                                  child: Image.network(
                                    item,
                                    width: 110,
                                    height: 88,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              );
                            }).toList()

                            // SizedBox(
                            //   width: edge,
                            // ),
                            // Image.asset(
                            //   'img/foto1.png',
                            //   width: 110,
                            //   height: 88,
                            //   fit: BoxFit.cover,
                            // ),
                            // SizedBox(
                            //   width: 18,
                            // ),
                            // Image.asset(
                            //   'img/foto2.png',
                            //   width: 110,
                            //   height: 88,
                            //   fit: BoxFit.cover,
                            // ),
                            // SizedBox(
                            //   width: 18,
                            // ),
                            // Image.asset(
                            //   'img/foto3.png',
                            //   width: 110,
                            //   height: 88,
                            //   fit: BoxFit.cover,
                            // ),
                            // SizedBox(
                            //   width: edge,
                            // ),
                          
                        ),
                      ),
                      SizedBox(
                        height: 30,
                      ),

                      //NOTE: LOKASI
                      Padding(
                        padding: EdgeInsets.only(left: edge),
                        child: Text(
                          'Lokasi',
                          style: regulerTextStyle.copyWith(
                            fontSize: 16,
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 6,
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(
                          horizontal: edge,
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              '${space.address}\n${space.city}',
                              style: greyTextStyle,
                            ),
                            InkWell(
                              onTap: () async {
                                launchUrl(space.mapUrl);
                              },
                              child: Image.asset(
                                'img/pinmap.png',
                                width: 40,
                              ),
                            ),
                            
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 40,
                      ),
                      Container(
                        margin: EdgeInsets.symmetric(
                          horizontal: edge,
                        ),
                        height: 50,
                        width: MediaQuery.of(context).size.width - (2 * edge),
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            primary: purpleColor,
                            shape: const RoundedRectangleBorder(
                                borderRadius: BorderRadius.all(
                                  Radius.circular(
                                    17,
                                ),
                              ),
                            ),
                          ),
                          onPressed: () async {
                            launchUrl('tel:${space.phone}');
                          },
                          child: Text(
                            'Pesan Sekarang',
                            style: whiteTextStyle.copyWith(
                              fontSize: 18,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 40,
                      ),
                    ],
                  ),
                )
              ],
            ),
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: edge,
                vertical: 30,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  InkWell(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Image.asset(
                      'img/back.png',
                      width: 40,
                    ),
                  ),
                  Image.asset(
                    'img/wishlist.png',
                    width: 40,
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}