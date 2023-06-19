import 'package:bciweb/constant/constans.dart';
import 'package:date_format/date_format.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

import '../../../../registerhomescreen/common_reg_bottom.dart';
import '../../../../registerhomescreen/common_reg_homescreen.dart';
import '../../../members/common_widget/common.dart';
import 'widget/dropdown_smal.dart';

class AboutTrip extends StatefulWidget {
  const AboutTrip({super.key});

  @override
  State<AboutTrip> createState() => _AboutTripState();
}

class _AboutTripState extends State<AboutTrip> {
  var falightdobController = TextEditingController();
  DateTime flaightselectedDate = DateTime.now();
  Future<void> _flaightselectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
        context: context,
        initialDate: flaightselectedDate,
        firstDate: DateTime(2015, 8),
        lastDate: DateTime(2101));
    if (picked != null && picked != flaightselectedDate) {
      setState(() {
        flaightselectedDate = picked;
        falightdobController.text =
            '${flaightselectedDate.day}-${flaightselectedDate.month}-${flaightselectedDate.year}';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: PreferredSize(
          child: CommonScreen(), preferredSize: Size(double.infinity, 40)),
      body: SingleChildScrollView(
        child: Column(
          children: [
            RegisterCommonContainer(),
            Stack(
              children: [
                Image.asset(
                  'assets/images/5545.png',
                  width: size.width,
                ),
                Positioned(
                    left: 0,
                    right: 0,
                    top: 50,
                    child: Center(
                        child: Text('TraveI Place Istanbul')
                            .text
                            .semiBold
                            .xl6
                            .white
                            .make()))
              ],
            ),
            ksizedbox40,
            Container(
              width: size.width * 0.9,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("About City").text.semiBold.xl4.make(),
                  Row(
                    children: [
                      Text('Turkey').text.thin.xl4.blue900.make(),
                      kwidth10,
                      Image.asset('assets/images/location-svgrepo-com (1).png')
                    ],
                  )
                ],
              ),
            ),
            ksizedbox40,
            Container(
              width: size.width * 0.9,
              child: Text(
                      'The Windy City is an eclectic mix of modern art, buzzworthy dining, cutting-edge comedy, and beloved sports teams. Snap a photo of your reflection in the silver Cloud Gate sculpture at Millennium Park before heading to Grant Park to get hit with the refreshing spray of Buckingham Fountain. There are dozens of museums and theatre companies in Chicago, so a cultural experience is never hard to find. You’re sure to laugh to the point of tears at the Second City Theatre, the launch pad of many famous comedians.')
                  .text
                  .semiBold
                  .xl
                  .make(),
            ),
            ksizedbox40,
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Persons',
                      style: TextStyle(
                          fontSize: 35,
                          fontWeight: FontWeight.w700,
                          color: Color(0xFF003366)),
                    ),
                    ksizedbox40,
                    Row(
                      children: [
                        Text(
                          "Adult",
                          style: TextStyle(color: kblue),
                        ),
                        SizedBox(
                          width: 5,
                        ),
                        Container(
                          width: 60,
                          // height: 50,
                          child: Dropdown_Small(
                            options: ['01 ', '02'],
                            label: '0',
                          ),
                        ),
                        SizedBox(
                          width: 30,
                        ),
                        Text('Children'),
                        SizedBox(
                          width: 5,
                        ),
                        Container(
                          width: 60,
                          //  height: 50,
                          child: Dropdown_Small(
                            options: ['01 ', '02'],
                            label: '0',
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                Column(
                  children: [
                    Text(
                      'Choose Date',
                      style: TextStyle(
                          fontSize: 35,
                          fontWeight: FontWeight.w700,
                          color: Color(0xFF003366)),
                    ),ksizedbox30,
                    Text('choose from date   ${formatDate(flaightselectedDate, [
                          dd,'-',
                          
                          mm,'-',
                        
                          yyyy
                        ])}').text.blue800.make(),
                    IconButton(
                        onPressed: () {
                          _flaightselectDate(context);
                        },
                        icon: Icon(Icons.date_range_outlined,color: kblue,))
            ,ksizedbox40,  Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Row(
                  children: [
                    Text(
                      '₹288',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 35,
                      ),
                    ),
                    Text(
                      '/person',
                      style: TextStyle(color: kgrey),
                    )
                  ],
                ),
                InkWell(
                  onTap: () {
                    //  Get.to(Sucessful_screen());
                  },
                  child: Container(
                    width: 200,
                    height: 45,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(
                        4,
                      ),
                      gradient: const LinearGradient(
                        begin: Alignment.centerLeft,
                        end: Alignment.centerRight,
                        colors: [
                          Color(0xFFFF5C29),
                          Color(0xFFFFCD38),
                        ],
                      ),
                    ),
                    child: Center(
                      child: Text(
                        'payment',
                        style: TextStyle(
                            fontSize: 25,
                            color: Colors.white,
                            fontWeight: FontWeight.w600),
                      ),
                    ),
                  ),
                ),
              ],
            ),    ],
                ),
              ],
            ),
            ksizedbox30,
            
            ksizedbox40,
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text('Ratings & reviews').text.semiBold.xl5.make(),
                ],
              ),
            ),
            ksizedbox30,
                        Column(
            
                            mainAxisAlignment: MainAxisAlignment.start,
            
                            children: [
            
                              raintingwidget(
            
                                text: '     Cleaning',
            
                              ),
            
                              ksizedbox10,
            
                              raintingwidget(
            
                                text: '     Food',
            
                              ),
            
                              ksizedbox10,
            
                              raintingwidget(
            
                                text: '     Atmosphere',
            
                              ),
            
                              ksizedbox10,
            
                              raintingwidget(
            
                                text: '     Economy',
            
                              ),
            
                              ksizedbox10,
            
                            ],
            
                          ),
            RegisterCommonBottom()
          ],
        ),
      ),
    );
  }
}

class raintingwidget extends StatelessWidget {
  const raintingwidget({
    super.key,
    required this.text,
  });
  final String text;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Container(width: 500,
          child: Column(crossAxisAlignment: CrossAxisAlignment.start,
            children: [kwidth10,
              Text(        text).text.semiBold.xl5.make(),
            ],
          ),
        ),
        Container(width: 500,
          child: Column(crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Icon(
                    Icons.star,
                    size: 40,
                    color: Colors.amber,
                  ),
                  Icon(
                    Icons.star,
                    size: 40,
                    color: Colors.amber,
                  ),
                  Icon(
                    Icons.star,
                    size: 40,
                    color: Colors.amber,
                  ),
                  Icon(
                    Icons.star,
                    size: 40,
                    color: Colors.amber,
                  ),
                  Icon(
                    Icons.star,
                    size: 40,
                    color: Colors.grey[300],
                  ),
                ],
              ),
            ],
          ),
        ),
        Container(width: 500,
          child: Column(
            children: [
              Text('1.23k Reviews').text.gray400.thin.xl4.make(),
            ],
          ),
        )
      ],
    );
  }
}
