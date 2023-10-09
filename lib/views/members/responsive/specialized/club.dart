import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

import '../../../../constant/constans.dart';
import '../../../../registerhomescreen/common_reg_bottom.dart';
import '../../../../registerhomescreen/common_reg_homescreen.dart';
//import '../members/common_widget/common.dart';
import '../mobile_wdgets/comomappbar.dart';
import '../mobile_wdgets/drawer.dart';
import '../mobile_wdgets/mobile_common_bottom/bottom.dart';

class SpecializedClubMOB extends StatelessWidget {
  const SpecializedClubMOB({super.key});

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: const PreferredSize(
          child: AppBarMob(), preferredSize: Size(double.infinity, 40)),
      drawer: MobileDrawer(),
      body: SingleChildScrollView(
        child: Column(
          children: [ksizedbox20,
         //   RegisterCommonContainer(),
            Container(
                width: MediaQuery.of(context).size.width,
                height: 200,
                decoration: const BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage(
                          'assets/images/speclbackground.png',
                        ),
                        fit: BoxFit.fill)),
                child:
                    Center(child:  Text('MEET OUR LEGENDARY AMBASSADORS')
                          .text
                          
                          .xl2
                          .white
                          .make())),
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [ksizedbox20,
                Container(
                    width: size.width * 0.7,
                    child:
                        Image.asset('assets/images/specialized/Image 38.png')),
                Container(
                  width: size.width * 0.9,
                  child: Column(
                    children: [
                      ksizedbox40,
                      Text('''WATER, LAND, FIRE, AIR & SKY are pancha boothas or simply NATURE which forms this entire UNIVERSE and its functioning.''')
                          .text
                          .xl
                          .bold
                          .blue900
                          
                          .make(),
                      ksizedbox10,
                      Text('''Harmony with nature makes people feel more alive, healthy and happy. We have the following Adventure Sports-activities @ BCI-VIRTUALINK to be in touch with Nature: 

* TREKKING & MOUNTAINEERING
* WILDLIFE SAFARI
* CAMPING
* MARATHON & ROAD EXPEDITIONS.
* PARA GLIDING
* SEA-FARING & DEEP-SEA DIVING
* BIRD WATCHING.
* WIND & WATER SURFING.    
* OUTWARD BOUND LEADERSHIP ADVENTURE ACTIVITIES.

Our man at BCI, Mr. DIPANKAR GHOSE-63, with 40 years of field experience in the Great Outdoors with Eco Conservation and Adventure Tourism, is raring to take you out on Adventure & Nature. He's the CEO of PRAKRUTHI KOTINOS Wilderness and Adventure Sports Pvt. Ltd. And Senior Consultant of ACCEPT - ADVANCED CENTRE FOR CONSERVATION EDUCATION, PLANNING & TRAINING. He is the Founding Trustee and Director of OUTWARD BOUND in India.
PRAKRUTHI KOTINOS collaborates regularly with India Tourism, Yuva Tourism Clubs, Chennai Snake Park, ATOAI, MMA, DRA and at the top of these partnerships is with BCI...
''').text.thin.blue900.heightLoose.make()
                    ],
                  ),
                )
              ],
            ),
            ksizedbox30,
            Container(
              child:Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Container(
                      child: Padding(
                        padding: const EdgeInsets.all(15.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text('Set out with us from your courtyard at IXORA, to explore the nature India.;')
                                .text
                                .xl
                                
                                .blue900
                                .tight
                                .make(),
                            ksizedbox20,
                            Text('''Led by Dipankar and his team of experts, you can experience:
* Bird Watching around Perumbakam Wetlands,     
* Watch Kadal Aamai (Sea turtle) emerge from the sea at night, 
* Wildlife camping, adventure trip on land, water and air, 
* Star gazing in the open sky, 
* Dashing through a jungle gym like Tarzan, 
* Developing an all round personality with leadership and cultural    skills of art and fine arts. ''')
                                .text
                                
                                
                                .thin
                                .blue900
                                .heightLoose
                                .make()
                          ],
                        ),
                      ),
                      width: size.width * 0.9),
                  Container(
                      width: size.width * 0.7,
                      child:
                          Image.asset('assets/images/specialized/Image 36.png'))
           ,   ksizedbox20  ],
              ),
              width: size.width,
            
              color: Colors.grey[300],
            ),
            ksizedbox30,
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Image.asset(
                  'assets/images/specialized/Mask Group 30.png',
                  height: 300,
                ),ksizedbox30,
                Image.asset(
                  'assets/images/specialized/Mask Group 31.png',
                  height: 300,
                ),ksizedbox30,
                Image.asset(
                  'assets/images/specialized/Mask Group 32.png',
                  height: 300,
                ),ksizedbox20,    
             ksizedbox30, 
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Image.asset(
                  'assets/images/1.png',
                  height: 300,
                ),ksizedbox20,
                Image.asset(
                  'assets/images/2.png',
                  height: 300,
                ),ksizedbox20,
                Image.asset(
                  'assets/images/3.png',
                  height: 300,
                ),
              ],
            ),ksizedbox30,
            
              ],
            ),
            ksizedbox30, //Image.asset('assets/images/specialized/Mask Group 27.png'),
         //   RegisterCommonBottom()
          MobileCommonBottom()  ],
        ),
      ),
    );
  }
}
