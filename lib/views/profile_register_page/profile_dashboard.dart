import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import '../../constant/constans.dart';
import '../../controller/auth_controller/auth_profile_controller.dart';
import '../../controller/setting_controller/setting_controller.dart';
// ignore: depend_on_referenced_packages
import 'package:syncfusion_flutter_charts/charts.dart';

class ProfileDashboardScreen extends StatefulWidget {
  const ProfileDashboardScreen({super.key});

  @override
  State<ProfileDashboardScreen> createState() => _ProfileDashboardScreenState();
}

class _ProfileDashboardScreenState extends State<ProfileDashboardScreen> {
 final List<ChartData> chartData = [
      ChartData('David', 25, Color.fromRGBO(9, 0, 136, 1)),
      ChartData('Steve', 38, Color.fromRGBO(147, 0, 119, 1)),
      ChartData('Jack', 34, Color.fromRGBO(228, 0, 124, 1)),
      ChartData('Others', 52, Color.fromRGBO(255, 189, 57, 1))
    ];

  final settingController = Get.find<ApiSettingController>();
  final authprofileController = Get.find<AuthProfileController>();
  final apisettingController = Get.find<ApiSettingController>();
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 50),
      child: Container(
        width: MediaQuery.of(context).size.width - 195,
        child: GetBuilder<ApiSettingController>(builder: (_) {
          return Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 100),
                    child: authprofileController.profileData.isEmpty
                        ? Text(
                            'Hello, Benze',
                            style: TextStyle(
                                fontSize: 22,
                                color: kblue,
                                fontWeight: FontWeight.w500),
                          )
                        : Text(
                            'Hello ${authprofileController.profileData.first.name}'),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 100),
                    child: authprofileController.profileData.isEmpty
                        ? Image.asset(
                            'assets/images/profileimage.png',
                            height: 74,
                            fit: BoxFit.fitHeight,
                          )
                        : ClipRRect(
                            borderRadius: BorderRadius.circular(100),
                            child: Container(
                              height: 79,
                              width: 80,
                              child: Image.network(
                                authprofileController
                                    .profileData.first.profilePicture,
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                  ),
                ],
              ),
              // Padding(
              //   padding: const EdgeInsets.only(left: 100),
              //   child: Row(
              //     children: [
              //       GestureDetector(
              //         onTap: () {
              //           Get.offAll(RegisterProfileController());
              //         },
              //         child: Text(
              //           'View Profile',
              //           style: TextStyle(color: kblue),
              //         ),
              //       ),
              //     ],
              //   ),
              // ),
              Padding(
                padding: const EdgeInsets.only(left: 100),
                child: Row(
                  children: [
                    Container(
                      height: 1,
                      width: 80,
                      color: kgrey,
                    )
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 100, top: 32),
                child: Row(
                  children: [
                    Container(
                      height: 50,
                      width: MediaQuery.of(context).size.width * 0.68,
                      decoration: BoxDecoration(
                          color: kwhite,
                          border: Border.all(color: kblue),
                          borderRadius: BorderRadius.circular(5),
                          boxShadow: <BoxShadow>[
                            BoxShadow(
                                offset: Offset(0.0, 0.75),
                                blurRadius: 5,
                                color: kgrey)
                          ]),
                      child: Padding(
                        padding: const EdgeInsets.only(left: 10),
                        child: Row(
                          children: [
                            Image(
                              image: AssetImage(
                                'assets/images/cirlewallet.png',
                              ),
                              fit: BoxFit.fitHeight,
                              height: 30,
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 30),
                              child: Text(
                                'Wallet Amount',
                                style: TextStyle(fontSize: 17, color: kblue),
                              ),
                            ),
                            Padding(
                                padding: const EdgeInsets.only(left: 550),
                                child:
                                    apisettingController.getWalletData.isEmpty
                                        ? const Text("0")
                                        : Text(
                                            '₹ ${authprofileController.profileData.first.walletAmount}',
                                            style: TextStyle(
                                                fontSize: 18,
                                                color: kblue,
                                                fontWeight: FontWeight.bold),
                                          )

                                // apisettingController
                                //         .getWalletData.isEmpty
                                //     ? Text(
                                //         '',
                                //         textAlign: TextAlign.end,
                                //         style: TextStyle(
                                //           fontSize: 17,
                                //           color: kblue,
                                //         ),
                                //       )
                                //     : Text(''),
                                ),
                            Padding(
                              padding: const EdgeInsets.only(left: 13),
                              child: CircleAvatar(
                                radius: 15,
                                backgroundColor: kblue,
                                child: Icon(
                                  Icons.chevron_right,
                                  color: kwhite,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 100, top: 45),
                    child: Text(
                      'Your Coupons',
                      style: TextStyle(fontSize: 22, color: kblue),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 110, top: 45),
                    child: Text(
                      'View',
                      style: TextStyle(fontSize: 22, color: kyellow),
                    ),
                  )
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(left: 100, top: 35),
                child: Row(
                  children: [
                    Container(
                      height: 160,
                      width: MediaQuery.of(context).size.width * 0.68,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          color: kwhite,
                          boxShadow: <BoxShadow>[
                            BoxShadow(
                                offset: Offset(0.0, 0.75),
                                blurRadius: 5,
                                color: kgrey)
                          ]),
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Padding(
                                padding:
                                    const EdgeInsets.only(left: 40, top: 10),
                                child: Column(
                                  children: [
                                    Container(
                                        height: 110,
                                        width: 110,
                                        child: SfCircularChart(
                                            annotations: <CircularChartAnnotation>[
                                              CircularChartAnnotation(
                                                  widget: Container(
                                                height: 100,
                                                width: 100,
                                              )),
                                              CircularChartAnnotation(
                                                  widget: Container(
                                                      child: apisettingController
                                                              .getWalletData
                                                              .isEmpty
                                                          ? Text('')
                                                          : Text(
                                                              apisettingController
                                                                  .getWalletData
                                                                  .first
                                                                  .referrals
                                                                  .totalReferrals
                                                                  .toString(),
                                                              style: TextStyle(
                                                                  color: Color.fromRGBO(
                                                                      0,
                                                                      0,
                                                                      0,
                                                                      0.5),
                                                                  fontSize:
                                                                      17))))
                                            ],
                                            series: <CircularSeries>[
                                              DoughnutSeries<
                                                      ChartData,
                                                      String>(
                                                  dataSource:
                                                      chartData,
                                                  xValueMapper:
                                                      (ChartData data,
                                                              _) =>
                                                          data.x,
                                                  yValueMapper:
                                                      (ChartData data,
                                                              _) =>
                                                          data.y,
                                                  // Radius of doughnut
                                                  radius: '80%')
                                            ])),
                                    Padding(
                                      padding: const EdgeInsets.only(
                                          left: 0, top: 0),
                                      child: Text(
                                        'Total',
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                            fontSize: 17, color: kblue),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(top: 10),
                                child: Column(
                                  children: [
                                    Container(
                                        height: 110,
                                        width: 110,
                                        child: SfCircularChart(
                                            annotations: <CircularChartAnnotation>[
                                              CircularChartAnnotation(
                                                  widget: Container(
                                                height: 100,
                                                width: 100,
                                              )),
                                              CircularChartAnnotation(
                                                  widget: Container(
                                                      child: apisettingController
                                                              .getWalletData
                                                              .isEmpty
                                                          ? Text('')
                                                          : Text(
                                                              apisettingController
                                                                  .getWalletData
                                                                  .first
                                                                  .referrals
                                                                  .todayReferrals
                                                                  .toString(),
                                                              style: TextStyle(
                                                                  color: Color.fromRGBO(
                                                                      0,
                                                                      0,
                                                                      0,
                                                                      0.5),
                                                                  fontSize:
                                                                      17))))
                                            ],
                                            series: <CircularSeries>[
                                              DoughnutSeries<
                                                      ChartData,
                                                      String>(
                                                  dataSource:
                                                      chartData,
                                                  xValueMapper:
                                                      (ChartData data,
                                                              _) =>
                                                          data.x,
                                                  yValueMapper:
                                                      (ChartData data,
                                                              _) =>
                                                          data.y,
                                                  // Radius of doughnut
                                                  radius: '80%')
                                            ])),
                                    Padding(
                                      padding: const EdgeInsets.only(top: 0),
                                      child: Text(
                                        'Used',
                                        style: TextStyle(
                                            fontSize: 17, color: kblue),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.only(right: 60, top: 10),
                                child: Column(
                                  children: [
                                    Container(
                                        height: 110,
                                        width: 110,
                                        child: SfCircularChart(
                                            annotations: <CircularChartAnnotation>[
                                              CircularChartAnnotation(
                                                  widget: Container(
                                                height: 100,
                                                width: 100,
                                              )),
                                              CircularChartAnnotation(
                                                  widget: Container(
                                                      child: apisettingController
                                                              .getWalletData
                                                              .isEmpty
                                                          ? Text('')
                                                          : Text(
                                                              apisettingController
                                                                  .getWalletData
                                                                  .first
                                                                  .referrals
                                                                  .thisMonthReferrals
                                                                  .toString(),
                                                              style: TextStyle(
                                                                  color: Color.fromRGBO(
                                                                      0,
                                                                      0,
                                                                      0,
                                                                      0.5),
                                                                  fontSize:
                                                                      17))))
                                            ],
                                            series: <CircularSeries>[
                                              DoughnutSeries<
                                                      ChartData,
                                                      String>(
                                                  dataSource:
                                                      chartData,
                                                  xValueMapper:
                                                      (ChartData data,
                                                              _) =>
                                                          data.x,
                                                  yValueMapper:
                                                      (ChartData data,
                                                              _) =>
                                                          data.y,
                                                  // Radius of doughnut
                                                  radius: '80%')
                                            ])),
                                    Padding(
                                      padding: const EdgeInsets.only(
                                          right: 0, top: 0),
                                      child: Text(
                                        'Pending',
                                        style: TextStyle(
                                            fontSize: 17, color: kblue),
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 100, top: 45),
                    child: Text(
                      'Your Referrals',
                      style: TextStyle(fontSize: 22, color: kblue),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 110, top: 45),
                    child: Text(
                      'Invite',
                      style: TextStyle(fontSize: 22, color: kyellow),
                    ),
                  )
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(left: 100, top: 35),
                child: Row(
                  children: [
                    Container(
                      height: 160,
                      width: MediaQuery.of(context).size.width * 0.68,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          color: kwhite,
                          boxShadow: <BoxShadow>[
                            BoxShadow(
                                offset: Offset(0.0, 0.75),
                                blurRadius: 5,
                                color: kgrey)
                          ]),
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Padding(
                                padding:
                                    const EdgeInsets.only(left: 40, top: 10),
                                child: Column(
                                  children: [
                                    Container(
                                        height: 110,
                                        width: 110,
                                        child: SfCircularChart(
                                            annotations: <CircularChartAnnotation>[
                                              CircularChartAnnotation(
                                                  widget: Container(
                                                height: 100,
                                                width: 100,
                                              )),
                                              CircularChartAnnotation(
                                                  widget: Container(
                                                      child: apisettingController
                                                              .getWalletData
                                                              .isEmpty
                                                          ? Text('')
                                                          : Text(
                                                              apisettingController
                                                                  .getWalletData
                                                                  .first
                                                                  .referrals
                                                                  .totalReferrals
                                                                  .toString(),
                                                              style: TextStyle(
                                                                  color: Color.fromRGBO(
                                                                      0,
                                                                      0,
                                                                      0,
                                                                      0.5),
                                                                  fontSize:
                                                                      17))))
                                            ],
                                            series: <CircularSeries>[
                                              DoughnutSeries<
                                                      ChartData,
                                                      String>(
                                                  dataSource:
                                                      chartData,
                                                  xValueMapper:
                                                      (ChartData data,
                                                              _) =>
                                                          data.x,
                                                  yValueMapper:
                                                      (ChartData data,
                                                              _) =>
                                                          data.y,
                                                  // Radius of doughnut
                                                  radius: '80%')
                                            ])),
                                    Padding(
                                      padding: const EdgeInsets.only(
                                          left: 0, top: 0),
                                      child: Text(
                                        'Total',
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                            fontSize: 17, color: kblue),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(top: 10),
                                child: Column(
                                  children: [
                                    Container(
                                        height: 110,
                                        width: 110,
                                        child: SfCircularChart(
                                            annotations: <CircularChartAnnotation>[
                                              CircularChartAnnotation(
                                                  widget: Container(
                                                height: 100,
                                                width: 100,
                                              )),
                                              CircularChartAnnotation(
                                                  widget: Container(
                                                      child: apisettingController
                                                              .getWalletData
                                                              .isEmpty
                                                          ? Text('')
                                                          : Text(
                                                              apisettingController
                                                                  .getWalletData
                                                                  .first
                                                                  .referrals
                                                                  .todayReferrals
                                                                  .toString(),
                                                              style: TextStyle(
                                                                  color: Color.fromRGBO(
                                                                      0,
                                                                      0,
                                                                      0,
                                                                      0.5),
                                                                  fontSize:
                                                                      17))))
                                            ],
                                            series: <CircularSeries>[
                                              DoughnutSeries<
                                                      ChartData,
                                                      String>(
                                                  dataSource:
                                                      chartData,
                                                  xValueMapper:
                                                      (ChartData data,
                                                              _) =>
                                                          data.x,
                                                  yValueMapper:
                                                      (ChartData data,
                                                              _) =>
                                                          data.y,
                                                  // Radius of doughnut
                                                  radius: '80%')
                                            ])),
                                    Padding(
                                      padding: const EdgeInsets.only(top: 0),
                                      child: Text(
                                        'Used',
                                        style: TextStyle(
                                            fontSize: 17, color: kblue),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.only(right: 60, top: 10),
                                child: Column(
                                  children: [
                                    Container(
                                        height: 110,
                                        width: 110,
                                        child: SfCircularChart(
                                            annotations: <CircularChartAnnotation>[
                                              CircularChartAnnotation(
                                                  widget: Container(
                                                height: 100,
                                                width: 100,
                                              )),
                                              CircularChartAnnotation(
                                                  widget: Container(
                                                      child: apisettingController
                                                              .getWalletData
                                                              .isEmpty
                                                          ? Text('')
                                                          : Text(
                                                              apisettingController
                                                                  .getWalletData
                                                                  .first
                                                                  .referrals
                                                                  .thisMonthReferrals
                                                                  .toString(),
                                                              style: TextStyle(
                                                                  color: Color.fromRGBO(
                                                                      0,
                                                                      0,
                                                                      0,
                                                                      0.5),
                                                                  fontSize:
                                                                      17))))
                                            ],
                                            series: <CircularSeries>[
                                              DoughnutSeries<
                                                      ChartData,
                                                      String>(
                                                  dataSource:
                                                      chartData,
                                                  xValueMapper:
                                                      (ChartData data,
                                                              _) =>
                                                          data.x,
                                                  yValueMapper:
                                                      (ChartData data,
                                                              _) =>
                                                          data.y,
                                                  // Radius of doughnut
                                                  radius: '80%')
                                            ])),
                                    Padding(
                                      padding: const EdgeInsets.only(
                                          right: 0, top: 0),
                                      child: Text(
                                        'Pending',
                                        style: TextStyle(
                                            fontSize: 17, color: kblue),
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          );
        }),
      ),
    );
  }
}
class ChartData {
  ChartData(this.x, this.y, this.color);
  final String x;
  final double y;
  final Color color;
}
