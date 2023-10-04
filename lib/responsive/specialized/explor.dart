import 'package:bciweb/constant/constans.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:velocity_x/velocity_x.dart';

import '../../constant/constans.dart';
import '../../constant/constans.dart';
import '../../registerhomescreen/common_reg_bottom.dart';
import '../../registerhomescreen/common_reg_homescreen.dart';
//import '../members/common_widget/common.dart';
import '../mobile_wdgets/comomappbar.dart';
import '../mobile_wdgets/drawer.dart';
import '../mobile_wdgets/mobile_common_bottom/bottom.dart';

class SpecializedExploreMOB extends StatelessWidget {
  const SpecializedExploreMOB({super.key});

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
     appBar: const PreferredSize(
          child: AppBarMob(), preferredSize: Size(double.infinity, 40)),
      drawer: MobileDrawer(),
      body: SingleChildScrollView(
        child: Column(
          children: [
      //      RegisterCommonContainer(),
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
              children: [ksizedbox30,
                Container(width: size.width*0.7,
                    child: Image.asset(
                  'assets/images/specialized/Group 39752.png',
                )),ksizedbox30,
                Container(width: size.width*0.9,
                  child: Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: Column(crossAxisAlignment: CrossAxisAlignment.start,
                      children: [Text('G-MIME Studio @ BCI IXORA Club house.' ,).text.xl2.semiBold.blue900.tight.make(),
                     ksizedbox20,  Text('''G-MIME Studio is a theatre Art practicing Studio, founded by Actor Dr. MIME GOPI who has performed in lots of Movies, TV shows & 10,000+ mime shows in & outside India. 
                  
This is one of the best studios to learn MIME, acting, expressing emotions, personal-public behavior, common nature of a human being, social responsibilities, fitness, career growth, respecting elders, program management and photography.
                  
Heading the G-MIME Studio, Mr. Gopi is a renowned mime actor in Chennai. In his role both as a Mime Artist and Mentor, Gopi has worked closely with lots of special children to help them adapt miming skills. He is an inspiration for upcoming theatre artists and public personalities; He started the G-MIME studio in 1994 and has been working to expand the Miming art, globally.
                  

                  ''').text.xl.thin.blue900.heightLoose.make()
                  ,  ]
                    ),
                  ),
                ),
              ],
            ),
            //  Image.asset('assets/images/specialized/Image 38.png'),
           // Row(children: [//Image.asset('assets/images/specialized/g_mime_studio-20230601-0003.jpg')],),
         //   RegisterCommonBottom()
           Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Image.asset(
                  'assets/images/specialized/2.png',
                  height: 300,
                ),ksizedbox20,
                Image.asset(
                  'assets/images/specialized/3.png',
                  height: 300,
                ),ksizedbox20,
                Image.asset(
                'assets/images/specialized/4.png',
                  height: 300,
                ),
              ],
            ),ksizedbox30,
            
             ksizedbox30,
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Image.asset(
                  'assets/images/specialized/5.png',
                  height: 300,
                ),ksizedbox20,
                Image.asset(
                  'assets/images/specialized/6.png',
                  height: 300,
                ),ksizedbox20,
                Image.asset(
                  'assets/images/specialized/7.png',
                  height: 300,
                ),
              ],
            ),
            ksizedbox30,    MobileCommonBottom()],
        ),
      ),
    );
  }
}
final Uri _url = Uri.parse('youtube.com/@GMIMESTUDIOMumbai.');
Future<void> _launchUrl() async {
  if (!await launchUrl(_url)) {
    throw Exception('Could not launch $_url');
  }
}