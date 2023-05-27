import 'package:bciweb/constant/constans.dart';
import 'package:bciweb/responsive/mobile_wdgets/comomappbar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../mobile_wdgets/drawer.dart';
import '../mobile_wdgets/mobile_common_bottom/bottom.dart';


class RespoPrivacyPolicy extends StatelessWidget {
  const RespoPrivacyPolicy({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
          child: AppBarMob(), preferredSize: Size(double.infinity, 40)),
          drawer: MobileDrawer(),
      body: ListView(
        children: [
        //  RegisterCommonContainer(),
          ksizedbox40,
          Padding(
            padding: const EdgeInsets.all(50.0),
            child: Column(
              children: [
                Text(
                  'DISCLAIMER POLICY',
                  style: TextStyle(
                      decoration: TextDecoration.underline,
                      fontSize: 27,
                      fontWeight: FontWeight.w700),
                ),
                ksizedbox30,
                ksizedbox20,
                Text(
                  '''A Disclaimer May Specify Mutually-Agreed And Privately-Arranged Terms And Conditions As Part Of A Contract Or May Specify Warnings Or Expectations To The General Public (Or Some Other Class Of Persons) In Order To Fulfil A Duty Of Care Owed To Prevent An Unreasonable Risk Of Harm Or Injury. Some Disclaimers Are Intended To Limit Exposure To Damages After Harm Or Injury Has Already Been Suffered. Additionally, Some Kinds Of Disclaimers May Represent A Voluntary Waiver Of A Right Or Obligation That May Be Owed To The Disclaimer.
Disclaimers Vary In Terms Of Their Uniformity. Some May Vary Depending On The Specific Context And Parties Involved, While Other Types Of Disclaimers May Strictly Adhere To A Uniform And Established The Set Of Formalities That Are Rarely Or Never Modified, Except Under Official Authority.
          
 Web Application & App Disclaimer Covers The Following:
          •	No Cancellation For Membership
          •	Limitations Of Liability
          •	Exceptions
          •	Reasonableness
          •	Other Parties
          •	Unenforceable Provisions
          •	This Website Disclaimer
          Web Application & App Disclaimer
          The Information Contained In This Web Application & App Is For General Information Purposes Only. The Information Is Provided By BCI And While We Endeavour To Keep The Information Up To Date And Correct, We Make No Representations Or Warranties Of Any Kind, Express Or Implied, About The Completeness, Accuracy, Reliability, Suitability Or Availability With Respect To The Web Application & App Or The Information, Products, Services, Or Related Graphics Contained On The Web Application & App For Any Purpose. Any Reliance You Place On Such Information Is Therefore Strictly At Your Own Risk.
In No Event Will We Be Liable For Any Loss Or Damage Including Without Limitation, Indirect Or Consequential Loss Or Damage, Or Any Loss Or Damage Whatsoever Arising From Loss Of Data Or Profits Arising Out Of, Or In Connection With, The Use Of This Web Application & App.
Through This Web Application & App, You Are Able To Link To Other Web Application & App Which Are Not Under The Control Of BCI. We Have No Control Over The Nature, Content, And Availability Of Those Sites. The Inclusion Of Any Links Does Not Necessarily Imply A Recommendation Or Endorse The Views Expressed Within Them. Every Effort Is Made To Keep The Website Up And Running Smoothly. However, BCI Takes No Responsibility For, And Will Not Be Liable For, The Web Application & App Being Temporarily Unavailable Due To Technical Issues Beyond Our Control.
          
          ''',
                  style: TextStyle(
                      height: 1.5, fontWeight: FontWeight.w400, fontSize: 15),
                  textAlign: TextAlign.left,
                )
              ],
            ),
          ),
          ksizedbox40,
          
       MobileCommonBottom() ],
      ),
    );
  }
}

class RespoDisclimer extends StatelessWidget {
  const RespoDisclimer({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
     appBar: PreferredSize(
          child: AppBarMob(), preferredSize: Size(double.infinity, 40)),
          drawer: MobileDrawer(),
      body: ListView(
        children: [
          
          ksizedbox40,
          Padding(
            padding: const EdgeInsets.all(50),
            child: Column(
              children: [
                Text(
                  'PRIVACY & POLICY',
                  style: TextStyle(
                      decoration: TextDecoration.underline,
                      fontSize: 27,
                      fontWeight: FontWeight.w700),
                ),
                ksizedbox20,
                ksizedbox30,
                Text(
                  '''Controlling Your Personal Information You May Choose To Restrict The Collection Or Use Of Your Personal Information In The Following Ways: Whenever You Are Asked To Fill In A Form On The Web Application , Look For The Box That You Can Click To Indicate That You Do Not Want The Information To Be Used By Anybody For Direct Marketing Purposes If You Have Previously Agreed To Us Using Your Personal Information For Direct Marketing Purposes, You May Change Your Mind At Any Time By Writing To Or Emailing Us At: admin@Bcipvtltd.Com We Will Not Sell, Distribute Or Lease Your Personal Information To Third Parties Unless We Have Your Permission Or Are Required By Law To Do So We May Use Your Personal Information To Send You Promotional Information About Third Parties Which We Think You May Find Interesting If You Tell Us That You Wish This To Happen. You May Request Details Of Personal Information Which We Hold About You Under The Data Protection Act 1998. A Small Fee Will Be Payable. If You Would Like A Copy Of The Information Held On You Please Write To Corporate Office: BCI, No: 781, Rayala Towers, Tower 2, 2nd Floor, Anna Salai, Chennai-02. If You Believe That Any Information We Are Holding On You Is Incorrect Or Incomplete, Please Write To Or Email Us As Soon As Possible, At The Above Address. We Will Promptly Correct Any Information Found To Be Incorrect.
          
          
          
          ''',
                  style: TextStyle(
                      height: 1.5, fontWeight: FontWeight.w400, fontSize: 15),
                  textAlign: TextAlign.left,
                ),
              ],
            ),
          ),
          ksizedbox40,
        
       MobileCommonBottom() ],
      ),
    );
  }
}

class RespoRepresentation extends StatelessWidget {
  const RespoRepresentation({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
       appBar: PreferredSize(
          child: AppBarMob(), preferredSize: Size(double.infinity, 40)),
          drawer: MobileDrawer(),
      body: ListView(
        children: [
          ksizedbox40,
          Padding(
            padding: const EdgeInsets.all(50),
            child: Column(
              children: [
                  
                Text(
                  'BCI REPRESENTATION AGREEMENT',
                  style: TextStyle(
                      decoration: TextDecoration.underline,
                      fontSize: 27,
                      fontWeight: FontWeight.w700),
                ),
                ksizedbox30,
                ksizedbox20,
                Text(
                  '''Notes for Reservation Fee and Commissions
          
1.	BCI ‘ll be responsible to deduct our commission and pay your fixed tariff as on before the guest check in to the hotel  
2.	All the payment through Indian Rupees
Term of Agreement
          
The term of this agreement shall commence as of the date hereof and shall continue for two years to be automatically renewed on a year-to-year basis.
               
          
IN WITNESS WHEREOF, Hotel(s) and BCI acting by and through their proper and duly authorized officers or representatives, have each duly executed this agreement under seal the day and year first above written.
          
          
          BCI	Hotel
          
          
          By: Dr. BENZE SARAVANAN.C	By: 	
          
          Title: PRESIDENT	Title: 	
          
          Date:	 		Date: 	 
          ''',
                  style: TextStyle(
                      height: 1.5, fontWeight: FontWeight.w400, fontSize: 15),
                  textAlign: TextAlign.left,
                )
              ],
            ),
          ),
          ksizedbox40,
        
       MobileCommonBottom() ],
      ),
    );
  }
}

class RespoAbout extends StatelessWidget {
  const RespoAbout({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
    appBar: PreferredSize(
          child: AppBarMob(), preferredSize: Size(double.infinity, 40)),
          drawer: MobileDrawer(),
      body: ListView(
        children: [
          
          ksizedbox40,
          Padding(
            padding: const EdgeInsets.all(30),
            child: Column(
              children: [
                Text(
                  'ABOUT BCI ',
                  style: TextStyle(
                      decoration: TextDecoration.underline,
                      fontSize: 27,
                      fontWeight: FontWeight.w700),
                ),
                ksizedbox30,
                ksizedbox20,
                Text(
                  '''
          
          
          
BCI MEMBERS BENEFITS
          
          
ALL IN ONE PRESTIGIOUS MEMBERSHIP 
(NEW PARTNER AND NEW REWARDS)  
          
COMPLEMENTARY ROOM STAY / COMPLEMENTARY LIQUOR / COMPLEMENTARY SPA / COMPLEMENTARY GYM. STAY………EARN……..ENJOY
          
HOTELS & SERVICES 
          
BCI PRESTIGE’S MEMBERS CAN ACCESS OUR  AMAZING DISCOUNTS COUPONS @ OUR ASSOCIATE HOTELS / RESORTS / SPAS / SALOONS / SERVICES APPARTMENTS / MARRIAGE HALLS / TOURS & TRAVELS
          
(MEMBER CAN GET UP TO 50 % DISCOUNTS)
          
          
ESSENTIAL BAZZAR 
          
BCI PRESTIGE’S MEMBERS CAN ACCESS OUR AMAZING DISCOUNTS COUPONS @ OUR ASSOCIATE PROVISION/ RESTAURANT/ JEWELLERY/ TEXTILE/ COMPLIMENTARY COUPON.
          
(MEMBER CAN GET UP TO 50 % DISCOUNTS)
          
A TO Z UTILITY SERVICE & ONLINE DISCOUNTS 
          
BCI PRESTIGE’S MEMBERS CAN ACCESS OUR AMAZING DISCOUNTS COUPONS @ OUR ASSOCIATE UTILITIES SERVICE PROVIDERS / ONLINE SHOPPING / ONLINE RECHARGE / ONLINE CINEMA TICKETS
          
MEMBER CAN AVAIL 
          
MEMBER TO MEMBER REFERRAL BENEFITS WALLET CASH BENEFITS
MEMBER CAN DO BUSINESS TO MEMBERS
MEMBER CAN USE CREDIT WITHDRAWAL IN THEIR WALLET
MEMBER CAN PLAY ON JACKPOT, WIN MEGA GIFTS OR GET 120% VALUE COUPONS
MEMBER CAN PROMOTE THEIR BUSINESS THROUGH PUSH MESSAGES ON THEIR APP
          
          ''',
                  style: TextStyle(
                      height: 1.5, fontWeight: FontWeight.w400, fontSize: 15),
                  textAlign: TextAlign.left,
                )
              ],
            ),
          ),
          ksizedbox40,
          
       MobileCommonBottom() ],
      ),
    );
  }
}
