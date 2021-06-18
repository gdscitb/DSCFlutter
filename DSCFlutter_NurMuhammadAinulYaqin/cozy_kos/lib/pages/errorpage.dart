import 'package:cozy_kos/pages/homepage.dart';
import 'package:cozy_kos/theme.dart';
import 'package:flutter/material.dart';

class ErrorPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        bottom: false,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                'img/404.png',
                width: 300,
              ),
              SizedBox(
                height: 70,
              ),
              Text(
                'Halaman tidak ditemukan :(',
                style: blackTextStyle.copyWith(
                  fontSize: 24,
                ),
              ),
              SizedBox(
                height: 14,
              ),
              Text(
                'Sepertinya halaman yang Anda tuju\ntelah dihapus atau tidak ada.',
                style: greyTextStyle.copyWith(
                  fontSize: 16,
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(
                height: 50,
              ),
              Container(
                width: 210,
                height: 50,
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
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => HomePage(),
                      ),
                    );
                  },
                  child: Text(
                    'Kembali ke Home',
                    style: whiteTextStyle.copyWith(
                      fontSize: 18,
                    ),
                  ),
                ),
              )
            ],
          ),
        )
      ),
    );
  }
}