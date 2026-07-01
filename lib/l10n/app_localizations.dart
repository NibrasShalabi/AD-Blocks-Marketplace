import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'app_localizations_ar.dart';
import 'app_localizations_en.dart';

// ignore_for_file: type=lint

/// Callers can lookup localized strings with an instance of AppLocalizations
/// returned by `AppLocalizations.of(context)`.
///
/// Applications need to include `AppLocalizations.delegate()` in their app's
/// `localizationDelegates` list, and the locales they support in the app's
/// `supportedLocales` list. For example:
///
/// ```dart
/// import 'l10n/app_localizations.dart';
///
/// return MaterialApp(
///   localizationsDelegates: AppLocalizations.localizationsDelegates,
///   supportedLocales: AppLocalizations.supportedLocales,
///   home: MyApplicationHome(),
/// );
/// ```
///
/// ## Update pubspec.yaml
///
/// Please make sure to update your pubspec.yaml to include the following
/// packages:
///
/// ```yaml
/// dependencies:
///   # Internationalization support.
///   flutter_localizations:
///     sdk: flutter
///   intl: any # Use the pinned version from flutter_localizations
///
///   # Rest of dependencies
/// ```
///
/// ## iOS Applications
///
/// iOS applications define key application metadata, including supported
/// locales, in an Info.plist file that is built into the application bundle.
/// To configure the locales supported by your app, you’ll need to edit this
/// file.
///
/// First, open your project’s ios/Runner.xcworkspace Xcode workspace file.
/// Then, in the Project Navigator, open the Info.plist file under the Runner
/// project’s Runner folder.
///
/// Next, select the Information Property List item, select Add Item from the
/// Editor menu, then select Localizations from the pop-up menu.
///
/// Select and expand the newly-created Localizations item then, for each
/// locale your application supports, add a new item and select the locale
/// you wish to add from the pop-up menu in the Value field. This list should
/// be consistent with the languages listed in the AppLocalizations.supportedLocales
/// property.
abstract class AppLocalizations {
  AppLocalizations(String locale) : localeName = intl.Intl.canonicalizedLocale(locale.toString());

  final String localeName;

  static AppLocalizations? of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations);
  }

  static const LocalizationsDelegate<AppLocalizations> delegate = _AppLocalizationsDelegate();

  /// A list of this localizations delegate along with the default localizations
  /// delegates.
  ///
  /// Returns a list of localizations delegates containing this delegate along with
  /// GlobalMaterialLocalizations.delegate, GlobalCupertinoLocalizations.delegate,
  /// and GlobalWidgetsLocalizations.delegate.
  ///
  /// Additional delegates can be added by appending to this list in
  /// MaterialApp. This list does not have to be used at all if a custom list
  /// of delegates is preferred or required.
  static const List<LocalizationsDelegate<dynamic>> localizationsDelegates = <LocalizationsDelegate<dynamic>>[
    delegate,
    GlobalMaterialLocalizations.delegate,
    GlobalCupertinoLocalizations.delegate,
    GlobalWidgetsLocalizations.delegate,
  ];

  /// A list of this localizations delegate's supported locales.
  static const List<Locale> supportedLocales = <Locale>[
    Locale('ar'),
    Locale('en')
  ];

  /// No description provided for @appTitle.
  ///
  /// In en, this message translates to:
  /// **'Ad Board'**
  String get appTitle;

  /// No description provided for @categories.
  ///
  /// In en, this message translates to:
  /// **'Categories'**
  String get categories;

  /// No description provided for @vipAds.
  ///
  /// In en, this message translates to:
  /// **'VIP Ads'**
  String get vipAds;

  /// No description provided for @vipSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Premium spots — highest bidder on top'**
  String get vipSubtitle;

  /// No description provided for @vipToast.
  ///
  /// In en, this message translates to:
  /// **'✨ Check the latest VIP ads'**
  String get vipToast;

  /// No description provided for @see.
  ///
  /// In en, this message translates to:
  /// **'See'**
  String get see;

  /// No description provided for @visit.
  ///
  /// In en, this message translates to:
  /// **'Visit'**
  String get visit;

  /// No description provided for @report.
  ///
  /// In en, this message translates to:
  /// **'Report'**
  String get report;

  /// No description provided for @slot.
  ///
  /// In en, this message translates to:
  /// **'slot'**
  String get slot;

  /// No description provided for @newBadge.
  ///
  /// In en, this message translates to:
  /// **'New'**
  String get newBadge;

  /// No description provided for @uploadTitle.
  ///
  /// In en, this message translates to:
  /// **'Post your ad'**
  String get uploadTitle;

  /// No description provided for @pickImage.
  ///
  /// In en, this message translates to:
  /// **'Choose image'**
  String get pickImage;

  /// No description provided for @adTitleLabel.
  ///
  /// In en, this message translates to:
  /// **'Ad title'**
  String get adTitleLabel;

  /// No description provided for @linkLabel.
  ///
  /// In en, this message translates to:
  /// **'Link (URL)'**
  String get linkLabel;

  /// No description provided for @emailLabel.
  ///
  /// In en, this message translates to:
  /// **'Contact email'**
  String get emailLabel;

  /// No description provided for @submit.
  ///
  /// In en, this message translates to:
  /// **'Submit'**
  String get submit;

  /// No description provided for @requiredField.
  ///
  /// In en, this message translates to:
  /// **'Required'**
  String get requiredField;

  /// No description provided for @invalidUrl.
  ///
  /// In en, this message translates to:
  /// **'Enter a valid link'**
  String get invalidUrl;

  /// No description provided for @invalidEmail.
  ///
  /// In en, this message translates to:
  /// **'Enter a valid email'**
  String get invalidEmail;

  /// No description provided for @description.
  ///
  /// In en, this message translates to:
  /// **'Description'**
  String get description;

  /// No description provided for @close.
  ///
  /// In en, this message translates to:
  /// **'Close'**
  String get close;

  /// No description provided for @choosePackage.
  ///
  /// In en, this message translates to:
  /// **'Choose a package'**
  String get choosePackage;

  /// No description provided for @blocks.
  ///
  /// In en, this message translates to:
  /// **'blocks'**
  String get blocks;

  /// No description provided for @perUnit.
  ///
  /// In en, this message translates to:
  /// **'per block'**
  String get perUnit;

  /// No description provided for @bestValue.
  ///
  /// In en, this message translates to:
  /// **'Best value'**
  String get bestValue;

  /// No description provided for @upgradeVip.
  ///
  /// In en, this message translates to:
  /// **'Upgrade to VIP'**
  String get upgradeVip;

  /// No description provided for @chooseTemplate.
  ///
  /// In en, this message translates to:
  /// **'Choose a style'**
  String get chooseTemplate;

  /// No description provided for @continueBtn.
  ///
  /// In en, this message translates to:
  /// **'Continue'**
  String get continueBtn;

  /// No description provided for @total.
  ///
  /// In en, this message translates to:
  /// **'Total'**
  String get total;

  /// No description provided for @vipTitle.
  ///
  /// In en, this message translates to:
  /// **'VIP Ad'**
  String get vipTitle;

  /// No description provided for @vipAmountLabel.
  ///
  /// In en, this message translates to:
  /// **'Your bid amount (\$)'**
  String get vipAmountLabel;

  /// No description provided for @vipMinNote.
  ///
  /// In en, this message translates to:
  /// **'Minimum: \$50 — higher bids rank higher'**
  String get vipMinNote;

  /// No description provided for @vipBelowMin.
  ///
  /// In en, this message translates to:
  /// **'Amount is below the minimum'**
  String get vipBelowMin;

  /// No description provided for @yourRank.
  ///
  /// In en, this message translates to:
  /// **'Higher amount = higher position'**
  String get yourRank;

  /// No description provided for @payTitle.
  ///
  /// In en, this message translates to:
  /// **'Payment'**
  String get payTitle;

  /// No description provided for @orderSummary.
  ///
  /// In en, this message translates to:
  /// **'Order summary'**
  String get orderSummary;

  /// No description provided for @payViaKaza.
  ///
  /// In en, this message translates to:
  /// **'Pay via KazaWallet'**
  String get payViaKaza;

  /// No description provided for @termsTitle.
  ///
  /// In en, this message translates to:
  /// **'Terms & Privacy'**
  String get termsTitle;

  /// No description provided for @agreeTerms.
  ///
  /// In en, this message translates to:
  /// **'I have read and agree to the terms'**
  String get agreeTerms;

  /// No description provided for @termNoRefund.
  ///
  /// In en, this message translates to:
  /// **'All payments are non-refundable.'**
  String get termNoRefund;

  /// No description provided for @termContent.
  ///
  /// In en, this message translates to:
  /// **'Prohibited: adult, political, religious, violent, drugs, weapons, or gory content.'**
  String get termContent;

  /// No description provided for @termLinkResp.
  ///
  /// In en, this message translates to:
  /// **'You are responsible for your ad\'s link content for the entire display period. Any violation means immediate removal without refund.'**
  String get termLinkResp;

  /// No description provided for @termReview.
  ///
  /// In en, this message translates to:
  /// **'Every ad is reviewed before publishing.'**
  String get termReview;

  /// No description provided for @addAd.
  ///
  /// In en, this message translates to:
  /// **'Post an ad'**
  String get addAd;

  /// No description provided for @chooseType.
  ///
  /// In en, this message translates to:
  /// **'Choose ad type'**
  String get chooseType;

  /// No description provided for @normalAd.
  ///
  /// In en, this message translates to:
  /// **'Normal ad'**
  String get normalAd;

  /// No description provided for @normalAdDesc.
  ///
  /// In en, this message translates to:
  /// **'Fixed order by priority (first come first placed)'**
  String get normalAdDesc;

  /// No description provided for @vipAdDesc.
  ///
  /// In en, this message translates to:
  /// **'Compete by amount — pay more, rank higher'**
  String get vipAdDesc;

  /// No description provided for @readTerms.
  ///
  /// In en, this message translates to:
  /// **'Read terms & privacy'**
  String get readTerms;

  /// No description provided for @reportTitle.
  ///
  /// In en, this message translates to:
  /// **'Report ad'**
  String get reportTitle;

  /// No description provided for @reportReason.
  ///
  /// In en, this message translates to:
  /// **'Reason for report'**
  String get reportReason;

  /// No description provided for @reportSent.
  ///
  /// In en, this message translates to:
  /// **'Report received. Thank you.'**
  String get reportSent;

  /// No description provided for @send.
  ///
  /// In en, this message translates to:
  /// **'Send'**
  String get send;

  /// No description provided for @cancel.
  ///
  /// In en, this message translates to:
  /// **'Cancel'**
  String get cancel;

  /// No description provided for @contactTitle.
  ///
  /// In en, this message translates to:
  /// **'Contact us'**
  String get contactTitle;

  /// No description provided for @privacyTitle.
  ///
  /// In en, this message translates to:
  /// **'Privacy policy'**
  String get privacyTitle;

  /// No description provided for @contactIntro.
  ///
  /// In en, this message translates to:
  /// **'For questions or support, reach us here:'**
  String get contactIntro;

  /// No description provided for @contactEmail.
  ///
  /// In en, this message translates to:
  /// **'nibras.shalabi0@gmail.com'**
  String get contactEmail;

  /// No description provided for @contactTelegram.
  ///
  /// In en, this message translates to:
  /// **'Telegram: @yoursite'**
  String get contactTelegram;

  /// No description provided for @privacyData.
  ///
  /// In en, this message translates to:
  /// **'We collect your contact email to reach you about your ad and to resolve disputes.'**
  String get privacyData;

  /// No description provided for @privacyAnalytics.
  ///
  /// In en, this message translates to:
  /// **'We use anonymous analytics to improve the site (visits, popular categories).'**
  String get privacyAnalytics;

  /// No description provided for @privacyNoSell.
  ///
  /// In en, this message translates to:
  /// **'We never sell your personal data.'**
  String get privacyNoSell;

  /// No description provided for @privacyRetention.
  ///
  /// In en, this message translates to:
  /// **'Your data is kept only as long as needed for your ad and records.'**
  String get privacyRetention;

  /// No description provided for @footerTerms.
  ///
  /// In en, this message translates to:
  /// **'Terms'**
  String get footerTerms;

  /// No description provided for @footerPrivacy.
  ///
  /// In en, this message translates to:
  /// **'Privacy'**
  String get footerPrivacy;

  /// No description provided for @footerContact.
  ///
  /// In en, this message translates to:
  /// **'Contact'**
  String get footerContact;
}

class _AppLocalizationsDelegate extends LocalizationsDelegate<AppLocalizations> {
  const _AppLocalizationsDelegate();

  @override
  Future<AppLocalizations> load(Locale locale) {
    return SynchronousFuture<AppLocalizations>(lookupAppLocalizations(locale));
  }

  @override
  bool isSupported(Locale locale) => <String>['ar', 'en'].contains(locale.languageCode);

  @override
  bool shouldReload(_AppLocalizationsDelegate old) => false;
}

AppLocalizations lookupAppLocalizations(Locale locale) {


  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'ar': return AppLocalizationsAr();
    case 'en': return AppLocalizationsEn();
  }

  throw FlutterError(
    'AppLocalizations.delegate failed to load unsupported locale "$locale". This is likely '
    'an issue with the localizations generation tool. Please file an issue '
    'on GitHub with a reproducible sample app and the gen-l10n configuration '
    'that was used.'
  );
}
