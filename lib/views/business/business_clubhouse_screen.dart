import 'package:bciweb/constant/constans.dart';
import 'package:bciweb/registerhomescreen/business_common_reg_bottom.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

import '../../registerhomescreen/business_comm_homecontainer.dart';
import '../../registerhomescreen/common_reg_bottom.dart';
import '../members/common_widget/business_common_screen.dart';




class BusinessClubHouse extends StatelessWidget {
  const BusinessClubHouse({super.key});

  

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
          appBar: PreferredSize(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              BusinessCommonScreen(),
              BusinessCommonhomeContainer(),
            ],
          ),
          preferredSize: const Size(double.infinity, 110)),
      body: SingleChildScrollView(
        child: Column(
          children: [
            //RegisterCommonContainer(),
            Container(
                width: MediaQuery.of(context).size.width,
                height: 200,
                decoration: const BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage(
                          'assets/images/speclbackground.png',
                        ),
                        fit: BoxFit.fill)),
                child: Center(child: Text('CLUB HOUSE', style: displayfont))),
            ksizedbox40,
            NewWidget(
              size: size,
              img1: 'assets/images/specialized/Mask Group 28.png',
              img2: 'assets/images/specialized/Mask Group 23.png',
              heading1: 'SQUASH IN',
              heading2: 'YOGA',
              text1:
                  'We have a state-of-the-art Squash court with unpolished pine-wood flooring. Whether you want to get your squash thrill back or pick up a racket for the first time, you’ll find squash an exciting, indoor court-based game for all ages.',
              text2:
                  'The Anbu Yoga Nilayam is a fun, energising and flowing yoga class with enhancing music, will surely going to refresh your mind and body. Traditional yoga, Therapeutic Yoga, Power Yoga and Kids Yoga are available. One of the main goals is to gradually improve flexibility, balance, and strength. ',
            ),
            ksizedbox20,
            NewWidget(
                size: size,
                img1: 'assets/images/specialized/Mask Group 27.png',
                img2: 'assets/images/specialized/Mask Group 13.png',
                text2:
                    'We have 2 Indoor International Standard Synthetic Badminton courts to help you enjoy your route to peak fitness! Singles or doubles, badminton is fun and exciting while also boosting your physique, speed, concentration and stamina. making this sport an effective cardiovascular workout to keep you in top shape!',
                text1:
                    '"BENZE EATREAT" , our fine-dining multicuisine restaurant serving lip-smacking culinary delights from 7.00 a.m. to 10.00 p.m. Snug seating, fresh food and friendly service make this an excellent spot to meet and greet your guests and entertain them with mocktails and starters.',
                heading2: 'SMASH - BATMINTON',
                heading1: '"BENZE EATREAT"  RESTAURANT'),
            ksizedbox20,
            NewWidget(
                size: size,
                img1: 'assets/images/specialized/Mask Group 25.png',
                img2: 'assets/images/specialized/Mask Group 24.png',
                text1:
                    'Our executive rooms are located on the 2nd & 3rd floors. They provide a magnificent view of the hill nearby with a lush green backdrop and swimming pool, all of which you can enjoy through the huge floor-to-ceiling-windows. These rooms are specially designed to create the perfect setting for a romantic weekend or a business visit. You will also have access to our clubhouse facilities and our ',
                text2:
                    '''Our plush 60-seater movie theatre is in the 2nd floor for you to enjoy your favorite flicks with breathtaking sound effects. 
Our library houses all kinds of books. It’s the perfect space for you to spend some much needed alone times in silence, in the company of your favorite books.
We also have an exquisitely manicured lawn where ceremonies and gatherings are often held and an outdoor Amphitheatre to manage stage events.
''',
                heading1: 'EXECUTIVE ROOMS & BANQUET HALL',
                heading2: 'MOVIE THEATRE & LIBRARY'),
            ksizedbox20,
            NewWidget(
                size: size,
                img1: 'assets/images/specialized/Mask Group 22.png',
                img2: 'assets/images/specialized/Mask Group 12.png',
                text1:
                    'Our state-of-the art GYM will will aid you in strengthening  muscles, heart, bones and lowers our blood pressure and of course, reduces body fat and overall keep you fit and in good shape.',
                text2:
                    '''If you want to keep you away from the stress of routine life and create happy memories with your family & friends, CLUB IXORA is one of the best Clubhouses you can reckon for a collective experience of FUN-FIT-ERTAINMENT; Club IXORA is located in the friendly township of Bollineni Hill side, Perumbakkam, OMR.
We offer our members and their guests, an exceptional array of amenities-facilities viz. Gym, SPA, Swimming Pool, Virtual golf, Yoga, Dance, Aerobics, Adventure sports, Squash, Table Tennis, Badminton, Snooker, Billiards, Library, Movie theatre, Executive rooms, conference room, salon, Banquet Hall & multi-cuisine restaurant in a family-friendly environment that’s sure to engage everyone positively.

''',
                heading1: 'THE SCULPTOR - GYM',
                heading2: 'FUN-FITERTAINMENT'),
            NewWidget(
              size: size,
              img1: 'assets/images/Vir Game.png',
              img2: 'assets/images/Dance.png',
              text1:
                  '''Anyone who has played any video game can attest to the fact that you’re exposed to greater creativity when gaming. Whether it’s a realistic video game like Call of Duty or a highly imaginative video game like World of Warcraft, using your imagination to put yourself in the mindset of your characters and their world is a highly stimulating, creative exercise for your brain. More than 50% of the adult population plays video games, and 81% of adults between 18 and 29 are gamers. Statistically speaking, at least one of those gamers has to be at our club. When you find him or her, you’ll immediately have something in common—gaming.

We have four game consoles (PS4, PS3 and X-Box) with a collection of 160 games for you to enjoy.''',
              text2:
                  '''Zumba classes are typically about an hour long and are taught by instructors licensed by Zumba Fitness, LLC. In a single Zumba class, a person can burn between 500-1000 calories. The accompanying music comes from various musical genres—Salsa, Mambo, Flamenco, Samba, Hip Hop and Tango.

NAMELEZZ DANCE STUDIO is a renowned dance team, which is available at the club. They teach Western, Bollywood, Contemporary and Free-style dancing.''',
              heading1: 'VIDEO GAMES',
              heading2: 'Dance & Zumba',
            ),
            businessRegisterCommonBottom(),
          ],
        ),
      ),
    );
  }
}

class NewWidget extends StatelessWidget {
  const NewWidget({
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
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: [
          // Spacer(),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Container(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(heading1).text.semiBold.xl4.blue900.make(),
                    ksizedbox20,
                    Text(text1)
                        .text
                        .xl2
                        .thin
                        .heightLoose
                        .heightLoose
                        .blue900
                        .make()
                  ],
                ),
                width: size.width * 0.5,
              ),
              Container(
                child: Image.asset(
                  img1,
                ),
                width: size.width * 0.4,
                decoration:
                    BoxDecoration(borderRadius: BorderRadius.circular(17)),
              ),
            ],
          ),
          ksizedbox40,
          ksizedbox40,
          //  Spacer(),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Container(
                child: Image.asset(
                  img2,
                ),
                width: size.width * 0.4,
              ),
              //   Spacer(),
              Container(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(heading2).text.semiBold.xl4.blue900.make(),
                    ksizedbox20,
                    Text(text2).text.thin.heightLoose.xl2.blue900.make()
                  ],
                ),
                width: size.width * 0.5,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
