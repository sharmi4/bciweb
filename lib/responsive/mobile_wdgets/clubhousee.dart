import 'package:bciweb/constant/constans.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

//import '../registerhomescreen/common_reg_bottom.dart';
//import '../registerhomescreen/common_reg_homescreen.dart';
//import '../responsive/mobile_wdgets/mobile_common_bottom/bottom.dart';
import 'comomappbar.dart';
//import 'members/common_widget/common.dart';
import 'drawer.dart';
import 'mobile_common_bottom/bottom.dart';

class ClubHousemob extends StatelessWidget {
  const ClubHousemob({super.key});

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: PreferredSize(
          child: AppBarMob(), preferredSize: Size(double.infinity, 40)),
          drawer:MobileDrawer(),
      body: SingleChildScrollView(
        child: Column(
          children: [
          
            NewWidgett(
              size: size,
              img1: 'assets/images/ccc.jpg',
              img2: 'assets/images/ddd.jpg',
              heading1: 'SQUASH IN',
              heading2: 'YOGA',
              text1:
                  '     We have a state-of-the-art Squash court with unpolished pine-wood flooring. Whether you want to get your squash thrill back or pick up a racket for the first time, you’ll find squash an exciting, indoor court-based game for all ages.',
              text2:
                  'The Anbu Yoga Nilayam is a fun, energising and flowing yoga class with enhancing music, will surely going to refresh your mind and body. Traditional yoga, Therapeutic Yoga, Power Yoga and Kids Yoga are available. One of the main goals is to gradually improve flexibility, balance, and strength. ',
            ),
            ksizedbox20,
            NewWidgett(
                size: size,
                img1: 'assets/images/EEE.jpg',
                img2: 'assets/images/FFF.jpg',
                text2:
                    'We have 2 Indoor International Standard Synthetic Badminton courts to help you enjoy your route to peak fitness! Singles or doubles, badminton is fun and exciting while also boosting your physique, speed, concentration and stamina. making this sport an effective cardiovascular workout to keep you in top shape!',
                text1:
                    '     "BENZE EATREAT" , our fine-dining multicuisine restaurant serving lip-smacking culinary delights from 7.00 a.m. to 10.00 p.m. Snug seating, fresh food and friendly service make this an excellent spot to meet and greet your guests and entertain them with mocktails and starters.',
                heading2: 'SMASH - BATMINTON',
                heading1: '"BENZE EATREAT"  RESTAURANT'),
            ksizedbox20,
            NewWidgett(
                size: size,
                img1: 'assets/images/WhatsApp Image 2023-05-31 at 18.04.12.jpg',
                img2: 'assets/images/GG.jpg',
                text1:
                    'Our executive rooms are located on the 2nd & 3rd floors. They provide a magnificent view of the hill nearby with a lush green backdrop and swimming pool, all of which you can enjoy through the huge floor-to-ceiling-windows. These rooms are specially designed to create the perfect setting for a romantic weekend or a business visit. You will also have access to our clubhouse facilities and our ',
                text2:
                    '''     Our plush 60-seater movie theatre is in the 2nd floor for you to enjoy your favorite flicks with breathtaking sound effects. 
Our library houses all kinds of books. It’s the perfect space for you to spend some much needed alone times in silence, in the company of your favorite books.
We also have an exquisitely manicured lawn where ceremonies and gatherings are often held and an outdoor Amphitheatre to manage stage events.
''',
                heading1: 'EXECUTIVE ROOMS & BANQUET HALL',
                heading2: 'MOVIE THEATRE & LIBRARY'),
            ksizedbox20,
            NewWidgett(
                size: size,
                img1: 'assets/images/WhatsApp Image 2023-05-31 at 17.59.28.jpg',
                img2: 'assets/images/WhatsApp Image 2023-05-31 at 18.04.12.jpg',
                text1:
                    'Our state-of-the art GYM will will aid you in strengthening  muscles, heart, bones and lowers our blood pressure and of course, reduces body fat and overall keep you fit and in good shape.',
                text2:
                    '''If you want to keep you away from the stress of routine life and create happy memories with your family & friends, CLUB IXORA is one of the best Clubhouses you can reckon for a collective experience of FUN-FIT-ERTAINMENT; Club IXORA is located in the friendly township of Bollineni Hill side, Perumbakkam, OMR.
We offer our members and their guests, an exceptional array of amenities-facilities viz. Gym, SPA, Swimming Pool, Virtual golf, Yoga, Dance, Aerobics, Adventure sports, Squash, Table Tennis, Badminton, Snooker, Billiards, Library, Movie theatre, Executive rooms, conference room, salon, Banquet Hall & multi-cuisine restaurant in a family-friendly environment that’s sure to engage everyone positively.

''',
                heading1: 'THE SCULPTOR - GYM',
                heading2: 'FUN-FITERTAINMENT'),
            MobileCommonBottom()
          ],
        ),
      ),
    );
  }
}

class NewWidgett extends StatelessWidget {
  const NewWidgett({
    super.key,
    required this.size,
    required this.img1,
    required this.img2,
    required this.text1,
    required this.text2,
    required this.heading1,
    required this.heading2,
  });

  final Size size;
  final String img1;
  final String img2;
  final String text1;
  final String text2;
  final String heading1;
  final String heading2;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [ksizedbox30,
        Row(mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              child: ClipRRect(
                borderRadius: BorderRadius.circular(17),
                child: Image.asset(
                  img1,height: 150,
                ),
              ),
              width: size.width * 0.5,
              decoration: BoxDecoration(borderRadius: BorderRadius.circular(17)),
            ),
          ],
        ),
      //  Spacer(),
        Container(
          child: Column(
            children: [
              Text(heading1).text.bold.xl3.blue900.make(),
              ksizedbox20,
              Text(text1).text.semiBold.blue900.make()
         , ksizedbox30,  ],
          ),
          width: size.width * 0.5,
        ),
        //Spacer(),
        Row(mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Container(
              child: Image.asset(
                img2,height: 150,
              ),
              width: size.width * 0.5,
            ),
          ],
        ),
      //  Spacer(),
        Container(
          child: Column(
            children: [
              Text(heading2).text.bold.xl3.blue900.make(),
              ksizedbox20,
              Text(text2).text.semiBold.blue900.make()
            ],
          ),
          width: size.width * 0.5,
        ),
ksizedbox30],
    );
  }
}
