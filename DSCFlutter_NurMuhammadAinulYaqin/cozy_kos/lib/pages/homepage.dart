import 'package:cozy_kos/models/city.dart';
import 'package:cozy_kos/models/space.dart';
import 'package:cozy_kos/models/tips.dart';
import 'package:cozy_kos/providers/spaceprovider.dart';
import 'package:cozy_kos/theme.dart';
import 'package:cozy_kos/widgets/bottomnav.dart';
import 'package:cozy_kos/widgets/citycard.dart';
import 'package:cozy_kos/widgets/spacecard.dart';
import 'package:cozy_kos/widgets/tipscard.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    var spaceProvider = Provider.of<SpaceProvider>(context);
    

    return Scaffold(
      backgroundColor: whiteColor,
      body: SafeArea(
        bottom: false,
        child: ListView(
          children: [
            SizedBox(
              height: edge,
            ),
            Padding(
              padding: EdgeInsets.only(left: edge),
              child: Text(
                'Jelajahi Sekarang!',
                style: blackTextStyle.copyWith(
                  fontSize: 24,
                ),
                ),
            ),
            SizedBox(
              height: 2,
            ),
            Padding(
              padding: EdgeInsets.only(left: edge),
              child: Text(
                'Mencari rumah kos yang cozy',
                style: greyTextStyle.copyWith(
                  fontSize: 16,
                ),
              ),
            ),
            SizedBox(
              height: 30,
            ),
            Padding(
              padding: EdgeInsets.only(left: edge),
              child: Text(
                'Rekomendasi Kota',
                style: regulerTextStyle.copyWith(
                  fontSize: 16,
                ),
              ),
            ),
            SizedBox(
              height: 16,
            ),
            //KOTA POPULER
            Container(
              height: 150,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: [
                  SizedBox(
                    width: 24,
                  ),
                  CityCard(
                    City(
                      id: 1,
                      name: 'Jakarta',
                      imageUrl: 'img/city1.png',
                    )
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  CityCard(
                    City(
                      id: 2,
                      name: 'Bandung',
                      imageUrl: 'img/city2.png',
                      isPopular: true,
                    )
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  CityCard(
                    City(
                      id: 3,
                      name: 'Surabaya',
                      imageUrl: 'img/city3.png',
                    )
                  ),
                  SizedBox(
                    width: 24,
                  ),
                  CityCard(
                    City(
                      id: 4,
                      name: 'Palembang',
                      imageUrl: 'img/city4.png',
                    )
                  ),
                  SizedBox(
                    width: 24,
                  ),
                  CityCard(
                    City(
                      id: 5,
                      name: 'Banda Aceh',
                      imageUrl: 'img/city5.png',
                    )
                  ),
                  SizedBox(
                    width: 24,
                  ),
                  CityCard(
                    City(
                      id: 6,
                      name: 'Bogor',
                      imageUrl: 'img/city6.png',
                    )
                  ),
                  SizedBox(
                    width: 24,
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 30,
            ),
            //NOTE: REKOMENDASI
            Padding(
              padding: EdgeInsets.only(left: edge),
              child: Text(
                'Tempat Favorit',
                style: regulerTextStyle.copyWith(
                  fontSize: 16,
                ),
              ),
            ),
            SizedBox(
              height: 16,
            ),
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: edge,
              ),
              child: 
                FutureBuilder(
                  future: spaceProvider.getRecommendedSpaces(),
                  builder: (context, snapshot) {
                    if(snapshot.hasData) {

                      List<Space> data = snapshot.data;

                      int index = 0;

                      return Column(
                        children: data.map((item){
                          index++;
                          return Container(
                            margin: EdgeInsets.only(
                              top: index == 1 ? 0 : 30,
                            ),
                            child: SpaceCard(item),
                          );
                        }).toList(),
                      );
                      
                    }
                    return Center(
                      child: CircularProgressIndicator(),
                    );
                  }
                )
              
            ),
            SizedBox(
              height: 30,
            ),
            //NOTE: TIPS
            Padding(
              padding: EdgeInsets.only(left: edge),
              child: Text(
                'Tips untuk kamu!',
                style: regulerTextStyle.copyWith(
                  fontSize: 16,
                ),
              ),
            ),
            SizedBox(
              height: 16,
            ),
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: edge,
              ),
              child: Column(
                children: [
                  TipsCard(
                    Tips(
                      id: 1,
                      title: 'Petujuk untukmu!',
                      imageUrl: 'img/tips1.png',
                      updatedAt: '20 Apr'
                    )
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  TipsCard(
                    Tips(
                      id: 2,
                      title: 'Jakarta Fairship!',
                      imageUrl: 'img/tips2.png',
                      updatedAt: '28 Apr'
                    )
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 50 + edge,
            ),
          ],
        ),
      ),

      // Floating Menu Navbar
      floatingActionButton: Container(
                height: 65,
                width: MediaQuery.of(context).size.width - (2 * edge),
                margin: EdgeInsets.symmetric(
                  horizontal: edge,
                ),
                decoration: BoxDecoration(
                  color: Color(0xffF6F7F8),
                  borderRadius: BorderRadius.circular(23),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    BottomNavItem(
                      imageUrl: 'img/iconhome.png',
                      isActive: true,
                    ),
                    BottomNavItem(
                      imageUrl: 'img/iconmail.png',
                      isActive: false,
                    ),
                    BottomNavItem(
                      imageUrl: 'img/iconcard.png',
                      isActive: false,
                    ),
                    BottomNavItem(
                      imageUrl: 'img/iconfav.png',
                      isActive: false,
                    ),
                  ],
                ),
              ),
              floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}