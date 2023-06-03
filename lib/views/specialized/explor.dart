import 'package:bciweb/constant/constans.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:velocity_x/velocity_x.dart';

import '../../constant/constans.dart';
import '../../constant/constans.dart';
import '../../registerhomescreen/common_reg_bottom.dart';
import '../../registerhomescreen/common_reg_homescreen.dart';
import '../members/common_widget/common.dart';

class SpecializedExplore extends StatelessWidget {
  const SpecializedExplore({super.key});

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: const PreferredSize(
          child: CommonScreen(), preferredSize: Size(double.infinity, 40)),
      body: SingleChildScrollView(
        child: Column(
          children: [
            RegisterCommonContainer(),
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
                          .bold
                          .xl6
                          .white
                          .make())),
            Row(
              children: [Spacer(),
                Container(width: size.width*0.4,
                    child: Image.asset(
                  'assets/images/specialized/Group 39752.png',
                )),Spacer(),
                Container(width: size.width*0.4,
                  child: Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: Column(crossAxisAlignment: CrossAxisAlignment.start,
                      children: [Text('G-MIME Studio @ BCI IXORA Club house.' ,).text.xl5.bold.blue900.tight.make(),
                     ksizedbox20,  Text('''G-MIME Studio is a theatre Art practicing Studio, founded by Actor Dr. MIME GOPI who has performed in lots of Movies, TV shows & 10,000+ mime shows in & outside India. 
                  
This is one of the best studios to learn MIME, acting, expressing emotions, personal-public behavior, common nature of a human being, social responsibilities, fitness, career growth, respecting elders, program management and photography.
                  
Heading the G-MIME Studio, Mr. Gopi is a renowned mime actor in Chennai. In his role both as a Mime Artist and Mentor, Gopi has worked closely with lots of special children to help them adapt miming skills. He is an inspiration for upcoming theatre artists and public personalities; He started the G-MIME studio in 1994 and has been working to expand the Miming art, globally.
                  

                  ''').text.semiBold.xl2.thin.blue900.heightLoose.make()
                  ,   Row(children: [Text('YouTube link👇 ').text.semiBold.xl.blue900.make(),InkWell(onTap: _launchUrl,
                    child: Text('youtube.com/@GMIMESTUDIOMumbai.').text.thin.red700.make())],) ],
                    ),
                  ),
                ),
              ],
            ),     ksizedbox30, 
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Image.asset(
                  'assets/images/specialized/2.png',
                  height: 300,
                ),
                Image.asset(
                  'assets/images/specialized/3.png',
                  height: 300,
                ),
                Image.asset(
                'assets/images/specialized/4.png',
                  height: 300,
                ),
              ],
            ),ksizedbox30,
            
             ksizedbox30,
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Image.asset(
                  'assets/images/specialized/5.png',
                  height: 300,
                ),
                Image.asset(
                  'assets/images/specialized/6.png',
                  height: 300,
                ),
                Image.asset(
                  'assets/images/specialized/7.png',
                  height: 300,
                ),
              ],
            ),
            ksizedbox30,
            //  Image.asset('assets/images/specialized/Image 38.png'),
           // Row(children: [//Image.asset('assets/images/specialized/g_mime_studio-20230601-0003.jpg')],),
            RegisterCommonBottom()
          ],
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