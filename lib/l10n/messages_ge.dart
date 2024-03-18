import 'package:intl/intl.dart' as intl;

import 'messages.dart';

/// The translations for English (`en`).
class SEn extends S {
  SEn([String locale = 'en']) : super(locale);

  @override
  String get call => 'ზარი';

  @override
  String get message => 'შეტყობინება';

  @override
  String get cancelMyRide => 'გააუქმე ჩემი მოგზაურობა';

  @override
  String get waitMyRide => 'დაელოდე ჩემს მგზავრობას';

  @override
  String get cancelTrip => 'გააუქმეთ მოგზაურობა';

  @override
  String get backButton=> 'უკან';

  @override
  String get welcomeTitle => 'მოგესალმებით აპლიკაციაში';

  @override
  String get today => 'დღეს';

  @override
  String get yesterday => 'გუშინ';

  @override
  String get settings => 'პარამეტრები';

  @override
  String get profileInfo => 'პროფილის ინფორმაცია';

  @override
  String get language => 'ენა';

  @override
  String get firstName => 'სახელი';

  @override
  String get lastName => 'გვარი';

  @override
  String get mobileNumber => 'ტელეფონის ნომერი';

  @override
  String get edit => 'რედაქტირება';

  @override
  String get enterCode => 'შეიყვანეთ კოდი';

  @override
  String get editProfile => 'პროფილის რედაქტირება';

  @override
  String get bankTransfer => 'საბანკო გადარიცხვა';

  @override
  String get gift => 'საჩუქარი';

  @override
  String get correction => 'შესწოება';

  @override
  String get inappPayment => 'აპს-შიდა გადახდა';

  @override
  String get orderFee => 'ُშეკვეთის ღირებულება';

  @override
  String get parkingFee => 'პარკირების ღირებულება';

  @override
  String get cancellationFee => 'გაუქმების საკომისიო';

  @override
  String get withdraw => 'გატანა';

  @override
  String get walletTransactions => 'ელ-საფულით ტრანზაქციები';

  @override
  String get addCard => 'დაამატეთ ბარათი';

  @override
  String get visa => 'Visa';

  @override
  String get mastercard => 'Mastercard';

  @override
  String get addBalance => 'შეავსეთ ბალანი';

  @override
  String durationInMinutes(num minutes) {
    final intl.NumberFormat minutesNumberFormat = intl.NumberFormat.compact(
      locale: localeName,
      
    );
    final String minutesString = minutesNumberFormat.format(minutes);

    String _temp0 = intl.Intl.pluralLogic(
      minutes,
      locale: localeName,
      other: '$minutesString წუთები',
      one: '$minutesString წუთი',
      zero: 'ნულოვანი წუთი',
    );
    return '$_temp0';
  }

  @override
  String durationInHours(num hours) {
    final intl.NumberFormat hoursNumberFormat = intl.NumberFormat.compact(
      locale: localeName,
      
    );
    final String hoursString = hoursNumberFormat.format(hours);

    String _temp0 = intl.Intl.pluralLogic(
      hours,
      locale: localeName,
      other: '$hoursString საათები',
      one: '$hoursString საათი',
      zero: 'ნულოვანი საათები',
    );
    return 'Duration: $_temp0';
  }

  @override
  String get timePastDue => 'ვადაგადაცილება';

  @override
  String get justNow => 'ახლახანს';

  @override
  String distanceInMeters(num distance) {
    final intl.NumberFormat distanceNumberFormat = intl.NumberFormat.compact(
      locale: localeName,
      
    );
    final String distanceString = distanceNumberFormat.format(distance);

    return '$distanceString m';
  }

  @override
  String distanceInKilometers(num distance) {
    final intl.NumberFormat distanceNumberFormat = intl.NumberFormat.compact(
      locale: localeName,
      
    );
    final String distanceString = distanceNumberFormat.format(distance);

    return '$distanceString km';
  }

  @override
  String get welcomeSubtitle => 'მოხარულები ვართ თქვენი ბორტზე სტუმრობით. YO CAR არის თქვენი საიმედო პარტნიორი, კომფორტული და ხელმისაწვდომი მგზავრობისთვის. თუ მიდიხართ სამსახურში, მეგობრების სანახავად ან ქალაქის შესასწავლად, ჩვენ დაგეხმარებით."';

  @override
  String get onboardingRewardTitle => 'რატომ ჩვენ?';


  @override
  String get onboardingRewardSubtitle => '"ხემისაწვდომი ფასები"                                                         "უსაფრთხო და საიმედო"                                              "მარტივი გადახდის მეთოდები"                                                                   "24/7 ხელმისაწვდომი" ';

  @override
  String get onboardingLetStart => 'დავიწყოთ';

  @override
  String get onboardingLetStartSubTitle => 'შეუერთდით YO CAR- ის საზოგადოებას დღეს და გამოსცადეთ შესაძლებლობა გადაადგილდეთ ნებისმიერ ადგილას, ნებისმიერ დროს. დარეგისტრირდით, რათა დაიწყოთ ჩვენთან ერთად მგზავრობა, ან თუ უკვე ხართ ჩვენი საზოგადოების წევრი, შედით სისტემაში და განაგრძეთ მოგზაურობა.

  @override
  String get selectLanguage => 'აირჩიეთ ენა';

  @override
  String get searchForLanguage => 'ენის ძიება';

  @override
  String get enterPhoneNumber => 'შეიყვანეთ ტელეფონის ნომერი';

  @override
  String get actionContinue => 'განაგრძე';

  @override
  String get whereIsYourDestination => 'დანიშნულების ადგილი?';

  @override
  String get whereAreYouGoing => 'სად მიდიხარ?';

  @override
  String get selectDestinations => 'შენი მარშრუტი';

  @override
  String get pickupPoint => 'აყვანის წერტილი';

  @override
  String get enterPickupPoint => 'მიუთითეთ მდებარეობის წერტილი';

  @override
  String get dropoffPoint => 'დასრულების წერტილი';

  @override
  String get enterDropoffPoint => 'მიუთითეთ დასრულების წერტილი';

  @override
  String get stopPoint => 'გაჩერების წერტილი';

  @override
  String get enterStopPoint => 'მიუთითეთ გაჩერების წერტილი';

  @override
  String get confirm => 'დადასტურება';

  @override
  String get confirmDropoff => 'დაადასტურეთ დასრულება';

  @override
  String get confirmPickup => 'დაადასტურეთ დაწყება';

  @override
  String get enterAtLeast3Characters => 'შეიყვანეთ მინიმუმ 3 სიმბოლო';

  @override
  String get noResults => 'შედეგი ვერ მოიძებნა';

  @override
  String get bookNow => 'დაჯავშნე ახლა';

  @override
  String get cash => 'ქეში';

  @override
  String get online => 'ონლაინ';

  @override
  String get offline => 'ხაზგარეშე';

  @override
  String get confirmPay => 'დადასტურება და გადახდა';

  @override
  String get cancel => 'გაუქმება';

  @override
  String get apply => 'ატვირთვა';

  @override
  String get enterCouponCode => 'შეიყვანე ფასდაკლების კოდი';

  @override
  String get reserveRide => 'ჩანიშნე მგზავრობა';

  @override
  String get reserveRideMessage => 'აირჩიეთ ზუსტი თარიღი და დრო, რომლითაც გსურთ თქვენი მგზავრობის დაჯავშნა';

  @override
  String get reserveRideMessageSuccess => 'თქვენი მგზავრობა დაჯავშნილია წარმატებით. თქვენი დაჯავშნილი მგზავრობების ნახვა შეგიძლიათ განყოფილებაში \'დაგეგმილი მგზავრობები\'.';

  @override
  String get cancelReservation => 'ჯავშანის გაუქმება';

  @override
  String get confirmResrve => 'დადასტურება & დაჯავშნა';

  @override
  String get enterCouponDescription => 'შეიყვანეთ კუპონის კოდი ფასის კლებისთვის';

  @override
  String get enterCoupon => 'დაადასტურეთ კუპონი';

  @override
  String get couponApplied => 'კუპონი შეყვანილია';

  @override
  String get couponAppliedDescription => 'კუპონი გამოყენებულია';

  @override
  String get done => 'დასრულებულია!';

  @override
  String get ridePreferences => 'მგზავრობის პრეფერენსები';

  @override
  String get noWaitTime => 'ლოდინის დრო ამოიწურა';

  @override
  String minutesRange(String minutes) {
    return '$minutes minutes';
  }

  @override
  String secondsRange(String seconds) {
    return '$seconds seconds';
  }

  @override
  String get rideRequested => 'მგზვრობის მოთხოვნა';

  @override
  String get searchingForAnOnlineDriver => 'ონლაინ მძღოლის ძებნა...';

  @override
  String get cancelRide => 'მგზავრობის გაუქმება';

  @override
  String get rideSafety => 'მგზავრობის უსაფრთხოება';

  @override
  String get shareTripInformation => 'გააზიარე მარშუტის ინფორმაცია';

  @override
  String get shareTripInformationDescription => 'შეგიძლია მარშუტის ინფორმაცია მეგობარს გაუზიარო';

  @override
  String get sos => 'SOS';

  @override
  String get sosDescription => 'გვაცნობეთ საფრთხის შესახებ';

  @override
  String get reportAnIssue => 'მოგვწერეთ პრობლემის შესახებ';

  @override
  String get reportAnIssueMidTripDescription => 'გაგვიზიარე უსაფრთხოების საკითხი მგზავრობისას';

  @override
  String get rideOptions => 'მგზავრობის ვარიანტები';

  @override
  String get goBackToRide => 'დავუბრუნდეთ მგზავრობას';

  @override
  String get waitTime => 'ლოდინის დრო';

  @override
  String get couponCode => 'ფასდაკლების კოდი';

  @override
  String get giftCardCode => 'სასაჩუქრე ბარათის კოდი';

  @override
  String get nicePoints => 'დადებითი შეფასება';

  @override
  String get negativePoints => 'უარყოფითი შეფასება';

  @override
  String get reviewCommentBoxHint => 'დატოვეთ კომენტარი...';

  @override
  String get howWasYourTrip => 'როგორ იმგზავრეთ?';

  @override
  String oneStarReviewTitle(String name) {
    return 'საშინელი მგზავრობა  $name ერთად';
  }

  @override
  String twoStarReviewTitle(String name) {
    return 'ცუდი მგზავრობა $name ერთად';
  }

  @override
  String threeStarReviewTitle(String name) {
    return 'ნორმალური მგზავრობა $name ერთად';
  }

  @override
  String fourStarReviewTitle(String name) {
    return 'კარგი მგზავრობა $name ერთად';
  }

  @override
  String fiveStarReviewTitle(String name) {
    return 'შესანიშნავი მგზავრობა $name ერთად';
  }

  @override
  String get submitFeedback => 'გამოხმაურება';

  @override
  String get typeAMessage => 'შეტყობინების გაგზავნა';

  @override
  String get findAnotherRide => 'სხვა მძღოლის პოვნა';

  @override
  String get next => 'შემდეგი';

  @override
  String get searchForDropoffLocation => 'მოძებნეთ დანიშნულების ადგილი';

  @override
  String get searchForPickupLocation => 'მოძებნეთ საწყისი ლოკაცია';

  @override
  String get placeConfirmDialogPlaceholder => 'სად არის დანიშნულების ადგილი?';

  @override
  String get noAnnouncements => 'განცხადება არ არის';

  @override
  String get announcements => 'განცხადება';

  @override
  String reviewsCount(int count) {
    return '($count reviews)';
  }

  @override
  String get tripDetails => 'მარშრუტის დეტალები';

  @override
  String get rideDetails => 'მგზავრობის დეტალები';

  @override
  String get orderARide => 'შეუკვეთე მგზავრობა';

  @override
  String get noRidesYet => 'მგზავრობა არ არის!';

  @override
  String get issueSubjectPlaceholder => 'პრობლემის სახეობა';

  @override
  String get issueContentPlaceholder => 'აღწერე პრობლემა';

  @override
  String get reportThisIssue => 'გაასაჩივრე პრობლემა';

  @override
  String get fieldIsRequired => 'ველი სავალდებულოა';

  @override
  String get ok => 'OK';

  @override
  String get favoriteLocations => 'რჩეული ლოკაციები';

  @override
  String get favoriteLocationsSubtitle => 'შეინახე რჩეული ლოკაციები ,მარტივი წვდომისთვის';

  @override
  String get createAFavoriteLocation => 'შექმენი რჩეული ლოკაციები';

  @override
  String get addressTitleLabel => 'მისამართის სახელწოდება';

  @override
  String get clickToSetLocation => 'დააკლიკეთ მისამართის მოსანიშნად';

  @override
  String get whereIsYourNewFavoriteLocation => 'რჩეული ადგილის მისამართი?';

  @override
  String get locateFavoriteLocationDescription => 'გამოიყენეთ საძიებო ველი ან მონიშნეთ წერტილი რუკაზე';

  @override
  String get searchLocation => 'მდებარეობის ძებნა';

  @override
  String get saveChanges => 'შეინახეთ ცვლილებები';

  @override
  String get rideHistory => 'მგზავრობის ისტორია';

  @override
  String get scheduledRides => 'ჩანიშნული მგზავრობები';

  @override
  String get keepTheOrder => 'შეკვეთის გაგრძელება';

  @override
  String get cancelTheRide => 'მგზავრობის გაუქმება';

  @override
  String get walletBalance => 'ბალანსი';

  @override
  String get activities => 'აქტივობები';

  @override
  String get pleaseEnterGiftCardCode => 'გთხოვთ შეიყვანოთ სასაჩუქრე ბარათის კოდი';

  @override
  String get redeem => 'გაცვლა';

  @override
  String get enterGiftCardCode => 'შეიყვანეთ სასაჩუქრე ბარათის კოდი';

  @override
  String get redeemGiftCard => 'გაცვალე სასაჩუქრე ბარათი';

  @override
  String get redeemGiftCardDescription => 'შეიყვანე სასაჩუქრე ბარათის კოდი გასაცვლელად.';

  @override
  String get redeemSuccessTitle => 'სასაჩუქრე ბარათი გაცვლილია!';

  @override
  String redeemSuccessDescription(String amount) {
    return 'წარმატებით გაცვალე $ღირებულების სასაჩუქრე ბარათი.';
  }

  @override
  String get addCredit => 'დაამატე კრედიტი';

  @override
  String get payNow => 'გადაიხადე ახლავე';

  @override
  String get addCreditToWallet => 'საფულის შევსება';

  @override
  String get pleaseSelectAmount => 'აირჩიეთ თანხის რაოდენობა';

  @override
  String get enterAmount => 'შეიყვანეთ თანხის რაოდენობა';

  @override
  String get selectAmount => 'აირჩიეთ რაოდენობა:';

  @override
  String get wallet => 'საფულე';

  @override
  String get totalRides => 'მგზავრობების რაოდენობა';

  @override
  String get appSettings => 'აპის პარამეტრები';

  @override
  String get mapSettings => 'რუკის პარამეტრები';

  @override
  String get lanugageSettings => 'ენის პარამეტრები';

  @override
  String get paymentMethods => 'გადახდის მეთოდები';

  @override
  String get selectCards => 'მიუთითე ბარათი';

  @override
  String get selectCardsDescription => 'შეგიძლიათ აირჩიოთ ბარათის ნომრები, რომლებიც გსურთ გამოჩნდეს ინვოისებზე გადახდის მეთოდების სიაში.';
  @override
  String get delete => 'წაშლა';

  @override
  String get nameOnCard => 'სახელი ბარათზე';

  @override
  String get profile => 'პროფილი';

  @override
  String get scheduledRide => 'ჩანიშნული მგზავრობა';

  @override
  String get addPaymentMethod => 'დაამატე გადახდის მეთოდი';

  @override
  String get addPaymentMethodDescription => 'დაამატე ახალი გადახდის მეთოდი შენს პირად ანგარიშზე ';

  @override
  String get saveCard => 'ბარათის შენახვა';

  @override
  String get selectDialCode => 'აკრიფეთ კოდი';

  @override
  String get searchCountryName => 'მოძებნე ქვეყანა';

  @override
  String get preferences => 'უპირატესობები:';

  @override
  String get onboardingDescription => 'რეგისტრაციასა და სასიამოვნოდ მგზავრობას შორის რამდენიმე წამია';

  @override
  String get signInSignUp => 'შესვლა/ რეგისტრაცია';

  @override
  String get enterOtp => 'შეიყვანე OTP';

  @override
  String get enterPassword => 'შეიყვანე პაროლი';

  @override
  String get enterPasswordDescription => 'შეიყვანე პაროლი გასაგრძელებლად';

  @override
  String get setPassword => 'პაროლის დაყენება';

  @override
  String get password => 'პაროლი';

  @override
  String get passwordRuleDescription => 'აირჩიეთ მინიმუმ ორი ქვემოთ ჩამოთვლილი:';

  @override
  String get passwordRuleLength => '9 და 64 სიმბოლოს შორის';

  @override
  String get passwordRuleUpperCase => 'დიდი ასოები';

  @override
  String get passwordRuleLowerCase => 'პატარა ასოები';

  @override
  String get passwordRuleNumber => 'რიცხვები';

  @override
  String get passwordRuleSpecialCharacter => 'განსხვავებული სიმბოლოები';

  @override
  String get contactDetails => 'საკონტაქტო ინფორმაცია';

  @override
  String get vehicleDetails => 'ავტომობილის დეტალები';

  @override
  String get payoutInformation => 'გადახდის დეტალები';

  @override
  String get documents => 'დოკუმენტები';

  @override
  String get accessDenied => 'წვდომა უარყოფილია';

  @override
  String get success => 'წარმატება';

  @override
  String get skipForNow => 'გამოტოვება';

  @override
  String get sendOtpDescription => 'ვერიფიკაციის კოდი გაგზავნილია მითითებულ ნომერზე';

  @override
  String get resendOtp => 'კოდის თავიდან გაგზავნა';

  @override
  String get useOtpInstead => ' OTP გამოყენება';

  @override
  String get home => 'სახლი';

  @override
  String get logout => 'გამოსვლა';

  @override
  String get driverLicenseNumber => 'მართვის მოწმობის ნომერი';

  @override
  String get email => 'E-mail';

  @override
  String get address => 'მისამართი';

  @override
  String get gender => 'სქესი';

  @override
  String get genderMale => 'მამრობითი';

  @override
  String get genderFemale => 'მდედრობითი';

  @override
  String get genderUnknown => 'ნეიტრალური / სხვა';

  @override
  String get vehiclePlateNumber => 'ავტომობილის ნომერი';

  @override
  String get vehicleColor => 'ავტომობილის ფერი';

  @override
  String get vehicleModelAndMake => 'ავტომობილის მოდელი და მარკა';

  @override
  String get vehicleProductionYear => 'ავტომობილის გამოშვების წელი';

  @override
  String get bankName => 'ბანკის დასახელება';

  @override
  String get bankRoutingNumber => 'საბანკო გზავნილის ნომერი';

  @override
  String get bankAccountNumber => 'საბანკო ანგარიშის ნომერი';

  @override
  String get bankSwift => 'SWIFT კოდი';

  @override
  String get uploadImage => 'ატვირთე ფოტო';

  @override
  String get yourBalance => 'შენი ბალანსი';

  @override
  String get rideCancellation => 'მგზავრობის გაუქმება';

  @override
  String get cancelRideMessage => 'საკომისიო შეიძლება დაწესდეს გაუქმებისას';

  @override
  String get cancelRideSuccess => 'მგზავრობა წარმატებით გაუქმდა';

  @override
  String get confirmAndCancelRide => 'დადასტურება & მგზავრობის გაუქმება';

  @override
  String get selectPaymentMethod => 'აირჩიე გადახდის მეთოდი';

  @override
  String get rideFeePaid => 'მგზავრობის საფასური გადახდილია';

  @override
  String get rideFeeUnpaid => 'მგზავრობის საფასური გადუხდელია';

  @override
  String get total => 'ჯამი';

  @override
  String get totalPrice => 'ჯამური საფასური';

  @override
  String get addCustomCredit => 'თქვენზე მორგებული კრედიტის დამატება';

  @override
  String get serviceFee => 'მომსახურების საფასური';

  @override
  String get serviceOptionFee => 'მომსახურების საფასური';

  @override
  String get couponDiscount => 'ფასდაკლება კუპონით';

  @override
  String get walletCreit => 'საფულის კრედიტი';

  @override
  String get custom => 'ინდივიდუალური';

  @override
  String get payment => 'გადახდა';

  @override
  String get cashPayment => 'ქეშით გადახდა';

  @override
  String cashPaymentDescription(String amount) {
    return 'ადასტურებთ რომ მიიღეთ $ოდენობა?';
  }

  @override
  String get cashPaymentReceived => 'ქეშით გადახდა მიღებულია';

  @override
  String get confirmAndEndTrip => 'დადასტურება & მგზავრობის დასრულება';

  @override
  String get earnings => 'შემოსავლები';

  @override
  String get acceptOrder => 'შეკვეთის დადასტურება';

  @override
  String get canceled => 'გაუქმდა';

  @override
  String get unknown => 'უცნობი';

  @override
  String get commission => 'საკომისიო';

  @override
  String get selectProfileImage => 'აირჩიეთ პროფილის ფოტო';

  @override
  String get chooseAvatarDescription => 'ან აირჩიეთ ქვემოთ მოცემული ავატარი:';

  @override
  String get fullName => 'სრული სახელი';

  @override
  String get favoriteDrivers => 'რჩეული მძღოლები';

  @override
  String get distanceTraveled => 'გავლილი მანძილი';

  @override
  String get rating => 'შეფასება';

  @override
  String get map => 'რუკა';

  @override
  String get income => 'შემოსავალი';

  @override
  String get timeSpent => 'დახარჯული დრო';

  @override
  String get daily => 'დღიურად';

  @override
  String get monthly => 'თვის განმავლობაში';

  @override
  String get noRecordsFoundEarnings => 'ამ ფილტრებით მგზავრობის ჩანაწერი ვერ მოიძებნა';

  @override
  String get feedbacksSummaryEmptyStateTitle => 'თქვენ ჯერ არ გაქვთ საკმარისი გამოხმაურება.';

  @override
  String get feedbacksSummary => 'გამოხმაურების შეჯამება';

  @override
  String get feedbacksGoodTitle => 'ბრწყინვალე ნამუშევარია!';

  @override
  String get feedbacksGoodSubtitle => 'შენი რეიტინგი კარგად გამოიყურება';

  @override
  String get feedbacksBadTitle => 'საშუალო';

  @override
  String get feedbacksBadSubtitle => 'საჭიროა გააუმჯობესო გამოხმაურება';

  @override
  String get feedbacksGoodPointsTitle => 'რამდენიმე კარგი პუნქტი თქვენს შესახებ:';

  @override
  String get feedbacksbadPointsTitle => 'ზოგიერთი თვისების გაუმჯობესება:';

  @override
  String get feedbacksReviewsTitle => 'ზოგიერთი ადრეული განხილვა';

  @override
  String get payoutMethods => 'ანაზღაურების მეთოდები';

  @override
  String get notice => 'შემჩნევა:';

  @override
  String get payoutNoticeTitle => 'ავტომატურად მიიღებ ანაზღაურებას ადმინებისგან კვირაში 2 ჯერ.';

  @override
  String get addPayoutMethod => 'ანაზღაურების მეთოდი';

  @override
  String get navigate => 'ნავიგაცია';

  @override
  String get noPayoutMethods => 'ანაზღაურების მეთოდი არ არის';

  @override
  String get name => 'სახელი';

  @override
  String get nameHint => 'შეიყვანეთ სახლი';

  @override
  String get bankNameHint => 'შეიყვანეთ ბანკის სახელი';

  @override
  String get branchName => 'ფილიალის სახელწოდება';

  @override
  String get branchNameHint => 'შეიყვანეთ ფილიალის სახელწოდება';

  @override
  String get accountHolderName => 'ანგარიშის მფლობელის სახელი';

  @override
  String get routingNumber => 'მარშრუტიზაციის ნომერი ';

  @override
  String get routingNumberHint => 'შეიყვანეთ მარშრუტიზაციის ნომერი';

  @override
  String get accountNumber => 'ანგარიშის ნომერი';

  @override
  String get accountNumberHint => 'შეიყვანე ანგარიშის ნომერი';

  @override
  String get addressHint => 'მიუთითე მისამართი';

  @override
  String get dateOfBith => 'დაბადების თარიღი';

  @override
  String get yearHint => 'წელი';

  @override
  String get monthHint => 'თვე';

  @override
  String get dayHint => 'დღე';

  @override
  String get city => 'ქალაქი';

  @override
  String get cityHint => 'მიუთითე ქალაქი';

  @override
  String get state => 'რეგიონი';

  @override
  String get stateHint => 'მიუთითე რეგიონი';

  @override
  String get zipCode => 'Zip Code';

  @override
  String get zipCodeHint => 'შეიყვანე Zip Code';

  @override
  String get day => 'დღე';

  @override
  String get month => 'თვე';

  @override
  String get year => 'წელი';

  @override
  String get noActivitiesYet => 'აქტივობები ჯერ არ არის.';

  @override
  String get headingToDestination => 'მიემართება დანიშნულების ადგილამდე';

  @override
  String get driverArrivedNotice => 'მძღოლი გელოდებათ';

  @override
  String get driverShouldAriveInNotice => 'მძღოლი დანიშნულები ადგილს უახლოვდება';

  @override
  String get driverShouldHaveArrivedNotice => 'მძღოლი რამდენიმე წამში მოვა დანიშნულების ადგილზე';

  @override
  String get deleteAccount => 'ანგარიშის წაშლა';

  @override
  String get deleteAccountNotice => 'დარწმუნებული ხართ, რომ გსურთ თქვენი ანგარიშის წაშლა? 30 დღის შემდეგ თქვენი ანგარიში სამუდამოდ წაიშლება. ამ დროის განმავლობაში, თქვენ შეგიძლიათ აღადგინოთ თქვენი ანგარიში ხელახლა შესვლით.';

  @override
  String get confirmAndDeleteAccount => 'დადასტურება & ანგარიშის წაშლა';

  @override
  String get accountDeleted => 'ანგარიში წაშლილია';

  @override
  String share_trip_text_locations(Object destination, Object pickup) {
    return 'გზაში ვარ $destination - დან $pickup- მდე.';
  }

  @override
  String share_trip_text_driver(Object firstName, Object lastName, Object mobileNumber) {
    return ' ჩემი მძღოლის სახელია $firstName $lastName, ტელეფონის ნომერია  +$mobileNumber.';
  }

  @override
  String share_trip_text_rider(Object firstName, Object lastName, Object mobileNumber) {
    return ' მძღოლი ჩემს გვერდით არის  $firstName $lastName, ტელეფონის ნომერია +$mobileNumber.';
  }

  @override
  String share_trip_started_time(Object startTime, Object duration) {
    return ' მგზავრობა დაიწყო $startTime და ველოდები რომ მგზავრობა გაგრძელდება  $duration წუთი';
  }

  @override
  String share_trip_not_arrived_time(Object duration) {
    return ' ველოდები რომ მგზავრობა გაგრძელდება  $duration წუთი მას შემდეგ რაც ჩავჯდები მძღოლის მანქანაში.';
  }

  @override
  String get sendSOSMessage => 'მნიშვნელოვანია: გთხოვთ, გამოიყენოთ ეს ფუნქცია მხოლოდ გადაუდებელ შემთხვევაში. ჩვენ დავუკავშირდებით დახმარებას თქვენი სახელით.';

  @override
  String get confirmAndSendSOS => 'დადასტურება & გაგზავნე SOS';

  @override
  String get sosSentSuccessfully => 'SOS გაგზავნილია წარმატებით';

  @override
  String get topUpSuccess => 'საფულე წარმატებით იქნა შევსებული';

  @override
  String get cancelNotAllowed => 'მგზავრობის გაუქება შეუძლებელია';

  @override
  String get error => 'Error';

  @override
  String get connectionError => 'კავშირის ხარვეზი';

  @override
  String get serverError => 'სერვერის ხარვეზი';

  @override
  String get addNewLocation => 'დაამატე ახალი მისამართი';

  @override
  String get twoWayTrip => 'ორი-მიმართულებით მგზავრობა';

  @override
  String get reportSubmitted => 'ანგარიში გაგზავნილია';

  @override
  String get reportSubmittedDescription => 'თქვენი ანგარიში წარმატებითაა გაგზავნილი. განვიხილავთ და საჭირო ზომებს მივიღებთ.';

  @override
  String get cardNumber => 'ბარათის ნომერი';

  @override
  String get cardNumberHint => 'შეიყვანე ბარათის ნომერი';

  @override
  String get expiryDate => 'ვადის გასვლის თარიღი';

  @override
  String get expiryDateHint => 'თთ/წწ';

  @override
  String get noFavoriteDrivers => 'რჩეული მძღოლები არ არის';

  @override
  String get pickupLocationNotFound => 'ჩვენ ვერ შევძელით თქვენი ამჟამინდელი მდებარეობის დადგენა GPS-ის, როგორც მონიშნული  წერტილის გამოყენებით. გთხოვთ, ხელით შეიყვანოთ თქვენი მდებარეობის წერტილი.';

  @override
  String get dragToSelect => 'გადაიტანეთ ასარჩევად';

  @override
  String get skip => 'გამოტოვება';

  @override
  String get openSettings => 'გახსენი პარამეტრები';

  @override
  String get locationPermission => 'ადგილმდებარეობაზე წვდომა';

  @override
  String get locationPermissionDeniedForeverMessage => '„მდებარეობის ნებართვა არის მოთხოვნა თქვენს ირგვლივ შეკვეთების მისაღებად და ასევე მძღოლისთვის, რათა თვალყური ადევნონ თქვენს მდებარეობას. თქვენ ვერ მიიღებთ შეკვეთებს ამ ნებართვის გარეშე და ჩვენ ვუფრთხილდებით თქვენს ამჟამინდელი მდებარეობის კონფიდენციალობას. თქვენ შეგიძლიათ შეცვალოთ ეს ნებართვა თქვენი ტელეფონის პარამეტრებში.';

  @override
  String get allow => 'ნებართვა';
}
