import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:news_app/page/news_item_techno.dart';
import 'package:news_app/page/news_item_trend.dart';
import 'package:url_launcher/url_launcher.dart';

import '../data/model/news_model.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String apiUrlTrend = "https://innocent-dscitb.vercel.app/trend.json";
  String apiUrlTechno = "https://innocent-dscitb.vercel.app/news.json";
  News trendNews;
  News technoNews;
  bool isLoading = true;

  var dio = new Dio();

  @override
  void initState() {
    super.initState();
    // getTrendNews();
  }

  Future<void> _launchInBrowser(String url) async {
    await canLaunch(url).then((value) async {
      if (value) {
        await launch(
          url,
          forceSafariVC: true,
          forceWebView: true,
          headers: <String, String>{'my_header_key': 'my_header_value'},
        );
      } else {
        throw 'Cannot launch $url';
      }
    }).catchError((onError) {
      print(onError);
    });

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("MNC News App"),
        actions: [
          IconButton(
            icon: Icon(Icons.search),
            onPressed: (){}
          )
        ],
      ),
      body: SingleChildScrollView(
        physics: ScrollPhysics(),
        scrollDirection: Axis.vertical,
        child: Column(
          children: [
            Align(
              alignment: Alignment.topLeft,
              child: Padding(
                padding: EdgeInsets.only(left: 16, right: 16,top: 8),
                child: Text(
                  "Trending News",
                  style: GoogleFonts.roboto(
                    textStyle: TextStyle(
                      fontSize: 21,
                      fontWeight: FontWeight.bold
                    )
                  ),
                ),
              ),
            ),
            Container(
              width: double.infinity,
              height: 200,
              child: FutureBuilder(
                future: dio.get(apiUrlTrend),
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    final trendResponse = News.fromJson(snapshot.data.data);
                    return ListView.builder(
                      itemCount: trendResponse.data.length,
                      shrinkWrap: true,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context,index){
                        return InkWell(
                          child: Padding(
                            padding: EdgeInsets.fromLTRB(8,8,8,0),
                            child: NewsItemTrend(news: trendResponse.data[index],),
                          ),
                          onTap: () => _launchInBrowser(trendResponse.data[index].url),
                        );
                      }
                    );
                  } else {
                    return Center(
                      child: CircularProgressIndicator(),
                    );
                  }
                },

              ),
            ),
            SizedBox(height: 15,),
            Align(
              alignment: Alignment.topLeft,
              child: Padding(
                padding: EdgeInsets.only(left: 16),
                child: Text(
                  "Techno News",
                  style: GoogleFonts.roboto(
                    textStyle: TextStyle(
                      fontSize: 21,
                      fontWeight: FontWeight.bold
                    )
                  ),
                ),
              ),
            ),
            FutureBuilder(
              future: dio.get(apiUrlTechno),
              builder: (context, snapshot) {
                if (snapshot.hasData){
                  final arr = snapshot.data;
                  print(arr);
                  final technoResponse = News.fromJson(snapshot.data.data);
                  return ListView.builder(
                    itemCount: technoResponse.data.length,
                    shrinkWrap: true,
                    scrollDirection: Axis.vertical,
                    physics: ScrollPhysics(),
                    itemBuilder: (context,index){
                      return InkWell(
                        child: Container(
                          width: double.infinity,
                          height: 135,
                          margin: EdgeInsets.symmetric(horizontal: 18,vertical: 8),
                          child: NewsItemTechno(news: technoResponse.data[index],),
                        ),
                        onTap: () => _launchInBrowser(technoResponse.data[index].url),
                      );
                    }
                  );
                } else {
                  return Center(child: CircularProgressIndicator(),);
                }
              }
            ),
          ],
        ),
      ),
    );
  }
}

