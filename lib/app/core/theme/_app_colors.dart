// 🎯 Dart imports:
import 'dart:ui';

abstract class FinanceAppColors {
  //---------------Base Colors---------------//
  static const kBlackColor = Color(0xff000000);
  static const kWhiteColor = Color(0xffffffff);
  //---------------Base Colors---------------//

  //---------------Primary Colors---------------//
  static const kPrimary50 = Color(0xffF4F4F4);
  static const kPrimary100 = Color(0xFFCCD8F3); //#ccd8f3
  static const kPrimary200 = Color(0xFFB3C4ED); //#b3c4ed
  static const kPrimary300 = Color(0xFF99B1E7); //#99b1e7
  static const kPrimary400 = Color(0xFF809EE1); //#809ee1
  static const kPrimary500 = Color(0xFF678ADB); //#678adb
  static const kPrimary600 = Color(0xFF4D77D5); //#4d77d5
  static const kPrimary700 = Color(0xFF3463CF); //#3463cf
  static const kPrimary800 = Color(0xFF1B50C9); //#1b50c9
  static const kPrimary900 = Color(0xFF023DC3); //#023DC3
  static const kPrimary1000 = Color(0xFF0A65C6); //#023DC3
  //---------------Primary Colors---------------//

  //---------------Neutral Colors---------------//
  static const kNeutral50 = Color(0xffF6F6F6);
  static const kNeutral100 = Color(0xffF5F5F5);
  static const kNeutral200 = Color(0xffE5E5E5);
  static const kNeutral300 = Color(0xffD4D4D4);
  static const kNeutral400 = Color(0xffA3A3A3);
  static const kNeutral500 = Color(0xff737373);
  static const kNeutral600 = Color(0xff525252);
  static const kNeutral700 = Color(0xff404040);
  static const kNeutral800 = Color(0xff262626);
  static const kNeutral900 = Color(0xff171717);
  //---------------Neutral Colors---------------//

  //---------------Success Colors---------------//
  static const kSuccess = Color(0xff00B243);
  static final kSuccess20Op = kSuccess.withOpacity(0.20);
  //---------------Success Colors---------------//

  //---------------Info Colors---------------//
  static const kInfo = Color(0xFF023DC3);
  static final kInfo20Op = kInfo.withOpacity(0.20);
  //---------------Info Colors---------------//

  //---------------Warning Colors---------------//
  static const kWarning = Color(0xffFD7F0B);
  static final kWarning20Op = kWarning.withOpacity(0.20);
  //---------------Warning Colors---------------//

  //---------------Error Colors---------------//
  static const kError = Color(0xffE40F0F);
  static final kError20Op = kError.withOpacity(0.20);
  //---------------Error Colors---------------//

  //---------------Dark Colors---------------//
  static const kDark1 = Color(0xff0F172A);
  static const kDark2 = Color(0xff1E293B);
  static const kDark3 = Color(0xff334155);
  //---------------Dark Colors---------------//

  //---------------Other Colors---------------//
  static const kSecondaryBtnColor = Color(0xff3577F1);
  //---------------Other Colors---------------//
}
