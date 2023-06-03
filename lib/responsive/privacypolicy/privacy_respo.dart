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
class Tccc extends StatelessWidget {
  const  Tccc({super.key});

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
                  'Terms And Conditions',
                  style: TextStyle(
                      decoration: TextDecoration.underline,
                      fontSize: 27,
                      fontWeight: FontWeight.w700),
                ),
                ksizedbox30,
                ksizedbox20,
                Text(
                  '''
 
WELCOME TO OUR WEB APPLICATION & APP. IF YOU CONTINUE TO BROWSE AND USE THIS WEB APPLICATION & APP YOU ARE AGREEING TO COMPLY WITH AND BE BOUND BY THE FOLLOWING TERMS AND CONDITIONS OF USE, WHICH TOGETHER WITH OUR PRIVACY POLICY GOVERN BCI RELATIONSHIP WITH YOU IN RELATION TO THIS WEB APPLICATION & APP.
THE TERM ‘ BCI ‘ OR ‘US’ OR ‘WE’ REFERS TO THE OWNER OF THE WEB APPLICATION & APP WHOSE CORPORATE OFFICE IS NO.781, RAYALA TOWERS, TOWER 2, ANNA SALAI, CHENNAI-600002. OUR COMPANY REGISTRATION NUMBER IS 297 / 2008 PLACE OF REGISTRATION IS CHENNAI THE TERM ‘YOU’ REFERS TO THE USER OR VIEWER OF OUR WEB APPLICATION & APP.
THE USE OF THIS WEB APPLICATION & APP IS SUBJECT TO THE FOLLOWING TERMS OF USE: THE CONTENT OF THE PAGES OF THIS WEB APPLICATION & APP IS FOR YOUR GENERAL INFORMATION AND USE ONLY. IT IS SUBJECT TO CHANGE WITHOUT NOTICE.
NEITHER WE NOR ANY THIRD PARTIES PROVIDE ANY WARRANTY OR GUARANTEE AS TO THE ACCURACY, TIMELINESS, PERFORMANCE, COMPLETENESS OR SUITABILITY OF THE INFORMATION AND MATERIALS FOUND OR OFFERED ON THIS WEB APPLICATION & APP FOR ANY PARTICULAR PURPOSE. YOU ACKNOWLEDGE THAT SUCH INFORMATION AND MATERIALS MAY CONTAIN INACCURACIES OR ERRORS AND WE EXPRESSLY EXCLUDE LIABILITY FOR ANY SUCH INACCURACIES OR ERRORS TO THE FULLEST EXTENT PERMITTED BY LAW.
YOUR USE OF ANY INFORMATION OR MATERIALS ON THIS WEB APPLICATION & APP IS ENTIRELY AT YOUR OWN RISK, FOR WHICH WE SHALL NOT BE LIABLE. IT SHALL BE YOUR OWN RESPONSIBILITY TO ENSURE THAT ANY PRODUCTS, SERVICES OR INFORMATION AVAILABLE THROUGH THIS WEB APPLICATION & APP MEET YOUR SPECIFIC REQUIREMENTS.
THIS WEB APPLICATION & APP CONTAINS MATERIAL WHICH IS OWNED BY OR LICENSED TO US. THIS MATERIAL INCLUDES, BUT IS NOT LIMITED TO, THE DESIGN, LAYOUT, LOOK, APPEARANCE AND GRAPHICS. REPRODUCTION IS PROHIBITED OTHER THAN IN ACCORDANCE WITH THE COPYRIGHT NOTICE, WHICH FORMS PART OF THESE TERMS AND CONDITIONS.
ALL TRADEMARKS REPRODUCED IN THIS WEB APPLICATION & APP WHICH IS NOT THE PROPERTY OF, OR LICENSED TO, THE OPERATOR IS ACKNOWLEDGED ON THE WEB APPLICATION & APP.
UNAUTHORIZED USE OF THIS WEB APPLICATION & APP MAY GIVE RISE TO A CLAIM FOR DAMAGES AND/OR BE A CRIMINAL OFFENSE.
FROM TIME TO TIME THIS WEB APPLICATION & APP MAY ALSO INCLUDE LINKS TO OTHER WEB APPLICATION & APP. THESE LINKS ARE PROVIDED FOR YOUR CONVENIENCE TO PROVIDE FURTHER INFORMATION. THEY DO NOT SIGNIFY THAT WE ENDORSE THE WEB APPLICATION & APP (S). WE HAVE NO RESPONSIBILITY FOR THE CONTENT OF THE LINKED WEB APPLICATION & APP(S).
YOU MAY NOT CREATE A LINK TO THIS WEB APPLICATION & APP FROM ANOTHER WEB APPLICATION & APP OR DOCUMENT WITHOUT BCI PRIOR WRITTEN CONSENT.
YOUR USE OF THIS WEB APPLICATION & APP AND ANY DISPUTE ARISING OUT OF SUCH USE OF THE WEB APPLICATION & APP IS SUBJECT TO THE LAWS OF INDIA OR OTHER REGULATORY AUTHORITY.

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











class SarviceAgrement extends StatelessWidget {
  const  SarviceAgrement({super.key});

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
                  'BCI VENDOR SERVICE AGREEMENT & SERVICE FEE TERMS ',
                  style: TextStyle(
                      decoration: TextDecoration.underline,
                      fontSize: 27,
                      fontWeight: FontWeight.w700),
                ),
                ksizedbox30,
                ksizedbox20,
                Text(
                  '''


Dear Sir ,  As discussed, request you to please confirm the below mentioned via a response to this email Free Online Reservations via our Call Centre wherein  

Customer will be able to reserve a slot for your outlet using the BCI app Our fully equipped call centre will connect with you / your team to book service slots for customers   

This  BCI app is an essential and integral part of the understanding being executed along with the Vendors. 

Terms and Conditions amongst BCI app and/ or Strategic Partner (“Platform Parties”) and the “Vendors”
 
which shall, at all times, be read as part and parcel of the Vendors Terms and Conditions and deemed to be entered and executed on the date of signing of this BCI app 01/06/2023“Effective Date”, and which constitutes a legally binding agreement between the “Vendor” and “BCI”, for featuring the Vendor’s Offers on the “BCI app”.

VENDOR’S INFORMATION

LEGAL ENTITY NAME OF THE VENDOR’S

 BENZE CLUB INTERNATIONAL 

BRAND NAME OF THE VENDOR’S (IF ANY)

 BENZE CLUB INTERNATIONAL 

REGISTERED VENDOR ADDRESS

NO 781, TOWER 2, 2ND FLOOR, RAYALA TOWERS, ANNASALAI ,  MOUNT ROAD, CHENNAI 600002

AUTHORIZED SIGNATORY DETAILS FOR AND ON BEHALF OF VENDOR’S

NAME: ASHOK KUMAR
DESIGNATION: MARKETING HEAD 
EMAIL ID: 
Phone No: 9999999999

ENTITY PAN:

(In case of Company or Limited Liability Partnership)

In case of Billing Office Address          ☐
                                                         

In case of Registered Office Address  ☐                                             

AADHAR NUMBER:

(In case of Proprietary Concern) 
(In case GST is unavailable or exempted, then a Non-GST Declaration is to be provided by the Vendor’s)

POWER OF ATTORNEY:

(In case of Partnership Firm) 
(For multiple entities at different locations, Vendor’s needs to mention all these locations along with their respective GSTIN vide separate Annexure to this Form)


ENTITY GST:


VENDOR’S BANK ACCOUNT DETAILS (Attach cancelled cheque)

Beneficiary Name	BENZE CLUB INTERNATIONAL
Bank Account No.	15000001111111111
Bank Name	DBS BANK
Branch Name	MOUNT ROAD
IFSC Code	DBS000080124





SERVICE DETAILS - TERMS OF ENGAGEMENT

•	The Vendors’ Offers/ Deals (“Offers”) shall be featured on the Platform in accordance with the Offers/ Deals as agreed with the Vendor’s on its goods/ services from time to time during the Term of the Agreement along with the associated Terms and Conditions.
•	The Offers and Marketplace Fee can be agreed via emails from the Registered Email ID of the Vendor’s on the Platform or by way of a separate Addendum/ Annexure to this Form.
•	The Customers/ Users shall avail the Offers/ Deals offered by the Vendor’s on the Platform by submitting the Vouchers (containing the unique code) at the Vendor’s Establishment from where he/ she conducts the businesses
•	The Vendor’s agrees and confirms not to undercut the agreed pricing as listed against these deals on Platforms or to offer/sell at a lower price in any manner at its Establishment directly to its customers. 
•	The Vendor’s shall solely be responsible for the MRP’s agreed under this Agreement and shall guarantee at all times that the offer price shall not be greater than MRP of Products / Service offered.
•	The pricing and the associated terms and conditions shall be valid from the “Effective Date”.


OFFERS/ DEALS APPLICABILITY

All Establishments                  < Y / N > Y

Selective Establishments      < Y  / N > N       
                                                     
(In case of Select Establishments, details to be provided separately as an Annexure or over an email from the registered Email ID)
 
TERMS OF PAYMENT

Daily Payment on Redemption as per RBI rules.

INVOICING DETAILS

Daily on BCI app business login

I / We, the Vendor’s, accept and acknowledge that I/ We have read and understood the Terms and Conditions (as may be amended from time to time) associated with this Form, which are displayed on BCI app Platform maintained by BCI (P) LTD, as may be amended from time to time. These Terms and Conditions & The Terms of Use, are incorporated by reference herein and shall be deemed to be a part and parcel of this Form to the same extent as if such provisions had been set forth in full herein. The Terms and Conditions & The Terms of Use are binding to the Vendors as well as its Customers and shall be read along with this Form at all times. The Parties hereby agree that this Form is in supersession to any and all previous Agreements and Forms entered between the Parties in relation to the BCI (P) LTD.

AGREED, ACKNOWLEDGED AND SIGNED BY VENDOR’S 

NAME:  ASHOK KUMAR
DESIGNATION: MARKETING HEAD 
 
OUTLET NAME: BENZE CLUB INTERNATIONAL 
PREPAID OPTIONS:


OFFER/ DEAL DETAILS

UNLIMITED VEG AND NON VEG STARTERS WITH DRINKS FOR 2
 
MRP OF PRODUCT PRICE / SERVICE PRICE 

4000 INR

VENDOR DISCOUNT PRICE ON PRODUCT/ DISCOUNT ON SERVICE

3000 INR

BCI SERVICE FEE %

11.80% (OR) 354 INR 
 
AMOUNT PAYABLE TO VENDOR’S
2646 INR
OFFER VALIDITY (DAYS)

MONDAY TO SUNDAY

OFFER VALIDITY (TIMINGS)

12PM TO 3PM & 4PM TO 7PM
BCI                                                                          VENDOR

By:_________________________                          By: _______________________

Title:________________________                        Title: _______________________
     
Date:________________________                        Date:_______________________
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