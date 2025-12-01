// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for English (`en`).
class AppLocalizationsEn extends AppLocalizations {
  AppLocalizationsEn([String locale = 'en']) : super(locale);

  @override
  String get appName => 'Bike Rental';

  @override
  String get bikeCustomerApp => 'Bike Customer App';

  @override
  String get email => 'Email';

  @override
  String get enterYourEmail => 'Enter your email';

  @override
  String get password => 'Password';

  @override
  String get enterYourPassword => 'Enter your password';

  @override
  String get confirmPassword => 'Confirm Password';

  @override
  String get reEnterYourPassword => 'Re-enter your password';

  @override
  String get signIn => 'Sign In';

  @override
  String get signInToContinue => 'Sign in to continue';

  @override
  String get signUp => 'Sign Up';

  @override
  String get createAccount => 'Create Account';

  @override
  String get signUpToGetStarted => 'Sign up to get started';

  @override
  String get loginSuccessful => 'Login successful!';

  @override
  String loginFailedError(String error) {
    return 'Login failed: $error';
  }

  @override
  String get registrationSuccessful => 'Registration successful!';

  @override
  String registrationFailedError(String error) {
    return 'Registration failed: $error';
  }

  @override
  String get dontHaveAnAccount => 'Don\'t have an account? ';

  @override
  String get alreadyHaveAnAccount => 'Already have an account? ';

  @override
  String get homeTab => 'Home';

  @override
  String get orderHistoryTab => 'Orders';

  @override
  String get profileTab => 'Profile';

  @override
  String get orderHistory => 'Order History';

  @override
  String get noOrderHistory => 'No order history';

  @override
  String get yourRentalOrdersWillAppearHere =>
      'Your rental orders will appear here';

  @override
  String get failedToLoadOrders => 'Failed to load orders';

  @override
  String get retry => 'Retry';

  @override
  String orderNumber(int id) {
    return 'Order #$id';
  }

  @override
  String get startDate => 'Start Date';

  @override
  String get duration => 'Duration';

  @override
  String get pickupPoint => 'Pickup Point';

  @override
  String get profile => 'Profile';

  @override
  String get noEmail => 'No email';

  @override
  String get privacyPolicy => 'Privacy Policy';

  @override
  String get aboutUs => 'About Us';

  @override
  String get logout => 'Logout';

  @override
  String get areYouSureYouWantToLogout => 'Are you sure you want to logout?';

  @override
  String get cancel => 'Cancel';

  @override
  String get failedToLoadProfile => 'Failed to load profile';

  @override
  String couldNotOpenUrl(String url) {
    return 'Could not open URL: $url';
  }

  @override
  String get notifications => 'Notifications';

  @override
  String get noNotifications => 'No notifications';

  @override
  String get youHaveNoNotificationsAtThisTime =>
      'You have no notifications at this time';

  @override
  String get availableBikes => 'Available Bikes';

  @override
  String get all => 'All';

  @override
  String get noBikesAvailableForTheSelectedColor =>
      'No bikes available for the selected color';

  @override
  String get inStock => 'In Stock';

  @override
  String get outOfStock => 'Out of Stock';

  @override
  String get perDay => '/day';

  @override
  String get rentalPackages => 'Rental Packages';

  @override
  String get get => 'Get';

  @override
  String get offers => 'Offers';

  @override
  String get couldNotOpenTheLink => 'Could not open the link';

  @override
  String errorOpeningLinkError(String error) {
    return 'Error opening link: $error';
  }

  @override
  String get bikeDetails => 'Bike Details';

  @override
  String get specifications => 'Specifications';

  @override
  String get range => 'Range';

  @override
  String get batteryCapacity => 'Battery Capacity';

  @override
  String get maxSpeed => 'Max Speed';

  @override
  String get pricePerDay => 'Price per day';

  @override
  String get rentNow => 'Rent Now';

  @override
  String get rentBike => 'Rent Bike';

  @override
  String get bikeInformation => 'Bike Information';

  @override
  String get rentalDetails => 'Rental Details';

  @override
  String get startDatePlaceholder => 'Select start date';

  @override
  String get pickupLocationPlaceholder => 'Select pickup location';

  @override
  String get phoneNumber => 'Phone Number';

  @override
  String get enterYourPhoneNumber => 'Enter your phone number';

  @override
  String get pleaseEnterYourPhoneNumber => 'Please enter your phone number';

  @override
  String get pickupLocation => 'Pickup Location';

  @override
  String get selectPickupLocationPlaceholder => 'Select pickup location';

  @override
  String get noPickupLocationsAvailable => 'No pickup locations available';

  @override
  String get failedToLoadLocations => 'Failed to load locations';

  @override
  String get selectDurationPlaceholder => 'Select duration';

  @override
  String get noDurationsAvailable => 'No durations available';

  @override
  String get failedToLoadDurations => 'Failed to load durations';

  @override
  String get priceSummary => 'Price Summary';

  @override
  String get total => 'Total';

  @override
  String get rent => 'Rent';

  @override
  String get selectStartDate => 'Select Start Date';

  @override
  String get selectPickupLocation => 'Select Pickup Location';

  @override
  String get selectDuration => 'Select Duration';

  @override
  String get rentalSuccess => 'Rental Success!';

  @override
  String get yourBikeRentalHasBeenSuccessfullyProcessed =>
      'Your bike rental has been successfully processed';

  @override
  String get backToHome => 'Back to Home';

  @override
  String get noSectionsAvailable => 'No sections available';

  @override
  String get failedToLoadSections => 'Failed to load sections';
}
