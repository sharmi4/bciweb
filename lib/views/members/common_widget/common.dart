import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../constant/constans.dart';

class CommonScreen extends StatelessWidget {
  const CommonScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      child: PreferredSize(
          child: Stack(
            children: [
              Container(
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                    gradient: LinearGradient(colors: [kblue, kOrange])),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ksizedbox10,
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(left: 7),
                              child: Image.asset(
                                'assets/images/phoneimage.png',
                                height: 15,
                                fit: BoxFit.fitHeight,
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 10),
                              child: InkWell(
                                onTap: () async{
                                  await launchUrl(Uri.parse("tel:9884551551"));
                                },
                                child: Text(
                                  '+91  9884 551 551 / +91  9884 660 660',
                                  style: TextStyle(color: kwhite, fontSize: 13),
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 45),
                              child: Icon(
                                Icons.mail,
                                color: kwhite,
                                size: 15,
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 5),
                              child: InkWell(
                                onTap: ()async {
                                   await launchUrl(Uri.parse("mailto:customercare@bcipvtltd.com"));
                                },
                                child: Text(
                                  'customercare@bcipvtltd.com',
                                  style: TextStyle(color: kwhite, fontSize: 13),
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 45),
                              child: Icon(
                                Icons.location_on,
                                size: 15,
                                color: kwhite,
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 5),
                              child:InkWell(
                                onTap: ()async {
                                   await launchUrl(Uri.parse("https://www.google.com/search?client=ms-android-oneplus-rvo3&sca_esv=595946801&cs=0&output=search&q=Benze+Club+International+Pvt.Ltd&ludocid=10196856849577630497&ibp=gwp;0,7&lsig=AB86z5UBkz5L8tYpXLWTwqQvypY7&kgs=5d9694caf30ce3db&shndl=-1&shem=lscsce,lsp&source=sh/x/loc/hdr/m1/2"));
                                },
                                child: Text(
                                  'Chennai, Tamilnadu - 600026',
                                  style: TextStyle(fontSize: 13, color: kwhite),
                                ),
                              ),
                            )
                          ],
                        ),
                        //next
                        Padding(
                          padding: const EdgeInsets.only(right: 5),
                          child: Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                Text(
                                  'Follow Us :',
                                  style: TextStyle(color: kwhite, fontSize: 15),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(left: 20),
                                  child: InkWell(
                                      onTap: () {
                                        launchUrl(Uri.parse(
                                            "https://www.facebook.com/benzclubinternational"));
                                      },
                                      child: Image.asset(
                                        'assets/images/facebook.png',
                                        height: 15,
                                        fit: BoxFit.fitHeight,
                                      )),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(left: 20),
                                  child: InkWell(
                                      onTap: () {
                                        launchUrl(Uri.parse(
                                            "https://www.facebook.com/benzeclubinternational"));
                                      },
                                      child: InkWell(
                                          onTap: () {
                                            launchUrl(Uri.parse(
                                                "https://twitter.com/happybcigroup"));
                                          },
                                          child: Image.asset(
                                            'assets/images/twitter.png',
                                            fit: BoxFit.fitHeight,
                                            height: 15,
                                          ))),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(left: 20),
                                  child: InkWell(
                                      onTap: () {
                                        launchUrl(Uri.parse(
                                            "https://www.instagram.com/benzeclubinternational"));
                                      },
                                      child: Image.asset(
                                        'assets/images/instagram.png',
                                        height: 15,
                                        fit: BoxFit.fitHeight,
                                      )),
                                ),
                              ]),
                        ),
                      ],
                    ),
                    ksizedbox10
                  ],
                ),
              ),
              ksizedbox10
              // Positioned(
              // left: -2,
              //   top: 0,
              //   child: ClipPath(
              //     clipper: SideCutClipper(),
              //     child: Container(
              //       height: 20,
              //       width: 40  ,
              //       color: kwhite,

              //     )
              //   ),
              // ),
            ],
          ),
          preferredSize: Size(double.infinity, 40)),
    );
  }
}
