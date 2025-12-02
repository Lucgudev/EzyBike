import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

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
  AppLocalizations(String locale)
    : localeName = intl.Intl.canonicalizedLocale(locale.toString());

  final String localeName;

  static AppLocalizations? of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations);
  }

  static const LocalizationsDelegate<AppLocalizations> delegate =
      _AppLocalizationsDelegate();

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
  static const List<LocalizationsDelegate<dynamic>> localizationsDelegates =
      <LocalizationsDelegate<dynamic>>[
        delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ];

  /// A list of this localizations delegate's supported locales.
  static const List<Locale> supportedLocales = <Locale>[Locale('en')];

  /// The application name
  ///
  /// In en, this message translates to:
  /// **'Bike Rental'**
  String get appName;

  /// The bike customer application name
  ///
  /// In en, this message translates to:
  /// **'Ezy Ride'**
  String get bikeCustomerApp;

  /// Email input field label
  ///
  /// In en, this message translates to:
  /// **'Email'**
  String get email;

  /// Email input field hint
  ///
  /// In en, this message translates to:
  /// **'Enter your email'**
  String get enterYourEmail;

  /// Password input field label
  ///
  /// In en, this message translates to:
  /// **'Password'**
  String get password;

  /// Password input field hint
  ///
  /// In en, this message translates to:
  /// **'Enter your password'**
  String get enterYourPassword;

  /// Confirm password input field label
  ///
  /// In en, this message translates to:
  /// **'Confirm Password'**
  String get confirmPassword;

  /// Confirm password input field hint
  ///
  /// In en, this message translates to:
  /// **'Re-enter your password'**
  String get reEnterYourPassword;

  /// Sign in button text
  ///
  /// In en, this message translates to:
  /// **'Sign In'**
  String get signIn;

  /// Sign in page subtitle
  ///
  /// In en, this message translates to:
  /// **'Sign in to continue'**
  String get signInToContinue;

  /// Sign up button text
  ///
  /// In en, this message translates to:
  /// **'Sign Up'**
  String get signUp;

  /// Create account page title
  ///
  /// In en, this message translates to:
  /// **'Create Account'**
  String get createAccount;

  /// Sign up page subtitle
  ///
  /// In en, this message translates to:
  /// **'Sign up to get started'**
  String get signUpToGetStarted;

  /// Login success message
  ///
  /// In en, this message translates to:
  /// **'Login successful!'**
  String get loginSuccessful;

  /// Login failed error message
  ///
  /// In en, this message translates to:
  /// **'Login failed: {error}'**
  String loginFailedError(String error);

  /// Registration success message
  ///
  /// In en, this message translates to:
  /// **'Registration successful!'**
  String get registrationSuccessful;

  /// Registration failed error message
  ///
  /// In en, this message translates to:
  /// **'Registration failed: {error}'**
  String registrationFailedError(String error);

  /// Text asking if user doesn't have account
  ///
  /// In en, this message translates to:
  /// **'Don\'t have an account? '**
  String get dontHaveAnAccount;

  /// Text asking if user already has account
  ///
  /// In en, this message translates to:
  /// **'Already have an account? '**
  String get alreadyHaveAnAccount;

  /// Home tab label
  ///
  /// In en, this message translates to:
  /// **'Home'**
  String get homeTab;

  /// Order history tab label
  ///
  /// In en, this message translates to:
  /// **'Orders'**
  String get orderHistoryTab;

  /// Profile tab label
  ///
  /// In en, this message translates to:
  /// **'Profile'**
  String get profileTab;

  /// Order history page title
  ///
  /// In en, this message translates to:
  /// **'Order History'**
  String get orderHistory;

  /// Empty order history message
  ///
  /// In en, this message translates to:
  /// **'No order history'**
  String get noOrderHistory;

  /// Empty order history description
  ///
  /// In en, this message translates to:
  /// **'Your rental orders will appear here'**
  String get yourRentalOrdersWillAppearHere;

  /// Error loading orders message
  ///
  /// In en, this message translates to:
  /// **'Failed to load orders'**
  String get failedToLoadOrders;

  /// Retry button text
  ///
  /// In en, this message translates to:
  /// **'Retry'**
  String get retry;

  /// Order number label
  ///
  /// In en, this message translates to:
  /// **'Order #{id}'**
  String orderNumber(int id);

  /// Start date label
  ///
  /// In en, this message translates to:
  /// **'Start Date'**
  String get startDate;

  /// Duration label
  ///
  /// In en, this message translates to:
  /// **'Duration'**
  String get duration;

  /// Pickup point label
  ///
  /// In en, this message translates to:
  /// **'Pickup Point'**
  String get pickupPoint;

  /// Profile page title
  ///
  /// In en, this message translates to:
  /// **'Profile'**
  String get profile;

  /// No email placeholder
  ///
  /// In en, this message translates to:
  /// **'No email'**
  String get noEmail;

  /// Privacy policy menu item
  ///
  /// In en, this message translates to:
  /// **'Privacy Policy'**
  String get privacyPolicy;

  /// About us menu item
  ///
  /// In en, this message translates to:
  /// **'About Us'**
  String get aboutUs;

  /// Logout menu item
  ///
  /// In en, this message translates to:
  /// **'Logout'**
  String get logout;

  /// Logout confirmation message
  ///
  /// In en, this message translates to:
  /// **'Are you sure you want to logout?'**
  String get areYouSureYouWantToLogout;

  /// Cancel button text
  ///
  /// In en, this message translates to:
  /// **'Cancel'**
  String get cancel;

  /// Error loading profile message
  ///
  /// In en, this message translates to:
  /// **'Failed to load profile'**
  String get failedToLoadProfile;

  /// Error opening URL message
  ///
  /// In en, this message translates to:
  /// **'Could not open URL: {url}'**
  String couldNotOpenUrl(String url);

  /// Notifications page title
  ///
  /// In en, this message translates to:
  /// **'Notifications'**
  String get notifications;

  /// Empty notifications message
  ///
  /// In en, this message translates to:
  /// **'No notifications'**
  String get noNotifications;

  /// Empty notifications description
  ///
  /// In en, this message translates to:
  /// **'You have no notifications at this time'**
  String get youHaveNoNotificationsAtThisTime;

  /// Available bikes section title
  ///
  /// In en, this message translates to:
  /// **'Available Bikes'**
  String get availableBikes;

  /// All filter option
  ///
  /// In en, this message translates to:
  /// **'All'**
  String get all;

  /// No bikes for color filter message
  ///
  /// In en, this message translates to:
  /// **'No bikes available for the selected color'**
  String get noBikesAvailableForTheSelectedColor;

  /// In stock badge text
  ///
  /// In en, this message translates to:
  /// **'In Stock'**
  String get inStock;

  /// Out of stock badge text
  ///
  /// In en, this message translates to:
  /// **'Out of Stock'**
  String get outOfStock;

  /// Per day suffix for price
  ///
  /// In en, this message translates to:
  /// **'/day'**
  String get perDay;

  /// Rental packages section title
  ///
  /// In en, this message translates to:
  /// **'Rental Packages'**
  String get rentalPackages;

  /// Get button text for packages
  ///
  /// In en, this message translates to:
  /// **'Get'**
  String get get;

  /// Offers section title
  ///
  /// In en, this message translates to:
  /// **'Offers'**
  String get offers;

  /// Could not open link error message
  ///
  /// In en, this message translates to:
  /// **'Could not open the link'**
  String get couldNotOpenTheLink;

  /// Error opening link with details
  ///
  /// In en, this message translates to:
  /// **'Error opening link: {error}'**
  String errorOpeningLinkError(String error);

  /// Bike details page title
  ///
  /// In en, this message translates to:
  /// **'Bike Details'**
  String get bikeDetails;

  /// Specifications section title
  ///
  /// In en, this message translates to:
  /// **'Specifications'**
  String get specifications;

  /// Range specification label
  ///
  /// In en, this message translates to:
  /// **'Range'**
  String get range;

  /// Battery capacity specification label
  ///
  /// In en, this message translates to:
  /// **'Battery Capacity'**
  String get batteryCapacity;

  /// Max speed specification label
  ///
  /// In en, this message translates to:
  /// **'Max Speed'**
  String get maxSpeed;

  /// Price per day label
  ///
  /// In en, this message translates to:
  /// **'Price per day'**
  String get pricePerDay;

  /// Rent now button text
  ///
  /// In en, this message translates to:
  /// **'Rent Now'**
  String get rentNow;

  /// Rent bike page title
  ///
  /// In en, this message translates to:
  /// **'Rent Bike'**
  String get rentBike;

  /// Bike information section title
  ///
  /// In en, this message translates to:
  /// **'Bike Information'**
  String get bikeInformation;

  /// Rental details section title
  ///
  /// In en, this message translates to:
  /// **'Rental Details'**
  String get rentalDetails;

  /// Start date placeholder text
  ///
  /// In en, this message translates to:
  /// **'Select start date'**
  String get startDatePlaceholder;

  /// Pickup location placeholder text
  ///
  /// In en, this message translates to:
  /// **'Select pickup location'**
  String get pickupLocationPlaceholder;

  /// Phone number label
  ///
  /// In en, this message translates to:
  /// **'Phone Number'**
  String get phoneNumber;

  /// Phone number placeholder text
  ///
  /// In en, this message translates to:
  /// **'Enter your phone number'**
  String get enterYourPhoneNumber;

  /// Phone number validation message
  ///
  /// In en, this message translates to:
  /// **'Please enter your phone number'**
  String get pleaseEnterYourPhoneNumber;

  /// Pickup location label
  ///
  /// In en, this message translates to:
  /// **'Pickup Location'**
  String get pickupLocation;

  /// Pickup location field placeholder
  ///
  /// In en, this message translates to:
  /// **'Select pickup location'**
  String get selectPickupLocationPlaceholder;

  /// No pickup locations message
  ///
  /// In en, this message translates to:
  /// **'No pickup locations available'**
  String get noPickupLocationsAvailable;

  /// Failed to load locations error message
  ///
  /// In en, this message translates to:
  /// **'Failed to load locations'**
  String get failedToLoadLocations;

  /// Duration field placeholder text
  ///
  /// In en, this message translates to:
  /// **'Select duration'**
  String get selectDurationPlaceholder;

  /// No durations message
  ///
  /// In en, this message translates to:
  /// **'No durations available'**
  String get noDurationsAvailable;

  /// Failed to load durations error message
  ///
  /// In en, this message translates to:
  /// **'Failed to load durations'**
  String get failedToLoadDurations;

  /// Price summary section title
  ///
  /// In en, this message translates to:
  /// **'Price Summary'**
  String get priceSummary;

  /// Total label
  ///
  /// In en, this message translates to:
  /// **'Total'**
  String get total;

  /// Rent button text
  ///
  /// In en, this message translates to:
  /// **'Rent'**
  String get rent;

  /// Select start date dialog title
  ///
  /// In en, this message translates to:
  /// **'Select Start Date'**
  String get selectStartDate;

  /// Select pickup location dialog title
  ///
  /// In en, this message translates to:
  /// **'Select Pickup Location'**
  String get selectPickupLocation;

  /// Select duration dialog title
  ///
  /// In en, this message translates to:
  /// **'Select Duration'**
  String get selectDuration;

  /// Rental success title
  ///
  /// In en, this message translates to:
  /// **'Rental Success!'**
  String get rentalSuccess;

  /// Rental success message
  ///
  /// In en, this message translates to:
  /// **'Your bike rental has been successfully processed'**
  String get yourBikeRentalHasBeenSuccessfullyProcessed;

  /// Back to home button text
  ///
  /// In en, this message translates to:
  /// **'Back to Home'**
  String get backToHome;

  /// No sections available message on home
  ///
  /// In en, this message translates to:
  /// **'No sections available'**
  String get noSectionsAvailable;

  /// Error loading sections message
  ///
  /// In en, this message translates to:
  /// **'Failed to load sections'**
  String get failedToLoadSections;
}

class _AppLocalizationsDelegate
    extends LocalizationsDelegate<AppLocalizations> {
  const _AppLocalizationsDelegate();

  @override
  Future<AppLocalizations> load(Locale locale) {
    return SynchronousFuture<AppLocalizations>(lookupAppLocalizations(locale));
  }

  @override
  bool isSupported(Locale locale) =>
      <String>['en'].contains(locale.languageCode);

  @override
  bool shouldReload(_AppLocalizationsDelegate old) => false;
}

AppLocalizations lookupAppLocalizations(Locale locale) {
  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'en':
      return AppLocalizationsEn();
  }

  throw FlutterError(
    'AppLocalizations.delegate failed to load unsupported locale "$locale". This is likely '
    'an issue with the localizations generation tool. Please file an issue '
    'on GitHub with a reproducible sample app and the gen-l10n configuration '
    'that was used.',
  );
}
