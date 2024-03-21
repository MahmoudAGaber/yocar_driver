import 'package:intl/intl.dart' as intl;

import 'messages.dart';

/// The translations for English (`en`).
class SRu extends S {
  SRu([String locale = 'ru']) : super(locale);

  @override
  String get call => 'вызов';

  @override
  String get message => 'сообщение';

  @override
  String get cancelMyRide => 'Отменить мою поездку';

  @override
  String get waitMyRide => 'Посещает mon trajet';

  @override
  String get cancelTrip => 'Отменить поездку';

  @override
  String get backButton=> 'Назад';

  @override
  String get welcomeTitle => 'Добро пожаловать в приложение';

  @override
  String get today => 'Сегодня';

  @override
  String get yesterday => 'Вчера';

  @override
  String get settings => 'Настройки';

  @override
  String get profileInfo => 'Информация о профиле';

  @override
  String get language => 'Язык';

  @override
  String get firstName => 'Имя';

  @override
  String get lastName => 'Фамилия';

  @override
  String get mobileNumber => 'Телефонный номер';

  @override
  String get edit => 'Редактировать';

  @override
  String get enterCode => 'Введите код';

  @override
  String get editProfile => 'Редактировать профиль';

  @override
  String get bankTransfer => 'Банковский перевод';

  @override
  String get gift => 'Подарок';

  @override
  String get correction => 'Исправление';

  @override
  String get inappPayment => 'Платеж в приложении';

  @override
  String get orderFee => 'Плата за заказ';

  @override
  String get parkingFee => 'Плата за парковку';

  @override
  String get cancellationFee => 'Плата за отмену';

  @override
  String get withdraw => 'Снять';

  @override
  String get walletTransactions => 'Транзакции с кошельком';

  @override
  String get addCard => 'Добавить карту';

  @override
  String get visa => 'Виза';

  @override
  String get mastercard => 'Мастеркард';

  @override
  String get addBalance => 'Пополнить баланс';

  @override
  String durationInMinutes(num minutes) {
    final intl.NumberFormat minutesNumberFormat = intl.NumberFormat.compact(
      locale: localeName,
      
    );
    final String minutesString = minutesNumberFormat.format(minutes);

    String _temp0 = intl.Intl.pluralLogic(
      minutes,
      locale: localeName,
      other: '$minutesString Минут(ы)',
      one: '$minutesString Минут',
      zero: 'Ноль минут(ы)',
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
      other: '$hoursString Час(ы)',
      one: '$hoursString Час',
      zero: 'Ноль часов',
    );
    return 'Продолжительность: $_temp0';
  }

  @override
  String get timePastDue => 'Просрочено';

  @override
  String get justNow => 'Прямо сейчас';

  @override
  String distanceInMeters(num distance) {
    final intl.NumberFormat distanceNumberFormat = intl.NumberFormat.compact(
      locale: localeName,
      
    );
    final String distanceString = distanceNumberFormat.format(distance);

    return '$distanceString м';
  }

  @override
  String distanceInKilometers(num distance) {
    final intl.NumberFormat distanceNumberFormat = intl.NumberFormat.compact(
      locale: localeName,
      
    );
    final String distanceString = distanceNumberFormat.format(distance);

    return '$distanceString км';
  }

  @override
  String get welcomeSubtitle => 'Мы рады видеть вас. YO CAR - ваш надежный партнер для удобных и доступных поездок. Будь то поездка на работу, встреча с друзьями или осмотр города, мы позаботимся о вашей поездке."';

  @override
  String get onboardingRewardTitle => 'Почему нужно выбрать нас?';

  @override
  String get onboardingRewardSubtitle => '"Доступные тарифы"                                                         "Безопасные и надежные поездки"                                                "Простые варианты оплаты"                                                                    "Доступ 24/7" ';

  @override
  String get onboardingLetStart => 'Давайте начнем!';

  @override
  String get onboardingLetStartSubTitle => 'Присоединяйтесь к сообществу YO CAR уже сегодня и почувствуйте свободу добраться до нужного места в любое время и в любом месте. Зарегистрируйтесь, чтобы начать пользоваться нашими услугами, или если вы уже являетесь частью нашего сообщества, просто войдите, чтобы продолжить свой путь.';

  @override
  String get selectLanguage => 'Выберите язык';

  @override
  String get searchForLanguage => 'Поиск языка';

  @override
  String get enterPhoneNumber => 'Введите номер телефона';

  @override
  String get actionContinue => 'Продолжить';

  @override
  String get whereIsYourDestination => 'Какой ваш пункт назначения?';

  @override
  String get whereAreYouGoing => 'Куда вы едете?';

  @override
  String get selectDestinations => 'Ваш маршрут';

  @override
  String get pickupPoint => 'Место посадки';

  @override
  String get enterPickupPoint => 'Введите место посадки';

  @override
  String get dropoffPoint => 'Место высадки';

  @override
  String get enterDropoffPoint => 'Введите место высадки';

  @override
  String get stopPoint => 'Точка стопа';

  @override
  String get enterStopPoint => 'Введите точку стопа';

  @override
  String get confirm => 'Подтвердить';

  @override
  String get confirmDropoff => 'Подтвердить место высадки';

  @override
  String get confirmPickup => 'Подтвердить место посадки';

  @override
  String get enterAtLeast3Characters => 'Введите как минимум 3 символа';

  @override
  String get noResults => 'Нет результатов';

  @override
  String get bookNow => 'Забронировать сейчас';

  @override
  String get cash => 'Наличные';

  @override
  String get online => 'Онлайн';

  @override
  String get offline => 'Офлайн';

  @override
  String get confirmPay => 'Подтвердить и оплатить';

  @override
  String get cancel => 'Отмена';

  @override
  String get apply => 'Применить';

  @override
  String get enterCouponCode => 'Введите код купона';

  @override
  String get reserveRide => 'Резервная поездка';

  @override
  String get reserveRideMessage => 'Выберите точную дату и время, на которое вы хотите забронировать свою поездку';

  @override
  String get reserveRideMessageSuccess => 'Ваша поездка успешно забронирована. Вы можете просмотреть свои забронированные поездки в разделе \'Запланированные поездки\'.';

  @override
  String get cancelReservation => 'Отменить бронирование';

  @override
  String get confirmResrve => 'Подтвердить и забронировать';

  @override
  String get enterCouponDescription => 'Введите свой код купона, который будет применен к ценам';

  @override
  String get enterCoupon => 'Введите купон';

  @override
  String get couponApplied => 'Купон применен';

  @override
  String get couponAppliedDescription => 'Купон был применен к тарифу вашей поездки';

  @override
  String get done => 'Готово!';

  @override
  String get ridePreferences => 'Предпочтения поездки';

  @override
  String get noWaitTime => 'Нет времени ожидания';

  @override
  String minutesRange(String minutes) {
    return '$minutes минут(ы)';
  }

  @override
  String secondsRange(String seconds) {
    return '$seconds секунд(ы)';
  }

  @override
  String get rideRequested => 'Запрос на поездку отправлен';

  @override
  String get searchingForAnOnlineDriver => 'Поиск онлайн водителя...';

  @override
  String get cancelRide => 'Отменить поездку';

  @override
  String get rideSafety => 'Безопасность поездки';

  @override
  String get shareTripInformation => 'Поделиться информацией о поездке';

  @override
  String get shareTripInformationDescription => 'Вы можете поделиться информацией о вашей поездке с другом';

  @override
  String get sos => 'SOS';

  @override
  String get sosDescription => 'Сообщить властям о чрезвычайной ситуации';

  @override
  String get reportAnIssue => 'Сообщить о проблеме';

  @override
  String get reportAnIssueMidTripDescription => 'Поделиться проблемой безопасности во время поездки';

  @override
  String get rideOptions => 'Варианты поездки';

  @override
  String get goBackToRide => 'Вернуться к поездке';

  @override
  String get waitTime => 'Время ожидания';

  @override
  String get couponCode => 'Промокод';

  @override
  String get giftCardCode => 'Код подарочной карты';

  @override
  String get nicePoints => 'Бонусные баллы';

  @override
  String get negativePoints => 'Отрицательные баллы';

  @override
  String get reviewCommentBoxHint => 'Добавить комментарий...';

  @override
  String get howWasYourTrip => 'Как прошла ваша поездка?';

  @override
  String oneStarReviewTitle(String name) {
    return 'Ужасная поездка с $name';
  }

  @override
  String twoStarReviewTitle(String name) {
    return 'Плохая поездка с $name';
  }

  @override
  String threeStarReviewTitle(String name) {
    return 'Средняя поездка с $name';
  }

  @override
  String fourStarReviewTitle(String name) {
    return 'Хорошая поездка с $name';
  }

  @override
  String fiveStarReviewTitle(String name) {
    return 'Отличная поездка с $name';
  }

  @override
  String get submitFeedback => 'Отправить отзыв';

  @override
  String get typeAMessage => 'Введите сообщение';

  @override
  String get findAnotherRide => 'Найти другую поездку';

  @override
  String get next => 'Далее';

  @override
  String get searchForDropoffLocation => 'Поиск места высадки';

  @override
  String get searchForPickupLocation => 'Поиск места посадки';

  @override
  String get placeConfirmDialogPlaceholder => 'Где место высадки?';

  @override
  String get noAnnouncements => 'Нет объявлений';

  @override
  String get announcements => 'Объявления';

  @override
  String reviewsCount(int count) {
    return '($count отзывы)';
  }

  @override
  String get tripDetails => 'Детали путешествия';

  @override
  String get rideDetails => 'Детали поездки';

  @override
  String get orderARide => 'Заказать поездку';

  @override
  String get noRidesYet => 'Пока нет поездок!';

  @override
  String get issueSubjectPlaceholder => 'Введите тему проблемы';

  @override
  String get issueContentPlaceholder => 'Введите описание проблемы';

  @override
  String get reportThisIssue => 'Сообщить об этой проблеме';

  @override
  String get fieldIsRequired => 'Это поле обязательно для заполнения';

  @override
  String get ok => 'OK';

  @override
  String get favoriteLocations => 'Избранные места';

  @override
  String get favoriteLocationsSubtitle => 'Сохраните ваши избранные места для более удобного доступа';

  @override
  String get createAFavoriteLocation => 'Создать избранное место';

  @override
  String get addressTitleLabel => 'Название адреса';

  @override
  String get clickToSetLocation => 'Нажмите, чтобы установить местоположение';

  @override
  String get whereIsYourNewFavoriteLocation => 'Где находится ваше новое избранное место?';

  @override
  String get locateFavoriteLocationDescription => 'Используйте одно из полей поиска ниже или карту, чтобы указать точное местоположение';

  @override
  String get searchLocation => 'Поиск местоположения';

  @override
  String get saveChanges => 'Сохранить изменения';

  @override
  String get rideHistory => 'История поездок';

  @override
  String get scheduledRides => 'Запланированные поездки';

  @override
  String get keepTheOrder => 'Сохранить порядок';

  @override
  String get cancelTheRide => 'Отменить поездку';

  @override
  String get walletBalance => 'Баланс кошелька';

  @override
  String get activities => 'Действия';

  @override
  String get pleaseEnterGiftCardCode => 'Пожалуйста, введите код подарочной карты';

  @override
  String get redeem => 'Использовать';

  @override
  String get enterGiftCardCode => 'Введите код подарочной карты';

  @override
  String get redeemGiftCard => 'Использовать подарочную карту';

  @override
  String get redeemGiftCardDescription => 'Введите код вашей подарочной карты, чтобы воспользоваться им.';

  @override
  String get redeemSuccessTitle => 'Подарочная карта использована!';

  @override
  String redeemSuccessDescription(String amount) {
    return 'Вы успешно воспользовались подарочной картой на сумму $amount';
  }

  @override
  String get addCredit => 'Пополнить кредит';

  @override
  String get payNow => 'Оплатить сейчас';

  @override
  String get addCreditToWallet => 'Пополнить баланс кошелька';

  @override
  String get pleaseSelectAmount => 'Пожалуйста, выберите сумму';

  @override
  String get enterAmount => 'Введите сумму';

  @override
  String get selectAmount => 'Выберите сумму:';

  @override
  String get wallet => 'Кошелек';

  @override
  String get totalRides => 'Общее количество поездок';

  @override
  String get appSettings => 'Настройки приложения';

  @override
  String get mapSettings => 'Настройки карты';

  @override
  String get lanugageSettings => 'Настройки языка';

  @override
  String get paymentMethods => 'Способы оплаты';

  @override
  String get selectCards => 'Выберите карты';

  @override
  String get selectCardsDescription => 'Вы можете выбрать номера карт, которые хотели бы видеть в списке способов оплаты на счетах.';

  @override
  String get delete => 'Удалить';

  @override
  String get nameOnCard => 'Имя на карте';

  @override
  String get profile => 'Профиль';

  @override
  String get scheduledRide => 'Запланированная поездка';

  @override
  String get addPaymentMethod => 'Добавить способ оплаты';

  @override
  String get addPaymentMethodDescription => 'Добавьте новый способ оплаты к вашему аккаунту';

  @override
  String get saveCard => 'Сохранить карту';

  @override
  String get selectDialCode => 'Выберите код страны';

  @override
  String get searchCountryName => 'Поиск названия страны';

  @override
  String get preferences => 'Предпочтения:';

  @override
  String get onboardingDescription => 'Остались считанные мгновения, чтобы зарегистрировать свой аккаунт и наслаждаться комфортными поездками';

  @override
  String get signInSignUp => 'Войти / Зарегистрироваться';

  @override
  String get enterOtp => 'Введите ОТР';

  @override
  String get enterPassword => 'Введите пароль';

  @override
  String get enterPasswordDescription => 'Пожалуйста, введите ваш пароль, чтобы продолжить';

  @override
  String get setPassword => 'Установить пароль';

  @override
  String get password => 'Пароль';

  @override
  String get passwordRuleDescription => 'Включите как минимум два из следующих:';

  @override
  String get passwordRuleLength => 'От 9 до 64 символов';

  @override
  String get passwordRuleUpperCase => 'Прописные буквы';

  @override
  String get passwordRuleLowerCase => 'Строчные буквы';

  @override
  String get passwordRuleNumber => 'Номера';

  @override
  String get passwordRuleSpecialCharacter => 'Специальные символы';

  @override
  String get contactDetails => 'Контактная информация';

  @override
  String get vehicleDetails => 'Информация о транспортном средстве';

  @override
  String get payoutInformation => 'Информация о выплате';

  @override
  String get documents => 'Документы';

  @override
  String get accessDenied => 'Доступ запрещен';

  @override
  String get success => 'Успех';

  @override
  String get skipForNow => 'Пропустить сейчас';

  @override
  String get sendOtpDescription => 'Код подтверждения был отправлен на ваш номер телефона';

  @override
  String get resendOtp => 'Повторно отправить код';

  @override
  String get useOtpInstead => 'Использовать ОТР вместо этого';

  @override
  String get home => 'Главная';

  @override
  String get logout => 'Выйти';

  @override
  String get driverLicenseNumber => 'Номер водительского удостоверения';

  @override
  String get email => 'Электронная почта';

  @override
  String get address => 'Адрес';

  @override
  String get gender => 'Гендер';

  @override
  String get genderMale => 'Мужской';

  @override
  String get genderFemale => 'Женский';

  @override
  String get genderUnknown => 'Нейтральный / Неизвестный';

  @override
  String get vehiclePlateNumber => 'Номерной знак';

  @override
  String get vehicleColor => 'Цвет транспортного средства';

  @override
  String get vehicleModelAndMake => 'Модель и марка транспортного средства';

  @override
  String get vehicleProductionYear => 'Год производства транспортного средства';

  @override
  String get bankName => 'Название банка';

  @override
  String get bankRoutingNumber => 'Номер маршрутизации банка (RTN)';

  @override
  String get bankAccountNumber => 'Номер банковского счета';

  @override
  String get bankSwift => 'SWIFT-код';

  @override
  String get uploadImage => 'Загрузить изображение';

  @override
  String get yourBalance => 'Ваш баланс';

  @override
  String get rideCancellation => 'Отмена поездки';

  @override
  String get cancelRideMessage => 'при отмене может взиматься комиссия';

  @override
  String get cancelRideSuccess => 'Поездка успешно отменена';

  @override
  String get confirmAndCancelRide => 'Подтвердить и отменить поездку';

  @override
  String get selectPaymentMethod => 'Выберите способ оплаты';

  @override
  String get rideFeePaid => 'Плата за поездку оплачена';

  @override
  String get rideFeeUnpaid => 'Плата за поездку еще не оплачена';

  @override
  String get total => 'Общая';

  @override
  String get totalPrice => 'Общая цена';

  @override
  String get addCustomCredit => 'Добавить пользовательский кредит';

  @override
  String get serviceFee => 'Сбор за услугу';

  @override
  String get serviceOptionFee => 'Сбор за дополнительные услуги';

  @override
  String get couponDiscount => 'Скидка по купону';

  @override
  String get walletCreit => 'Кредит кошелька';

  @override
  String get custom => 'Пользовательский';

  @override
  String get payment => 'Оплата';

  @override
  String get cashPayment => 'Оплата наличными';

  @override
  String cashPaymentDescription(String amount) {
    return 'Подтверждаете ли вы, что получили $amount?';
  }

  @override
  String get cashPaymentReceived => 'Оплата наличными получена';

  @override
  String get confirmAndEndTrip => 'Подтвердить и завершить поездку';

  @override
  String get earnings => 'Заработок';

  @override
  String get acceptOrder => 'Принять заказ';

  @override
  String get canceled => 'Отменено';

  @override
  String get unknown => 'Неизвестно';

  @override
  String get commission => 'Комиссия';

  @override
  String get selectProfileImage => 'Выберите изображение профиля';

  @override
  String get chooseAvatarDescription => 'Или выберите аватар из списка ниже:';

  @override
  String get fullName => 'Полное имя';

  @override
  String get favoriteDrivers => 'Избранные водители';

  @override
  String get distanceTraveled => 'Пройденное расстояние';

  @override
  String get rating => 'Рейтинг';

  @override
  String get map => 'Карта';

  @override
  String get income => 'Доход';

  @override
  String get timeSpent => 'Проведенное время';

  @override
  String get daily => 'Ежедневно';

  @override
  String get monthly => 'Ежемесячно';

  @override
  String get noRecordsFoundEarnings => 'Записей о поездках по этим фильтрам не найдено';

  @override
  String get feedbacksSummaryEmptyStateTitle => 'У вас пока недостаточно отзывов для отображения.';

  @override
  String get feedbacksSummary => 'Обзор отзывов';

  @override
  String get feedbacksGoodTitle => 'Отличная работа!';

  @override
  String get feedbacksGoodSubtitle => 'Ваши рейтинги выглядят хорошо на данный момент.';

  @override
  String get feedbacksBadTitle => 'Среднее';

  @override
  String get feedbacksBadSubtitle => 'Можете использовать некоторые улучшения';

  @override
  String get feedbacksGoodPointsTitle => 'Некоторые хорошие качества у вас:';

  @override
  String get feedbacksbadPointsTitle => 'Некоторые аспекты, которые вы можете улучшить:';

  @override
  String get feedbacksReviewsTitle => 'Некоторые ранние отзывы';

  @override
  String get payoutMethods => 'Способы выплаты';

  @override
  String get notice => 'Уведомление:';

  @override
  String get payoutNoticeTitle => 'Вы будете автоматически оплачены администратором дважды в неделю.';

  @override
  String get addPayoutMethod => 'Добавить способ выплаты';

  @override
  String get navigate => 'Навигация';

  @override
  String get noPayoutMethods => 'Нет способов выплаты';

  @override
  String get name => 'Имя';

  @override
  String get nameHint => 'Введите имя';

  @override
  String get bankNameHint => 'Введите название банка';

  @override
  String get branchName => 'Название отделения';

  @override
  String get branchNameHint => 'Введите название отделения';

  @override
  String get accountHolderName => 'Имя держателя счета';

  @override
  String get routingNumber => 'Номер маршрутизации';

  @override
  String get routingNumberHint => 'Введите номер маршрутизации';

  @override
  String get accountNumber => 'Номер аккаунта';

  @override
  String get accountNumberHint => 'Введите номер аккаунта';

  @override
  String get addressHint => 'Введите адрес';

  @override
  String get dateOfBith => 'Дата рождения';

  @override
  String get yearHint => 'Год';

  @override
  String get monthHint => 'Месяц';

  @override
  String get dayHint => 'День';

  @override
  String get city => 'Город';

  @override
  String get cityHint => 'Введите город';

  @override
  String get state => 'Штат (Область)';

  @override
  String get stateHint => 'Введите штат (Область)';

  @override
  String get zipCode => 'Почтовый индекс';

  @override
  String get zipCodeHint => 'Введите почтовый индекс';

  @override
  String get day => 'День';

  @override
  String get month => 'Месяц';

  @override
  String get year => 'Год';

  @override
  String get noActivitiesYet => 'Пока нет активности.';

  @override
  String get headingToDestination => 'движется к месту назначения';

  @override
  String get driverArrivedNotice => 'Водитель ждет вас';

  @override
  String get driverShouldAriveInNotice => 'Прибытие водителя ожидается через';

  @override
  String get driverShouldHaveArrivedNotice => 'Водитель должен прибыть в любую минуту сейчас';

  @override
  String get deleteAccount => 'Удалить аккаунт';

  @override
  String get deleteAccountNotice => 'Вы уверены, что хотите удалить свой аккаунт? Через 30 дней ваш аккаунт будет удален навсегда. В течение этого времени вы можете восстановить аккаунт, войдя в систему снова.';

  @override
  String get confirmAndDeleteAccount => 'Подтвердить и удалить аккаунт';

  @override
  String get accountDeleted => 'Аккаунт был удален';

  @override
  String share_trip_text_locations(Object destination, Object pickup) {
    return 'Я в пути к $destination из $pickup.';
  }

  @override
  String share_trip_text_driver(Object firstName, Object lastName, Object mobileNumber) {
    return ' Имя моего водителя $firstName $lastName, номер телефона +$mobileNumber.';
  }

  @override
  String share_trip_text_rider(Object firstName, Object lastName, Object mobileNumber) {
    return ' Водителя со мной зовут $firstName $lastName, его номер телефона +$mobileNumber.';
  }

  @override
  String share_trip_started_time(Object startTime, Object duration) {
    return ' Поездка началась $startTime и я ожидаю, что поездка займет примерно $duration минут(ы)';
  }

  @override
  String share_trip_not_arrived_time(Object duration) {
    return ' Я ожидаю, что поездка займет примерно $duration минут, как только я сяду в машину водителя.';
  }

  @override
  String get sendSOSMessage => 'ВАЖНО: Пожалуйста, используйте эту функцию только в случае чрезвычайной ситуации. Мы свяжемся с правоохранительными органами от вашего имени.';

  @override
  String get confirmAndSendSOS => 'Подтвердить и отправить SOS';

  @override
  String get sosSentSuccessfully => 'SOS успешно отправлен';

  @override
  String get topUpSuccess => 'Баланс кошелька успешно пополнен';

  @override
  String get cancelNotAllowed => 'Вы не можете отменить эту поездку';

  @override
  String get error => 'Ошибка';

  @override
  String get connectionError => 'Ошибка соединения';

  @override
  String get serverError => 'Ошибка сервера';

  @override
  String get addNewLocation => 'Добавить новое местоположение';

  @override
  String get twoWayTrip => 'Two-way trip';

  @override
  String get reportSubmitted => 'Отчет отправлен';

  @override
  String get reportSubmittedDescription => 'Ваш отчет успешно отправлен, мы его рассмотрим и примем необходимые меры.';

  @override
  String get cardNumber => 'Номер карты';

  @override
  String get cardNumberHint => 'Введите номер карты';

  @override
  String get expiryDate => 'Дата истечения срока действия';

  @override
  String get expiryDateHint => 'ММ/ГГ';

  @override
  String get noFavoriteDrivers => 'Нет любимых водителей';

  @override
  String get pickupLocationNotFound => 'Мы не смогли определить ваше текущее местоположение с помощью GPS в качестве место посадки. Пожалуйста, введите ваше место посадки вручную.';

  @override
  String get dragToSelect => 'Перетащите для выбора';

  @override
  String get skip => 'Пропустить';

  @override
  String get openSettings => 'Открыть настройки';

  @override
  String get locationPermission => 'Разрешение на местоположение';

  @override
  String get locationPermissionDeniedForeverMessage => 'Разрешение на местоположение необходимо для получения заказов поблизости от вас, а также для отслеживания вашего местоположения пассажиром. Без этого разрешения вы не сможете получать заказы, и мы не сможем знать ваше текущее местоположение. Вы можете изменить это разрешение в настройках вашего телефона.';

  @override
  String get allow => 'Разрешить';
}
