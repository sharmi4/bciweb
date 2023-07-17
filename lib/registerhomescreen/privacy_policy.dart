import 'package:bciweb/constant/constans.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../controller/specialized_controller.dart';
import '../views/members/common_widget/common.dart';
import 'common_reg_bottom.dart';
import 'common_reg_homescreen.dart';




class Canslation extends StatefulWidget {
  const Canslation({super.key});

  @override
  State<Canslation> createState() => _CanslationState();
}

class _CanslationState extends State<Canslation> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
          child: CommonScreen(), preferredSize: Size(double.infinity, 40)),
      body: ListView(
        children: [
          RegisterCommonContainer(),
          ksizedbox40,
          Padding(
            padding: const EdgeInsets.all(80.0),
            child: Column(
              children: [
                Text(
                  'REFUND AND CANCELLATION POLICY',
                  style: TextStyle(
                      decoration: TextDecoration.underline,
                      fontSize: 27,
                      fontWeight: FontWeight.w700),
                ),
                ksizedbox30,
                ksizedbox20,
                Text(
                  '''1.	THERE SHALL BE NO CANCELLATION OF MEMBERSHIP AFTER 48 HOURS OF BECOMING A MEMBER AS WELL AS FOR TRAVEL, MEMBERS STAY.
2.	IF YOU HAVE CANCELLED MEMBERSHIP AMOUNT WILL BE REFUNDED WITHIN 24 HOURS THROUGH NET BANKING
3.	THERE SHALL BE 20% DEDUCTED FOR CANCELLING THE MEMBERSHIP WITHIN STIPULATED TIME WHATEVER THE FEES PAID FOR MEMBERSHIP, TRAVEL, STAY, SPA, FOOD, LIQUOR, ETC.
4.	THERE SHALL BE 50% OF THE ADVANCE AMOUNT BE PAID BY THE MEMBER FOR TRAVEL, STAY, LIQUOR, FOOD, ETC BEFORE 30 DAYS OF CHECK-IN DATE AND 100% OF THE AMOUNT SHALL BE PAID LESS THAN 15 DAYS OF CHECK-IN DATE FOR THE SAME.
5.	ADVANCE BOOKING OF MEMBERS FOR TRAVEL, STAY, SPA, LIQUOR FOOD, ETC SHALL NOT BE MORE THAN 90 DAYS.
6.	LIFETIME SHALL MEAN THE LIFETIME OF A MEMBER ONCE BECAME A MEMBER OF BCI

7.	IN CASE YOU FEEL THAT THE SERVICE AVAIL IS NOT AS LISTED ON THE SITE OR AS PER YOUR EXPECTATIONS, YOU MUST BRING IT TO THE NOTICE OF OUR CUSTOMER CARE WITHIN 48 HOURS OF REGISTERING THE ONLINE MEMBERSHIP. THE CUSTOMER CARE TEAM AFTER LOOKING INTO YOUR COMPLAINT WILL TAKE AN APPROPRIATE DECISION.

8.	NO REFUND IS ENTERTAINED FOR THE PRODUCTS/SERVICES YOU AVAILED FROM OUR BCI APP. IF YOU ARE, FOR ANY REASON, NOT ENTIRELY HAPPY WITH OUR SERVICE, WE WILL CHEERFULLY ISSUE THE REFUND BASED ON THE SERVICE UTILIZED. 

9.	WE MAINTAIN AND SERVE OUR BCI PRESTIGIOUS MEMBERS THAT HUNDREDS OF SATISFIED CUSTOMERS WIDE COUNTRY, AND OUR SUPPORT ARE SECOND TO NONE.

10.	TO REQUEST A REFUND, SIMPLY CONTACT US WITH YOUR MEMBERSHIP DETAILS WITHIN 24 HOURS OF SERVICE UTILIZE. PLEASE MENTION THE MEMBERSHIP DETAILS AND OPTIONALLY TELL US WHY YOU’RE REQUESTING A REFUND – WE TAKE CUSTOMER OPINIONS VERY SERIOUSLY AND USE IT TO CONSTANTLY IMPROVE OUR QUALITY OF SERVICE.

11.	REFUNDS ARE NOT BEING PROVIDED FOR SERVICES DELIVERED IN FULL SUCH AS ROOM STAY, CONSUMPTION OF ALCOHOL, PARTIES, EVENTS AND ON SPECIAL OCCASIONS. REFUNDS ARE BEING PROCESSED WITHIN 3 WEEKS PERIOD.
''',
                  style: TextStyle(
                      height: 1.5, fontWeight: FontWeight.w400, fontSize: 15),
                  textAlign: TextAlign.left,
                )
              ],
            ),
          ),
          ksizedbox40,
          RegisterCommonBottom()
        ],
      ),
    );
  }
}


class PrivacyPolicy extends StatefulWidget {
  const PrivacyPolicy({super.key});

  @override
  State<PrivacyPolicy> createState() => _PrivacyPolicyState();
}

class _PrivacyPolicyState extends State<PrivacyPolicy> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
          child: CommonScreen(), preferredSize: Size(double.infinity, 40)),
      body: ListView(
        children: [
          RegisterCommonContainer(),
          ksizedbox40,
          Padding(
            padding: const EdgeInsets.all(80.0),
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
          RegisterCommonBottom()
        ],
      ),
    );
  }
}

class Disclimer extends StatelessWidget {
  const Disclimer({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
          child: CommonScreen(), preferredSize: Size(double.infinity, 40)),
      body: ListView(
        children: [
          RegisterCommonContainer(),
          ksizedbox40,
          Padding(
            padding: const EdgeInsets.all(100),
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
          RegisterCommonBottom()
        ],
      ),
    );
  }
}

class Representation extends StatelessWidget {
  const Representation({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
          child: CommonScreen(), preferredSize: Size(double.infinity, 40)),
      body: ListView(
        children: [
          ksizedbox40,
          Column(
            children: [
              RegisterCommonContainer(),
              Text(
                'BCI REPRESENTATION AGREEMEND',
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
          ksizedbox40,
          RegisterCommonBottom()
        ],
      ),
    );
  }
}

class About extends StatelessWidget {
  const About({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
          child: CommonScreen(), preferredSize: Size(double.infinity, 40)),
      body: ListView(
        children: [
          RegisterCommonContainer(),
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
          RegisterCommonBottom()
        ],
      ),
    );
  }
}
class Service extends StatelessWidget {
  const Service({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
          child: CommonScreen(), preferredSize: Size(double.infinity, 40)),
      body: ListView(
        children: [
          RegisterCommonContainer(),
          ksizedbox40,
          Padding(
            padding: const EdgeInsets.all(100),
            child: Column(
              children: [
                Text(
                  'BCI VENDOR SERVICE AGREEMENT & SERVICE FEE TERMS ',
                  style: TextStyle(
                      decoration: TextDecoration.underline,
                      fontSize: 27,
                      fontWeight: FontWeight.w700),
                ),
                ksizedbox20,
                ksizedbox30,
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
                ),
              ],
            ),
          ),
          ksizedbox40,
          RegisterCommonBottom()
        ],
      ),
    );
  }
}
class Tc extends StatelessWidget {
  const Tc({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
          child: CommonScreen(), preferredSize: Size(double.infinity, 40)),
      body: ListView(
        children: [
          RegisterCommonContainer(),
          ksizedbox40,
          Padding(
            padding: const EdgeInsets.all(100),
            child: Column(
              children: [
                Text(
                  'MUTUALLY AGREED TERMS AND CONDITIONS FORM',
                  style: TextStyle(
                      decoration: TextDecoration.underline,
                      fontSize: 27,
                      fontWeight: FontWeight.w700),
                ),
                ksizedbox20,
                ksizedbox30,
                Text('''MUTUALLY AGREED TERMS AND CONDITIONS FORM

These Terms and Conditions “Agreement” are an essential and integral part of the ‘Mutually agreed Form’ which shall, at all times, be read as part and parcel of the Mutually agreed Form and deemed to be entered and executed on the date of signing of Mutually agreed Form “Effective Date”, and the Mutually agreed Form “Form” which constitutes a legally binding agreement between the “Vendors” and BCI, for featuring the Vendor’s Offers on the “App Platform s” (all as defined below).

1 DEFINITIONS

1.1 “Agreement” here shall mean and refer to the Terms and Conditions agreed between the Vendors and BCI and/ or any of its Strategic Partner(s) deemed to be entered on the execution of a defined Mutually agreed Form containing the reference of the Terms and Conditions contained herein below and is also available as a unique pdf document link in the Mutually agreed Form.

1.2 “Applicable Law” shall mean and refer to all applicable laws, statutes, ordinances, rules, regulations, guidelines, policies and other pronouncements including amendments thereof having the force of law by Central, State, Municipality, Court, Tribunal, Governmental Authority, Appellate Authority, Ministry, Department, Commission, Regulatory Authority (including self- regulating codes) or any Judicial Forum.

1.3 “Cashback/ Discount” shall mean and refer to a promotional incentive offered to a Customer using an Offer booked on the App Platform that can be used by the Customer while making payment(s) for the next transaction on the App Platform within the validity period of such Cashback or Discount offered to such Customer.

1.4 “Customer” shall mean and refer to a registered user of the App Platform who Transacts on the App Platform.

1.5 “Effective Date” shall mean and refer to the date on which the mutually agreed Form is signed and executed between the App Platform Parties and the respective Vendors.

1.6 “Establishment(s)” means an establishment from where the Services/ Products of the Vendors can be availed by the Customer, and shall not be limited to all kind of food outlets/ restaurants/ cafes, hotels/ service apartments/ guest house, spa, salon, wellness center, cinema/ theatre, amusement/ entertainment parks and/ or any other place of service from which the Vendors conducts or operates its business either on a permanent or temporary basis.

1.7 “Flash Sale/ Promotional Activity” shall mean and refer to any marketing or promotional campaign which is made live for a ‘limited span of time’ and is a tailor-made concept solely developed by the App Platform Party, keeping in mind the services which the Vendors specializes in and to which the Vendors consents and acknowledges 
1.8 “Mutually agreed Fee” shall mean and refer to any Settlement Mechanism which is applicable on the below Deals/ BCI Pay/ BCI Rewards listed by the Vendors on the App Platform:

1.8.1 In case of Deals: That percentage proportion of the Commission which is deducted from the total price of Offer/ Deal/ Voucher value of the service / product availed by the Customer.

1.8.2 In case of BCI Pay: That Percentage proportion of the Commission which is deducted from the Vendors Share from the amount of the Offer/ Deal value minus additional Cashback/ Discount, if any, offered by the Vendors to the Customer on its Deal/ Offer.

1.8.3 In case of BCI Rewards: That Percentage proportion of Commission which is deducted from the Vendors Share from the total amount of the Offer/ Deal/ Voucher, if any, offered by Vendors to the Customer on its Deal/ Offer.

1.9 “Mutually agreed Form” shall mean and refer to the arrangement entered into between the Vendors and BCI and/ or Strategic Partner for providing goods/ services on the basis of a comprehensive understanding between the Parties executed with free consent that contains the link of the terms and conditions contained in this Agreement which shall include and shall not be limited to Vendors Information, Vendors Bank Account Details, Service Details, Offer Details, Acknowledgment/ Confirmation, any other Annexure pertaining to the Vendors Share, MRP, Commission, Convenience Fee, etc.

1.10 “Vendors” shall mean and refer to a Sole Proprietor or any other Authorized Person by way of an Authority Letter in case of a Proprietary Concern, Partner or any person so authorized by all the Partners by way of Power of attorney in case of a Partnership Firm or a Designated Partner in case of a Limited Liability Partnership Concern or a Director in case of a Company or any person authorized as such by a duly passed Board Resolution in this regard, or the Karta of the HUF, as the case may be, representing the commercial establishment, who executes the Form and agrees thereby to be bound by the terms and conditions contained in the Form as a PDF link of the terms and conditions mentioned in this Agreement to enable listing of Offers through the App Platform /s.

1.11 “BCI Pay” shall mean and refer to the offers where the Customers book a Service/ Product and may choose to pay for that particular Service/ Product at the time of availing that Service/ Product using the App Platform.

1.12 “BCI Gift Cards (BCI GC)” shall mean and refer to all the offers where the Vendors gets an interface created solely by BCI on the App Platform to create and list such deals with unique voucher codes having an appropriate value against the actual MRP of the services or goods which are offered by the Vendors by accepting and acknowledging the terms and conditions relating to these BCI GC on the interface. 
1.13 "BCI Rewards" shall mean and refer to the Customers who successfully avail the offers and deals listed on the App Platform by the respective Vendors of the App Platform Party.

1.14 BCI shall mean and refer to BCI (P) LTD, a Company (including its group companies, successors and assigns) incorporated under the Companies Act, 1956 having Corporate Identification Number BCI, with its registered office at Building No.781, Rayala Towers, Tower 2, 2nd Floor, Annasalai, Mount Road, Chennai- 600002.

1.15 “BCI Credits” shall mean and refer to virtual currency equivalent to
Same amount of Indian Rupees stored in the BCI Wallet.

1.16 “BCI Vendors Center” means and refers to the interface created and developed solely by BCI using its App Platform accessible by its respective Vendors vide the link http://Vendors.BCI .com and may be amended from time to time by BCI at its own discretion.

1.17 “BCI App Platform” shall mean and refer to the App Platform designed, developed, amended and operated by BCI through its website www.BCI .com and the BCI mobile application, and shall include any other App Platform owned, designed, developed, amended or operated by BCI from time to time.

1.18 “BCI Wallet” shall mean and refer to a payment mode available to all the BCI registered users through which the Customers can complete their bookings on BCI App Platform.

1.19 “Offer(s)” shall mean and refer to offers on the Services/ Products of the Vendors as may be listed on an App Platform, and includes deals/ BCI Pay/ BCI Rewards Offers.

1.20 “Payment Gateway” shall mean and refer to a provider of the payment gateway solutions, including e-wallet services, with whom an App Platform Party may engage for enabling the collection of such payments from the Customer towards the Offers redeemed/ transacted.

1.21 “App Platform (s)” shall mean and refer to the BCI App Platform and/ or any
Strategic Partner’s Application.

1.22 “App Platform Party” shall mean and refer to, in respect of an order placed by a
Customer on the App Platform.

1.23 "Redemption" shall mean and refer to the transaction where the Customer, after purchasing the voucher for the Services/ Products, avails the same within the validity period of such voucher for which the Vendors, at all times, ensures that the redemption is completed on the BCI Vendors Center.

1.24 “Services/ Products” shall mean and refer to the services / products offered
By the Vendors on the App Platform s. 

1.25 “Strategic Partner” shall mean and refer to a third party with which BCI may enter or already has entered into a strategic alliance for displaying / promoting / advertising / featuring Vendors Offers through a Strategic Partner Application.

1.26 “Strategic Partner Application” shall mean and refer to software, website or
Mobile application designed, developed and operated by a Strategic Partner.

1.27 “Voucher” shall mean and refer to the acknowledgement receipt, containing an alphanumeric code / QR Code and the terms of the offer / deal, received by the Customer upon transacting a Vendors Offer listed on the App Platform.

2 TYPES OF OFFERS

2.1 Deals: The Vendors may elect to provide offer/ deal to Customers on the
App Platform, and for all such offers:

2.1.1 The App Platform Party will collect payment made by a Customer for Offers booked/ purchased, as the case may be, through the Payment Gateway or on its own.

2.1.2 The App Platform shall issue a Voucher to the Customer, which is only a confirmation of the payment received from the Customer. The Voucher shall give a right to the Customer to demand and receive Services/ Products from the Vendors upon presentation of the Voucher within the validity period of the Offer and in accordance with the terms of the Offer.

2.1.3 Payments received from the Customer by a App Platform Party shall be remitted to the Vendors, post redemption of Voucher, after adjustment of the mutually agreed Fee required to be paid by the Vendors to the relevant App Platform Party.

2.2 BCI Pay Offers: Here BCI and the Vendors agree to feature BCI Pay Offers on the App Platform, the Vendors shall be allowed access to App Platform through the Vendors account feature for offering Cashback/ Discount (in addition to any existing Cashback). Mutually agreed Fees for BCI Pay Offers shall be agreed under the Form and may be modified from time to time upon mutual agreement between the Vendors and BCI. The Vendors may at any time modify/ remove the additional Cashback/ Discount that is offered by the Vendors in relation to BCI Pay Offers only on the App Platform. However, the App Platform Party may, in its sole discretion on a fair and reasonable basis shall be at liberty to modify, alter, recall or amend the Cashback/ Discount offered by the Vendors from time to time of which the App Platform Party shall be under no obligation or any liability of any manner whatsoever in regard of such modifications. Payments received from the Customer by BCI for BCI Pay Offers shall be remitted to the Vendors after adjustments of the mutually agreed Fee required to be paid by the Vendors to the relevant App Platform Party. 
The mechanism here for featuring and availing the BCI Pay Offers on the
App Platform shall include the following:

The Customer here first books the discount as per the slots mentioned for the Offer/Deals provided by the Vendors on the App Platform. On availing of these services/ products the Customer then pays via BCI Pay. Once the payment for these services/ products is made the Customer shall get an instant payment acknowledgment that will further be shown to the Vendors to avail the discount/ cashback provided by the Vendors on the App Platform.

2.3 Promotional Activity/ Flash Sale: Here a Flash Sale is made live where a App Platform Party has customized a marketing activity/ campaign to be made live on the App Platform for the customers for a limited duration of time, and such an activity, at all times, shall be treated as an additional activity for promotions and sales enhancement of the Vendors’s goods/ services. This activity shall be agreed via any form of electronic communication in writing to be duly received by the App Platform Party from the Vendors within a reasonable time before such activity goes live and shall be treated as an acknowledgment by the Vendors.

2.4 BCI Rewards (BCI Rewards): Here a customer visits a Vendors’s Establishment and redeems the Offer/ Deal using the App Platform Rewards Feature available on the Vendors Offers/ Deals and gets reward points on such transactions, where One Reward Point is equal to One INR. These Reward Points are accrued in the Customer’s Account, which can be further used to avail the products/ services of the same Vendors only.

2.5 BCI Gift Cards (BCI GC): Here BCI and Vendors agree to a certain set of terms and conditions made available to the Vendors subject to the discretion of BCI on the interface developed by BCI which is a self- serve option to the Vendors (where creation of which is solely at Vendor’s end by a unique Username and Password provided initially by BCI ) to create and list such deals with unique voucher codes/ Gift Cards having an appropriate dummy value against the actual MRP of the services or goods which are offered by the Vendors by accepting and acknowledging the terms and conditions relating to these BCI GC available on the interface.

3 APP PLATFORM 

3.1 The Vendors agrees that a App Platform Party’s role is limited to managing the App Platform for the display of the Offers and other incidental services to facilitate online transactions between Vendors and the Customer and hence the App Platform Party shall merely act as intermediaries under the terms of the Information and Technology Act, 2000, and the Rules made thereunder. The transaction for sale of any of the Services/ Products is a bipartite contract between the Vendors and the Customer and the App Platform Party will not have any obligations or liabilities in respect of such contract nor shall an App Platform Party hold any rights, title or interest in the Services/ Products. App Platform Party will also not be responsible for any unsatisfactory performance or any actions or inactions or omissions by the Vendors including delays, defects or misinformation. 

3.2 Each App Platform Party is, and its role is limited to, operating as an information technology App Platform on a digital and electronic network to act as a facilitator between a Vendors and Customer for transacting Services/ Products offered by the Vendors.

3.3 Each App Platform Party shall make available a customer service center to provide assistance to Customers in relation to their transactions on the relevant App Platform. Vendors shall provide all information and assistance as may be requested by App Platform Party or its customer service centers to assist the Customers in resolving any queries, enquiries or grievances, provided however that it is understood that the overall responsibility for resolving any queries, enquiries or grievances of Customers is of the Vendors. App Platform Party disclaims any liability arising due to delay in providing information to Customers, or failure in resolution of queries, grievances and disputes of Customers to their satisfaction.

3.4 The Vendors acknowledges that as App Platform Party is not a party to any transactions between Vendors and Customers, and the Vendors hereby releases and discharges the App Platform Party from any claims, disputes, demands, liabilities and damages, of any nature (whether direct, indirect, actual or consequential), arising out of or in relation to or in connection with transactions on a App Platform.

3.5 BCI shall provide an IT Infrastructure App Platform known as “Business login” (“BCI Vendors App”) to enable the Vendors in tracking the success of the Service/ Product marketed.

3.6 The App Platform Party does not assume any obligation for the success of the Services/ Products marketed through the App Platform s nor do they grant any exclusivity to the Vendors of any space on the App Platform on which its Services/ Products are marketed.

3.7 The Vendors agrees that it is its responsibility to ensure that the Services/ Products and Offers comply with all Applicable Laws. An App Platform Party may, in its sole discretion, suspend a vendor’s access and/ or cease to list any Services/ Products of the Vendors, forthwith and without notice, where a Vendors is in violation of any Applicable Law or in the breach of the provisions of this Agreement.

3.8 The App Platform Party shall display on the App Platform, on best effort basis, all necessary information provided by the Vendors. However, an App Platform Party shall not be under any obligation to display any information until the Vendors provides all necessary information and such information is in compliance with the respective App Platform s policies and guidelines.

3.9 The Vendors agrees that all information provided to a App Platform Party that is published on the App Platform or otherwise, may be relied upon by Customers to enable them to evaluate and enter into a binding contract for Services/ Products. 
3.10 The Vendors hereby agrees and undertakes that it shall not provide any information or data to an App Platform Party in relation to the Services/ Products (including text descriptions, graphics or pictures relating thereto) that:

3.10.1 Belongs to another person and to which the Vendors does not have any right;

3.10.2 Is grossly harmful, harassing, blasphemous, defamatory, obscene, pornographic, pedophilic, libelous, invasive of another’s privacy, hateful, or racially, ethnically objectionable, disparaging, relating or encouraging money laundering or gambling, or otherwise unlawful in any manner whatsoever;

3.10.3 Harms minors in any manner whatsoever;

3.10.4 Infringes any patent, trademark, copyright, technological information, trade secrets, or other proprietary rights/ intellectual property, etc.;

3.10.5 Violates any applicable law for the time being in force;

3.10.6 Deceives or misleads the addressee about the origin of such messages or communicates any information which is grossly offensive or menacing in nature;

3.10.7 Impersonates another person;

3.10.8 Contains software viruses or any other computer code, files or programs designed to interrupt, destroy or limit the functionality of any computer resource or any mobile interface;

3.10.9 Threatens the unity, integrity, defense, security or sovereignty of India, friendly relations with foreign states, or public order or causes incitement to the commission of any cognizable offence or prevents investigation of any offence or is insulting any other nation; or

3.10.10Is misleading or known to be false in any way.

4 VENDORS’S DUTIES AND OBLIGATIONS

4.1 Any Offers featured on the App Platform s pursuant to this Agreement and the Mutually agreed Form executed between the Parties, for which the preview has been sent to the Vendors, or the Offers that are featured/ displayed/ advertised on the App Platform and transacted by the Customer, cannot be refused by the Vendors.

4.2 The Vendors will ensure that the attributes of the Offer and information relating to the Services/ Products provided to the App Platform Party is current, accurate, complete, and relevant for each Service/ Product while listing for sale on an App Platform including but not limited to its name, address, contact telephone number, manager/ contact person details, price lists, taxes, service addresses, and other relevant information. The App Platform Party may not check 
or monitor the listings, data and contents displayed, appearing, published and transmitted on the App Platform and that the App Platform s or App Platform Party do not own, stock, sell, distribute or in any manner come into possession of or verifies any services or products listed or put up for sale on App Platform. The App Platform is an App Platform which enables transactions between the various users of the App Platform as an independent and objective mutually agreed provider. The App Platform Party and the App Platform are not originators of or for any third party or content on the App Platform.

4.3 The Vendors acknowledges and agrees that it will be solely responsible for providing the Services/ Products to the Customers. The Vendors will be responsible for the warranty and guarantee of the quality, expertise, safety, usability, permits or the like of any service or product or activity being marketed on the App Platform and the responsibility for the same shall, at all times, during and after the Term of the Agreement remain with the Vendors. The Vendors agrees to promptly redress the Customer complaints, which have been referred by a App Platform Party to the Vendors in respect of the Services/ Products.

4.4 The Vendors acknowledges and affirms that if there is any statutory requirement under law for obtaining/ renewing any licenses or approvals pertaining to Vendor’s businesses and operations like licenses regarding serving of alcohol and/ or any other applicable licenses such as FSSAI License, Legal Metrology Certificate, Fire NOC, Drug License, Pollution Clearance Certificate, etc., from any Department/ Panchayat/ Governmental/ Appellate Board or Nodal Authority shall be the sole responsibility of the Vendors for compliances associated and the App Platform Party disclaims any liability of whatsoever nature pertaining thereto.

4.5 The Vendors warrants that the Services/ Products provided to
Customers are:

4.5.1 Of high quality;

4.5.2 Vendors able and imperishable in nature

4.5.3 Fit for human consumption, wherever applicable;

4.5.4 Comply with all the Applicable Laws.

4.6 The Vendors acknowledges the value created by the App Platform s for its Services/ Products and has accordingly contracted with the App Platform Party for listing its Services/ Products on the App Platform s.

4.7 The Vendors hereby agrees not to solicit or prompt or otherwise dissuade a Customer from using or transacting through the App Platform s, and shall promote the App Platform s as a means of transacting with the Vendors.

4.8 The Vendors agrees to not accept any other means of payment except payment through the App Platform s, should a customer approach the Vendors by 
Making reservation through the App Platform s. The Vendors also agrees to not to cancel or reject the booking of the Customer after accepting the same.

4.9 The Vendors will not discriminate while providing Services/ Products between its customers and Customers booking via the App Platform.

4.10 In case of BCI Pay Offers, the Vendors shall retain proof of payment for a period of 180 days from the date of providing the Services/ Products to the Customer.

4.11 The Vendors agrees to provide Services/ Products only at the Establishment for which such Service/ Product are sought or at any other place of service from which the Vendors conducts or operates its business either on a permanent or temporary basis. The Vendors undertakes to ensure additional oversight by it for any Services/ Products that are offered at a location other than a Vendors Establishment to ensure quality of services are not adversely impacted.

4.12 The Vendors shall:

4.12.1 Undertake adequate police verification and background checks for its personnel and maintain records of the same;

4.12.2 Ensure that its personnel are not intoxicated while on duty;

4.12.3 Ensure that its personnel do not misbehave with the Customer or otherwise engage in conduct which may constitute an offence of moral turpitude;

4.12.4 Make timely payment of all applicable statutory dues;

4.12.5 Maintain adequate insurances; and

4.12.6 Provide proper training to its personnel to ensure that its personnel provide the Services without any delay and negligence

4.13 The Vendors shall address and resolve all Customer complaints received by a App Platform Party relating to the efficacy, quality or any other issues relating to the Services/ Products expeditiously within timelines prescribed by the relevant App Platform Party or Applicable Laws and the Vendors shall be solely liable and bound to take action on complaints raised by Customer pertaining to the Offer(s) and the Services/ Products provided thereto.

4.14 The Vendors acknowledges and agrees that the Vendors shall be required to provide all the correct details in the Mutually agreed Form along with a copy of its PAN Card, TAN, GSTIN and other required details as may be requisitioned by a App Platform Party from time to time failing which, the relevant App Platform Party reserves the right to delist the Vendors from the App Platform and/ or curtail its access from the App Platform. 
4.15 The Vendors acknowledges and agrees, at all times, to designate the duly appointed Authorized Signatory/ Personnel to do such activities as agreed under this Agreement and if such Authorized Signatory is changed, till the time this Agreement is live between the Parties, it shall be the duty of the Vendors to intimate via written communication at least 15 days prior/ post such change is implemented.

4.16 The Vendors shall, at all times, keep handy all the required approvals, certifications and accreditations from recognized national/ international accredited laboratories of which the Vendors is in the business of services relating to such specialized services such as conducting of tests of blood/ stool/ urine/ fluid/ pathogen, etc.

4.17 The Vendors shall not engage in any fraudulent activity and shall be liable to the App Platform Party. Fraudulent activity for the purposes of this Agreement shall include but not be limited to a suspicious event deemed to be suspicious by the App Platform Party where there is an irregular upsurge in the redemption of Offer Options by the Vendors or its relatives, affiliates, employees, acquaintances, etc. Each App Platform Party reserves the right to delist the Vendors from the App Platform and/ or curtail its access to the App Platform in such cases. In any such event the App Platform Party shall not be liable to release the payment for any such fraudulent activity committed or under consideration to the Vendors by the App Platform Party.

4.18 The Vendors hereby agrees and undertakes that it shall adhere to all Applicable Laws in rendering services as agreed under this Agreement with the App Platform Party relating to spas, salons, wellness centers and similar Establishments (“Wellness Establishments”) and shall not violate any provisions including but not limited to the Immoral Traffic (Prevention) Act,1956, Indian Penal Code, 1860, Protection of Children from Sexual Offences Act, 2012, Prohibition of Child Marriage Act, 2006, Bonded Labour System (Abolition) Act, 1976, Child Labour (Prohibition and Regulation) Act, 1986, Transplantation of Human Organs Act, 1994, and any other Applicable Laws that may relate to human trafficking and may be applicable on such Establishments based on where the Establishments are situated. The Vendors undertakes to employ personnel who have attained majority, hold valid credentials and possess necessary skills to render such services in the Wellness Establishments and conduct thorough background checks at the time of hiring such personnel. The Vendors shall ensure that the Wellness Establishments maintain the highest ethical standards, ensure quality and internal controls, conduct frequent checks of the performance of its staff and ensure the safety of all persons engaged in rendering/ providing the Services/ Products, particularly women, at all times. The Vendors agrees that the App Platform Party shall have access to the right, at any time, to inspect Wellness Establishments. This sub-clause shall apply on the Vendors only as per applicability.

4.19 In case of any Pre-Buy Offers/ Deals, it shall be a deemed acknowledgment by the Vendors in regard of compliance with the terms and conditions contained herein this Agreement by signing a fresh Market Place Form for the Pre-Buy Deals and any other Offers Deals separately offered by the App Platform Party from time to time.

 

5 PAYMENT COLLECTION SERVICES

5.1 The App Platform will receive payment from the Customer for payment to the Vendors and shall remit the payments to the Vendors, post redemption of voucher retaining the Mutually agreed Fee to be paid by the Vendors to App Platform for their Service/ Product.

5.2 The Mutually agreed Fee for the Collection Services shall be as agreed with the Vendors from time to time over an email or in the Form or any Annexure thereto.

5.3 The Customer shall only be issued a Voucher through the App Platform, which is only a confirmation of the advance payment received. The Voucher shall give right to the Customer to demand and receive Services/ Products from the Vendors upon presentation of the receipt within the validity period of the Offer. The Vendors shall provide, and shall be solely responsible to provide, the Services/ Products to the Customer.

5.4 Once the validity period of the voucher(s) purchased by the Customer gets expired, the Vendors expressly waives any right to claim payment from the App Platform Party for any such expired voucher(s) and the App Platform Party shall only be liable to make payment to the Vendors for the vouchers specifically redeemed by the Customer.

6 PAYMENTS TO VENDORS AND SETTLEMENT MECHANISM

6.1 The App Platform Party will settle amounts collected from Customers and mutually agreed Fee payable to the relevant App Platform Party, Daily payment as per RBI rules. Where any mutually agreed Fee due to an App Platform Party, the App Platform Party may deduct such amounts from payments required to be made by it.

6.2 Unless otherwise agreed between the Parties or otherwise provided by the App Platform Party, the mutually agreed Fee for BCI Pay shall be calculated at a set percentage exclusive of taxes. Please refer to the FAQ section at the time of creating Offer Options to know the prevalent rates & conditions in respect of the mutually agreed Fee.

6.3 In the event an App Platform Party has provided any advance amount to the Vendors (“Advance Amount”) for any Pre-Buy Offers/ Deals vide separate Mutually agreed Form/ Agreement along with T&Cs as may be applicable on the Vendors to this Agreement, the App Platform Party shall adjust the money collected on behalf of Vendors post redemption of the Vouchers and retain App Platform Party’s Mutually Agreed Fee from the Advance Amount. Upon exhaustion of the Advance Amount or at any time during the Term of the Agreement, the Parties may agree to a further advance or to a different payment mechanism of transfer of payment amount to the Vendors on redemption on a daily basis. This sub-clause shall only be applicable in case of Pre-Buy Offers/ Deals offered by the Vendors on the App Platform. 

6.4 The Vendors is responsible for its taxes, including but not limited to Goods and Services Tax (GST) and all related compliances/ clearances to be obtained for providing Services/ Products for the bookings received through the App Platform. An App Platform Party shall have no liability and shall not bear any such tax in any manner whatsoever. The App Platform shall reimburse to the Vendors the amount for the tax deducted at source (TDS) as would have been deposited by the Vendors on Mutually agreed Fee within 7 working days of the Vendors submitting the TDS Certificates with the App Platform.

6.5 The Vendors consents for receiving payments through electronic mode and shall provide the correct and complete information with respect to bank details. The App Platform Party assumes no liability, and the Vendors discharges the App Platform Party from any liability arising from incompleteness or inaccuracy in information provided by the Vendors.

7 OWNERSHIPS OF INTELLECTUAL PROPERTY

7.1 The App Platform Party shall, at all times, be the sole and beneficial owners of all right, title and interest to any intellectual property in and to their respective App Platform s and the technology, know-how and infrastructure pertaining thereto. This Agreement shall be construed to be a mere right for the Vendors to advertise and promote itself on the App Platform through agreed Offers.

7.2 The Vendors grants to the App Platform Party an unrestricted, non-exclusive, royalty-free, worldwide, right and license to use, reproduce, perform, display on the App Platform, and in marketing (or social media) communications promoting the App Platform, all content and information provided by the Vendors (including the Vendor’s name, Establishment name, logo, menu items and price list for the Offers). This includes, but is not limited to:

7.2.1 Use of the Vendor’s name in the context of Google ad words to support advertising and promotional campaigns to promote online ordering on internet which may be undertaken by the App Platform Party

7.2.2 Preparation of derivative works of, or incorporate into other works, all or any portion of the marketing materials which will be made by the App Platform Party for the purposes of its business.

7.3 Any material the Vendors transmits or submits through the App Platform or otherwise shall be considered and may be treated by the App Platform Party as non-confidential, subject to their obligations under Applicable Laws.

8 REPRESENTATIONS, WARRANTIES AND INDEMNITIES

8.1 The Parties represent and warrant to each other that each has the authority to execute this Agreement and perform their respective obligations contained herein.

8.2 The Vendors represents and warrants to each App Platform Party that: 

8.2.1 It is duly organized and validly existing under the Applicable Laws and is duly registered and authorized to do the business and has all requisite government and regulatory approvals, corporate powers and authority to own and operate its business and to enter into this Agreement and while entering into this Agreement shall not violate or conflict with any agreement, contract, arrangement and understanding or any instrument, to which it is a party or by which it is bound.

8.2.2 It has the requisite power, licenses, consents, permission, approvals and authorities to execute, perform and deliver this Agreement.

8.2.3 There is no action, suit, proceeding, claim, arbitration, inquiry or investigation pending against Vendors, its activities, properties or assets or for its winding up. It is not a party to or subject to the provisions of any order, writ, injunction, judgment or decree of any court or governmental authority or instrumentality.

8.2.4 All trademarks and all the rights, title and interest in intellectual property relating to the Offers and the Services/ Products are the sole property of the Vendors and the Vendor’s intellectual properties do not infringe or pass off the trademarks or logos or service marks or other intellectual property rights of any third party.

8.2.5 The safety gears, if any, as provided by the Vendors meet the adequate quality standards and there are adequate & requisite safeguards at the Vendors Establishment. The Vendors has the required medical and first aid facilities at the Vendors Establishment. This clause shall apply on Vendors only as per applicability.

8.3 The Vendors undertakes with each App Platform Party that:

8.3.1 If the Vendors ceases to do business, ceases or threatens to cease its operations or is otherwise unable to offer Services/ Products to Customers, it will inform the App Platform Party promptly;

8.3.2 It will include in listings of Services/ Products all disclosures associated with the relevant Services/ Products;

8.3.3 All Services/ Products shall comply in all respects with Applicable Laws, and it shall continue to maintain and possess requisite power, licenses, consents, permission and approvals for the conduct of its businesses;

8.3.4 It shall not disparage the App Platform or the App Platform Party, or negatively influence any person relating to the use of the App Platform, whether during the term of this Agreement or thereafter; and

8.3.5 It shall keep, maintain and preserve books and records pertaining to Offers extended by it, and Services/ Products sold on the App Platform. 
8.4 The Vendors warrants that it will not offer for sale any potentially hazardous food, alcoholic beverage, tobacco product, or any other item prohibited by Applicable Laws.

8.5 The Vendors warrants that it will undertake its obligations with reasonable skill and care.

8.6 The App Platform Party do not guarantee or warrant that the App Platform s will be free from defects or malfunctions, or will be available on an uninterrupted basis. The App Platform Party will use reasonable efforts to rectify any defects or malfunction.

8.7 Vendors Indemnification: The Vendors shall defend, indemnify and hold harmless each App Platform Party and its affiliates (and its respective Directors, officers, agents, representatives and employees) from and against any and all claims, costs, suits, liabilities, judgments, losses, damages, penalties, interest and expenses, arising out of or in connection with:

8.7.1 A claim by a Customer (or any party on whose behalf a Customer has been acting) in respect of any Service/ Product, including without limitation any failure to perform, or deficiency in services or defects in products, or an act or omission of the Vendors or any of its personnel and for any deficiency in service attributable to the Vendors, the App Platform Party shall have right to deduct / be at liberty to hold back, recover amounts outstanding or payable to the Vendors; and/ or

8.7.2 Any actual or alleged breach of any covenant, obligation, undertaking or other provision of this Agreement; and/ or

8.7.3 The inaccuracy or breach of any representations or warranties or other policies of a App Platform; and/ or

8.7.4 In respect of, arising out of, or in connection with Services/ Products, including but not limited to its issuance, terms and conditions, validity, enforceability and compliance with Applicable Laws; and/ or

8.7.5 By any statutory or governmental authority in respect of or connected to including but not limited to the collection or payment of applicable taxes in any way connected to this Agreement; and/ or

8.7.6 The effectiveness & validity of requisite power, licenses, consents, permission, approvals, business practices and authorities to execute and deliver this Agreement and the Offers as may be featured on the App Platform s; and/ or

8.7.7 For any safety mishaps attributable to the Vendors or occurring at his own establishment or any other place of business of the Vendors availed on a temporary basis for any activity conducted at such place by the Vendor 
8.7.8 For any activity carried out at any Vendors Establishment.

8.8 The indemnification obligations contained in this clause shall survive the expiry or termination of this Agreement for any reason whatsoever.

9 LIMITATIONS OF LIABILITY

9.1 Notwithstanding anything to the contrary, an App Platform Party shall not have any liability pursuant to this Agreement for loss of actual or anticipated profits; loss of goodwill; loss of business; loss of revenue or of the use of money; loss of contracts; loss of anticipated savings; loss of data and/ or undertaking the restoration of data; and/ or any special, indirect or consequential loss, even if such App Platform Party has been advised of the possibility of such loss.

9.2 An App Platform Party’s total liability, whether arising out of any breach of contract, warranty, tort or otherwise under or in connection with this Agreement or the transactions contemplated hereby, shall not exceed the aggregate sum of mutually agreed Fee received by it from the transaction which is the subject matter of the claim.

9.3 Nothing contained herein shall limit the ability of the App Platform Party to upgrade, downgrade, modify, alter, limit, suspend, adapt or otherwise alter their respective App Platform s, or any part, function or feature thereof, without notice or other obligation to the Vendors, Customer or any third party.

9.4 The Vendors hereby releases and discharges forever the App Platform Party and all those acting or claiming through or for the App Platform Party, from any and all claims, demands, liabilities, damages, losses, proceedings, suits, causes of action or any similar obligations of any kind, whether accrued or un accrued, arising or resulting from or related to the offer of Services/ Products to Customers.

10 TERM AND TERMINATION

10.1 Term. The term of this Agreement shall commence on the Effective Date and shall continue for a period of One (1) year. Upon expiry of the Term, the Agreement shall be automatically renewed for successive terms of One (1) year thereafter, until terminated in accordance with Clause 10.2 and the expression “Term” shall be construed accordingly

10.2 Termination. An App Platform Party can for itself terminate or suspend this Agreement anytime if:

10.2.1 The representations and warranties made by the Vendors are inaccurate or false or misleading in any manner; and/ or

10.2.2 Where the Vendors is in breach of any covenant, obligation, undertaking or other provision of this Agreement; and/ or 
10.2.3 Where the Vendors is engaged in unethical business practices; and/ or

10.2.4 The user experience for the Vendors is not found satisfactory as per an App Platform’s standards; and/ or

10.2.5 For a continuous period of 14 days, the Vendors fails to provide Services/ Products to the Customers; and/ or

10.2.6 Upon the happening of any of the insolvency events such as bankruptcy, appointment of receiver, administrator, liquidator, winding up, dissolution; and/ or

10.2.7 The Vendors fails to comply with any Applicable Law; and/ or

10.2.8 Where the Vendor’s outlet(s) is/ are approaching a partial or a Permanent shut down.

10.3 Consequences of Termination. Termination of this Agreement in accordance with its terms, shall not affect the accrued rights or liabilities of the Parties at the date of termination; and shall have no effect on:

10.3.1 The validity of Vouchers already issued to Customers; or

10.3.2 The Vendor’s obligations to provide Services/ Products vide those Vouchers; and/ or Vendor’s obligation to return the unutilized amount as per a App Platform Party records from the Advance Amount within 3 (three) days of termination/ expiry of the Agreement.

10.4 The Vendors shall inform each App Platform Party as soon as the Vendors decides to close down its Business Establishment or make any changes to its Establishment, which may affect the Offers as marketed on the App Platform. In case of commencement of proceedings related to winding up or closure of the business or in case of the deliberate suspension of the Offers on the App Platform caused by either Party, for any reason whatsoever, the Vendors shall refund the entire amount or the proportionate amount as may be calculated as per records of the App Platform Party within 3 (three) days of such closure/ winding up/ suspension. In case of partial closure, i.e., in case the Vendors has more than one outlet and not all are closed down, the outstanding Advance Amount which has not been utilized at the outlets so closed, may be used at other outlets of the Vendors at the sole option of the App Platform Party. If such consent to utilize the amount at another outlet is not given by a App Platform Party, the Vendors shall be required to refund the proportionate unutilized amount calculated as per the App Platform Party’s records till the date of such partial closure within 3 (three) days of such partial closure/ winding up.

11 ACCEPTANCES TO BCI PRIVACY POLICY

11.1 By signing the Form and this Agreement, the Vendors acknowledges and agrees to be bound by privacy policies of App Platform Partyhttps://www.BCI .com/help/policy. The Vendors will immediately 
Notify the relevant App Platform Party if it becomes aware of or suspects any unauthorized use or access to the user data or any other Confidential Information, and shall co-operate with the relevant App Platform Party in investigation of such breach and the mitigation of any damage.

12 GENERAL PROVISIONS

12.1 Confidential Information. “Confidential Information” shall mean and include any and all data and information not in the public domain, including technical, marketing and any other know-how and trade secrets, relating to business, personnel or affairs of the Party. Confidential Information may be communicated orally, visually, in writing or in any other recorded or tangible form. Subject to the terms and conditions of this Agreement, the Vendors agrees to keep confidential and not disclose or use any Confidential Information except to support its use or provision of the Services/ Products. The confidentiality obligations set forth herein shall survive the termination or expiration of this Agreement.

12.2 Waiver. No waiver by an App Platform Party of any violation or default in performance of the provisions of this Agreement shall be deemed a waiver of such provisions or the right of an App Platform Party to thereafter enforce such provisions or any other provisions of this Agreement.

12.3 No Third-Party Rights. No term of this Agreement shall be enforceable by a third party.

12.4 Entire Agreement. This Agreement and the Form, embodies the entire agreement between BCI and the Vendors respecting this arrangement and supersedes all prior agreements, understandings and communications, whether written or oral, between the Parties with respect to the subject matter hereof. No modification or amendment of the Agreement shall be effective unless in writing and executed by a duly authorized representative of each Party or as mutually agreed over emails.

12.5 Notices. All notices, requests and demands, and other communications required or permitted under this Agreement shall be in writing and either delivered personally or sent to the official address of the Party through recognized courier service or through registered post or through email.

12.6 Assignment. The Vendors must not assign, transfer, charge or otherwise encumber, create any trust over or deal in any manner with this Agreement or any right, benefit or interest under it, nor transfer, novate or sub-contract any of Vendor’s obligations under it. A App Platform Party shall be free to transfer and/ or assign its rights and obligations hereunder without notice or consent of any party.

12.7 Severability. Invalidity or unenforceability of any provision of or right arising pursuant to this Agreement shall not adversely affect the validity or enforceability of the remaining obligations or provisions. 
12.8 Independent Contractors. This Agreement does not create any agency, employment, partnership, joint venture, or other joint relationship. App Platform Party and the Vendors are independent contractors and neither has any authority to bind the other.

12.9 Governing Law and Jurisdiction. This Agreement shall be governed by the Laws of India, for the time being in force and the courts of New Delhi shall have the exclusive jurisdiction to preside over any matters arising hereunder. Parties shall first endeavor to resolve their disputes amicably within fifteen (15) days from the date on which the dispute was first notified failing which, the dispute shall be referred to courts.

13 DISCLAIMERS

13.1 To the fullest extent permitted by law, BCI and their affiliates, and each of their respective officers, Directors, Members, employees, and agents disclaim all warranties, express or implied, in connection with this Agreement, the App Platform and any use thereof, including, without limitation, the implied warranties of Vendors ability, fitness for a particular purpose and non-infringement. No App Platform Party makes any warranties or representations about the accuracy or completeness of the content and data on the App Platform s or the content of any other websites/ mobile apps linked to the App Platform s, and assumes no liability or responsibility for any:

13.1.1 Errors, mistakes, or inaccuracies of content and materials,

13.1.2 Personal injury or property damage, of any nature whatsoever, resulting from the Vendor’s access to and use of the App Platform,

13.1.3 Any unauthorized access to or use of an App Platform Party’s server and/ or any and all personal information and/ or financial information stored therein,

13.1.4 Any interruption or cessation of transmission to or from the App Platform,

13.1.5 Any bugs, viruses, Trojan horses, or the like which may be transmitted to or through the App Platform, and/ or

13.1.6 Any errors or omissions in any content and materials or for any loss or damage of any kind incurred as a result of the use of any content posted, transmitted, or otherwise made available via the App Platform.

13.2 The Vendors shall provide all information and content including artwork, creative(s), logo(s), picture(s), and write-up 'Content' to be displayed by way of the advertisement on or before three (3) working days prior to date of publishing of offers on the App Platform.

13.3 The Vendors shall ensure that it has all rights, title, and interest in:

13.3.1 The Content it shares with an App Platform Party; or 
13.3.2 The Vendor’s content that is already available with a App Platform Party and these are compliant with the Vendor’s internal branding guidelines and applicable laws; or

13.3.3 The App Platform Party shall in no manner be liable for the Content displayed on the App Platform, when such Content is provided by the Vendors or approved by the Vendors in advance. The Vendors hereby agrees and acknowledges that App Platform Party shall be authorized to use the logo and brand name of the Vendors for displaying the Offers of the Vendors on the App Platform.

13.3.4 For the purpose of featuring the Offers on the App Platform, the Vendors hereby grants App Platform Party worldwide, non-exclusive, royalty-free right and license to use and reproduce, copy, distribute and display, in any medium now known or hereafter developed, the Content.

13.3.5 The App Platform Party will determine, in their sole discretion, the size, placement, and positioning of the advertisement on the App Platform.

14 MODIFICATIONS

14.1 The App Platform Party may modify this Agreement or the Mutually agreed Form from time to time, and any such changes will (i) be reflected on the App Platform, and (ii) be effective immediately upon the changes being reflected on the App Platform. The Vendors agrees to be bound to any such changes or modifications and understands and accepts the importance of regularly reviewing this Agreement as updated on the App Platform.

15 PROHIBITION TO UNAUTHORISED PAYMENT

15.1 It is the intent of the Parties that no payments or transfers of value shall be made which have the purpose or effect of public or commercial bribery or acceptance of or acquiescence in extortion, kickbacks, or other unlawful or improper means of obtaining the approvals, if required.

15.2 In the event of the Vendors committing a breach of any of the terms and conditions contained herein then other Party shall be entitled to forthwith terminate this Agreement without any liability of any sorts whatsoever in respect of such termination.

16 DECLARATIONS

16.1 At all times, during the Term of the Agreement, the Vendors agrees to be bound by applicable anti-bribery laws and other applicable laws or amendments under the statutes.












The term of this agreement shall commence as of the date hereof and shall continue for two years to be automatically renewed on a year-to-year basis.
     
IN WITNESS WHEREOF, Hotel(s) and BCI acting by and through their proper and duly authorized officers or representatives, have each duly executed this agreement under seal the day and year first above written.


   BCI                                                                           VENDOR


By: _________________________                         By: 	_______________________

Title: ________________________                        Title: 	_______________________

Date: 	________________________                       Date: 	_______________________                                          
''',
                  
                  style: TextStyle(
                      height: 1.5, fontWeight: FontWeight.w400, fontSize: 15),
                  textAlign: TextAlign.left,
                ),
              ],
            ),
          ),
          ksizedbox40,
          RegisterCommonBottom()
        ],
      ),
    );
  }
}

class Faq extends StatefulWidget {
  const Faq({super.key});

  @override
  State<Faq> createState() => _FaqState();
}
final specialController = Get.find<SpecializedController>();
class _FaqState extends State<Faq> {
  
  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      appBar: PreferredSize(
          child: CommonScreen(), preferredSize: Size(double.infinity, 40)),
      body: Obx(()=>
         ListView(
          children: [  RegisterCommonContainer(),ksizedbox30, Text(
                  'FREQUENTLY ASKED QUESTIONS',
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 35, color: kblue,fontWeight: FontWeight.w900),
                ),
                //starting
                specialController.specialindex.value == 0
                    ? Padding(
                        padding:
                            const EdgeInsets.only(left: 200, right: 200, top: 50),
                        child: Container(
                          alignment: Alignment.center,
                          height: 110,
                          width: MediaQuery.of(context).size.width * 0.2,
                          color: kgrey.withOpacity(0.1),
                          child: const Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: EdgeInsets.only(top: 20),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceAround,
                                    children: [
                                      Padding(
                                        padding: EdgeInsets.only(right: 300),
                                        child: Text(
                                          'What is the Benze Club International Community?',
                                          style: TextStyle(
                                              color: Color(0xff2980B9),
                                              fontSize: 15.5),
                                        ),
                                      ),
                                      Icon(Icons.expand_less)
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.only(top: 10, left: 80),
                                  child: Text(
                                    'The Benze Club International Community is where members can interact with other members, ask questions, share insights, learn from experiences, find answers, plan holidays better and earn Trip Coins.',
                                    style: TextStyle(fontSize: 13),
                                  ),
                                )
                              ]),
                        ),
                      )
                    : GestureDetector(
                        onTap: () {
                          specialController.specialindex(0);
                        },
                        child: const Padding(
                          padding:
                              EdgeInsets.only(top: 30, left: 100, right: 100),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'What is the Benze Club International Community?',
                                style: TextStyle(
                                  fontSize: 15.5,
                                  color: Color(0xff2980B9),
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.only(right: 50),
                                //  child: Icon(Icons.expand_more),
                              )
                            ],
                          ),
                        ),
                      ), //ending
      
                specialController.specialindex.value == 1
                    ? Padding(
                        padding:
                            const EdgeInsets.only(left: 200, right: 200, top: 50),
                        child: Container(
                          alignment: Alignment.center,
                          height: 110,
                          width: MediaQuery.of(context).size.width * 0.2,
                          color: kgrey.withOpacity(0.1),
                          child: const Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: EdgeInsets.only(top: 20),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceAround,
                                    children: [
                                      Padding(
                                        padding: EdgeInsets.only(right: 300),
                                        child: Text(
                                          'Are all members a part of the community?',
                                          style: TextStyle(
                                              color: Color(0xff2980B9),
                                              fontSize: 15.5),
                                        ),
                                      ),
                                      Icon(Icons.expand_less)
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.only(top: 10, left: 80),
                                  child: Text(
                                    'Participating in the community is open only to Benze Club International members. We are in the process of extending participation invites.',
                                    style: TextStyle(fontSize: 13),
                                  ),
                                )
                              ]),
                        ),
                      )
                    : GestureDetector(
                        onTap: () {
                          specialController.specialindex(1);
                        },
                        child: const Padding(
                          padding:
                              EdgeInsets.only(top: 30, left: 100, right: 100),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'Are all members a part of the community?',
                                style: TextStyle(
                                  fontSize: 15.5,
                                  color: Color(0xff2980B9),
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.only(right: 50),
                                //   child: Icon(Icons.expand_more),
                              )
                            ],
                          ),
                        ),
                      ), //ending
      
                specialController.specialindex.value == 2
                    ? Padding(
                        padding:
                            const EdgeInsets.only(left: 200, right: 200, top: 50),
                        child: Container(
                          alignment: Alignment.center,
                          height: 110,
                          width: MediaQuery.of(context).size.width * 0.2,
                          color: kgrey.withOpacity(0.1),
                          child: const Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: EdgeInsets.only(top: 20),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceAround,
                                    children: [
                                      Padding(
                                        padding: EdgeInsets.only(right: 300),
                                        child: Text(
                                          'What is a mission?',
                                          style: TextStyle(
                                              color: Color(0xff2980B9),
                                              fontSize: 15.5),
                                        ),
                                      ),
                                      Icon(Icons.expand_less)
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.only(top: 10, left: 80),
                                  child: Text(
                                    'Any action you can take on the community is known as a mission. Most missions are structured to help other members as well as to help you earn Trip Coins. Missions can range from writing travel diaries to participating in forums to sharing stories. You can login to see the missions available to you.',
                                    style: TextStyle(fontSize: 13),
                                  ),
                                )
                              ]),
                        ),
                      )
                    : GestureDetector(
                        onTap: () {
                          specialController.specialindex(2);
                        },
                        child: const Padding(
                          padding:
                              EdgeInsets.only(top: 30, left: 100, right: 100),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'What is a mission?',
                                style: TextStyle(
                                  fontSize: 15.5,
                                  color: Color(0xff2980B9),
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.only(right: 50),
                                //    child: Icon(Icons.expand_more),
                              )
                            ],
                          ),
                        ),
                      ), //ending
      
                specialController.specialindex.value == 3
                    ? Padding(
                        padding:
                            const EdgeInsets.only(left: 200, right: 200, top: 50),
                        child: Container(
                          alignment: Alignment.center,
                          height: 110,
                          width: MediaQuery.of(context).size.width * 0.2,
                          color: kgrey.withOpacity(0.1),
                          child: const Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: EdgeInsets.only(top: 20),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceAround,
                                    children: [
                                      Padding(
                                        padding: EdgeInsets.only(right: 300),
                                        child: Text(
                                          'Why should I take up a mission?',
                                          style: TextStyle(
                                              color: Color(0xff2980B9),
                                              fontSize: 15.5),
                                        ),
                                      ),
                                      Icon(Icons.expand_less)
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.only(top: 10, left: 80),
                                  child: Text(
                                    'Take up a mission so that you can share your experiences, making the community richer. Also, on completion of certain missions, you will be rewarded with Trip Coins.',
                                    style: TextStyle(fontSize: 13),
                                  ),
                                )
                              ]),
                        ),
                      )
                    : GestureDetector(
                        onTap: () {
                          specialController.specialindex(3);
                        },
                        child: const Padding(
                          padding:
                              EdgeInsets.only(top: 30, left: 100, right: 100),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'Why should I take up a mission?',
                                style: TextStyle(
                                  fontSize: 15.5,
                                  color: Color(0xff2980B9),
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.only(right: 50),
                                //     child: Icon(Icons.expand_more),
                              )
                            ],
                          ),
                        ),
                      ), //ending
      
                specialController.specialindex.value == 4
                    ? Padding(
                        padding:
                            const EdgeInsets.only(left: 200, right: 200, top: 50),
                        child: Container(
                          alignment: Alignment.center,
                          height: 110,
                          width: MediaQuery.of(context).size.width * 0.2,
                          color: kgrey.withOpacity(0.1),
                          child: const Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: EdgeInsets.only(top: 20),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceAround,
                                    children: [
                                      Padding(
                                        padding: EdgeInsets.only(right: 300),
                                        child: Text(
                                          'What are the first missions on the community?',
                                          style: TextStyle(
                                              color: Color(0xff2980B9),
                                              fontSize: 15.5),
                                        ),
                                      ),
                                      Icon(Icons.expand_less)
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.only(top: 10, left: 80),
                                  child: Text(
                                    'Complete your member profile: Fill up all the blank spaces so that you can make the most of the community.',
                                    style: TextStyle(fontSize: 13),
                                  ),
                                )
                              ]),
                        ),
                      )
                    : GestureDetector(
                        onTap: () {
                          specialController.specialindex(4);
                        },
                        child: Padding(
                          padding: const EdgeInsets.only(
                              top: 30, left: 100, right: 100),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'What are the first missions on the community?',
                                style: TextStyle(
                                  fontSize: 15.5,
                                  color: Color(0xff2980B9),
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.only(right: 50),
                                // child: Icon(Icons.expand_more),
                              )
                            ],
                          ),
                        ),
                      ),
      
                specialController.specialindex.value == 5
                    ? Padding(
                        padding:
                            const EdgeInsets.only(left: 200, right: 200, top: 50),
                        child: Container(
                          alignment: Alignment.center,
                          height: 110,
                          width: MediaQuery.of(context).size.width * 0.2,
                          color: kgrey.withOpacity(0.1),
                          child: const Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: EdgeInsets.only(top: 20),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceAround,
                                    children: [
                                      Padding(
                                        padding: EdgeInsets.only(right: 300),
                                        child: Text(
                                          'What are notifications?',
                                          style: TextStyle(
                                              color: Color(0xff2980B9),
                                              fontSize: 15.5),
                                        ),
                                      ),
                                      Icon(Icons.expand_less)
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.only(top: 10, left: 80),
                                  child: Text(
                                    'You will receive notifications about the status of your stories, discussions and also about the Trip Coins you’ve earned via the community. You’ll also be notified about new happenings in the community.',
                                    style: TextStyle(fontSize: 13),
                                  ),
                                )
                              ]),
                        ),
                      )
                    : GestureDetector(
                        onTap: () {
                          specialController.specialindex(5);
                        },
                        child: Padding(
                          padding: const EdgeInsets.only(
                              top: 30, left: 100, right: 100),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'What are notifications?',
                                style: TextStyle(
                                  fontSize: 15.5,
                                  color: Color(0xff2980B9),
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.only(right: 50),
                                //    child: Icon(Icons.expand_more),
                              )
                            ],
                          ),
                        ),
                      ), //ending
      
                specialController.specialindex.value == 6
                    ? Padding(
                        padding:
                            const EdgeInsets.only(left: 200, right: 200, top: 50),
                        child: Container(
                          alignment: Alignment.center,
                          height: 110,
                          width: MediaQuery.of(context).size.width * 0.2,
                          color: kgrey.withOpacity(0.1),
                          child: const Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: EdgeInsets.only(top: 20),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceAround,
                                    children: [
                                      Padding(
                                        padding: EdgeInsets.only(right: 300),
                                        child: Text(
                                          'What is BCI Cares?',
                                          style: TextStyle(
                                              color: Color(0xff2980B9),
                                              fontSize: 15.5),
                                        ),
                                      ),
                                      Icon(Icons.expand_less)
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.only(top: 10, left: 80),
                                  child: Text(
                                    'The section features sustainability and social initiatives from our resorts, experiences available at our resorts and a showcase of how the member community connects. ',
                                    style: TextStyle(fontSize: 13),
                                  ),
                                )
                              ]),
                        ),
                      )
                    : GestureDetector(
                        onTap: () {
                          specialController.specialindex(6);
                        },
                        child: Padding(
                          padding: const EdgeInsets.only(
                              top: 30, left: 100, right: 100),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'What is BCI Cares?',
                                style: TextStyle(
                                  fontSize: 15.5,
                                  color: Color(0xff2980B9),
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.only(right: 50),
                                //    child: Icon(Icons.expand_more),
                              )
                            ],
                          ),
                        ),
                      ), //ending
      
                specialController.specialindex.value == 7
                    ? Padding(
                        padding:
                            const EdgeInsets.only(left: 200, right: 200, top: 50),
                        child: Container(
                          alignment: Alignment.center,
                          height: 110,
                          width: MediaQuery.of(context).size.width * 0.2,
                          color: kgrey.withOpacity(0.1),
                          child: const Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: EdgeInsets.only(top: 20),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceAround,
                                    children: [
                                      Padding(
                                        padding: EdgeInsets.only(right: 300),
                                        child: Text(
                                          'What can I do before my holiday to get BCI Coins?',
                                          style: TextStyle(
                                              color: Color(0xff2980B9),
                                              fontSize: 15.5),
                                        ),
                                      ),
                                      Icon(Icons.expand_less)
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.only(top: 10, left: 80),
                                  child: Text(
                                    'If you have taken a holiday before with us, do share your travel diary. You can also participate in Club Talk, polls, and quizzes to get BCI Coins. We also have Community contests from time to time that can help you earn BCI Coins. Keep sharing and keep accumulating BCI Coins so that you can have a better holiday.',
                                    style: TextStyle(fontSize: 13),
                                  ),
                                )
                              ]),
                        ),
                      )
                    : GestureDetector(
                        onTap: () {
                          specialController.specialindex(7);
                        },
                        child: const Padding(
                          padding:
                              EdgeInsets.only(top: 30, left: 100, right: 100),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'What can I do before my holiday to get BCI Coins?',
                                style: TextStyle(
                                  fontSize: 15.5,
                                  color: Color(0xff2980B9),
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.only(right: 50),
                                //    child: Icon(Icons.expand_more),
                              )
                            ],
                          ),
                        ),
                      ),
      
                specialController.specialindex.value == 8
                    ? Padding(
                        padding:
                            const EdgeInsets.only(left: 200, right: 200, top: 50),
                        child: Container(
                          alignment: Alignment.center,
                          height: 110,
                          width: MediaQuery.of(context).size.width * 0.2,
                          color: kgrey.withOpacity(0.1),
                          child: const Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: EdgeInsets.only(top: 20),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceAround,
                                    children: [
                                      Padding(
                                        padding: EdgeInsets.only(right: 300),
                                        child: Text(
                                          'Where can I get answers to Booking and Membership queries?',
                                          style: TextStyle(
                                              color: Color(0xff2980B9),
                                              fontSize: 15.5),
                                        ),
                                      ),
                                      Icon(Icons.expand_less)
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.only(top: 10, left: 80),
                                  child: Text(
                                    'For queries on Bookings and Membership, do visit the Contact page on the member website',
                                    style: TextStyle(fontSize: 13),
                                  ),
                                )
                              ]),
                        ),
                      )
                    : GestureDetector(
                        onTap: () {
                          specialController.specialindex(8);
                        },
                        child: const Padding(
                          padding:
                              EdgeInsets.only(top: 30, left: 100, right: 100),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'Where can I get answers to Booking and Membership queries?',
                                style: TextStyle(
                                  fontSize: 15.5,
                                  color: Color(0xff2980B9),
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.only(right: 50),
                                //    child: Icon(Icons.expand_more),
                              )
                            ],
                          ),
                        ),
                      ),
      
                specialController.specialindex.value == 9
                    ? Padding(
                        padding:
                            const EdgeInsets.only(left: 200, right: 200, top: 50),
                        child: Container(
                          alignment: Alignment.centerLeft,
                          height: 110,
                          width: MediaQuery.of(context).size.width * 0.2,
                          color: kgrey.withOpacity(0.1),
                          child: const Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: EdgeInsets.only(top: 20),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceAround,
                                    children: [
                                      Padding(
                                        padding: EdgeInsets.only(right: 300),
                                        child: Text(
                                          'What can I do with my BCI Coins?',
                                          style: TextStyle(
                                              color: Color(0xff2980B9),
                                              fontSize: 15.5),
                                        ),
                                      ),
                                      Icon(Icons.expand_less)
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.only(top: 10, left: 80),
                                  child: Text(
                                    'Once you reach 500 BCI Coins you will be able to redeem these against Resort Credit Points, which can be used during your next holiday with us at select BCI resorts.',
                                    style: TextStyle(fontSize: 13),
                                  ),
                                )
                              ]),
                        ),
                      )
                    : GestureDetector(
                        onTap: () {
                          specialController.specialindex(9);
                        },
                        child: const Padding(
                          padding:
                              EdgeInsets.only(top: 30, left: 100, right: 100),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'What can I do with my BCI Coins?',
                                style: TextStyle(
                                  fontSize: 15.5,
                                  color: Color(0xff2980B9),
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.only(right: 50),
                                //    child: Icon(Icons.expand_more),
                              )
                            ],
                          ),
                        ),
                      ),
           
            ksizedbox40,
            Padding(
              padding: const EdgeInsets.all(100),
              child: Column(
                children: [
                  
                  ksizedbox20,
                  ksizedbox30,
                  
                ],
              ),
            ),
            ksizedbox40,
            RegisterCommonBottom()
          ],
        ),
      ),
    );
  }
}