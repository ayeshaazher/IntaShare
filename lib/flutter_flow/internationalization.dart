import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';

const _kLocaleStorageKey = '__locale_key__';

class FFLocalizations {
  FFLocalizations(this.locale);

  final Locale locale;

  static FFLocalizations of(BuildContext context) =>
      Localizations.of<FFLocalizations>(context, FFLocalizations)!;

  static List<String> languages() => ['en', 'pl'];

  static late SharedPreferences _prefs;
  static Future initialize() async =>
      _prefs = await SharedPreferences.getInstance();
  static Future storeLocale(String locale) =>
      _prefs.setString(_kLocaleStorageKey, locale);
  static Locale? getStoredLocale() {
    final locale = _prefs.getString(_kLocaleStorageKey);
    return locale != null && locale.isNotEmpty ? createLocale(locale) : null;
  }

  String get languageCode => locale.toString();
  String? get languageShortCode =>
      _languagesWithShortCode.contains(locale.toString())
          ? '${locale.toString()}_short'
          : null;
  int get languageIndex => languages().contains(languageCode)
      ? languages().indexOf(languageCode)
      : 0;

  String getText(String key) =>
      (kTranslationsMap[key] ?? {})[locale.toString()] ?? '';

  String getVariableText({
    String? enText = '',
    String? plText = '',
  }) =>
      [enText, plText][languageIndex] ?? '';

  static const Set<String> _languagesWithShortCode = {
    'ar',
    'az',
    'ca',
    'cs',
    'da',
    'de',
    'dv',
    'en',
    'es',
    'et',
    'fi',
    'fr',
    'gr',
    'he',
    'hi',
    'hu',
    'it',
    'km',
    'ku',
    'mn',
    'ms',
    'no',
    'pt',
    'ro',
    'ru',
    'rw',
    'sv',
    'th',
    'uk',
    'vi',
  };
}

/// Used if the locale is not supported by GlobalMaterialLocalizations.
class FallbackMaterialLocalizationDelegate
    extends LocalizationsDelegate<MaterialLocalizations> {
  const FallbackMaterialLocalizationDelegate();

  @override
  bool isSupported(Locale locale) => _isSupportedLocale(locale);

  @override
  Future<MaterialLocalizations> load(Locale locale) async =>
      SynchronousFuture<MaterialLocalizations>(
        const DefaultMaterialLocalizations(),
      );

  @override
  bool shouldReload(FallbackMaterialLocalizationDelegate old) => false;
}

/// Used if the locale is not supported by GlobalCupertinoLocalizations.
class FallbackCupertinoLocalizationDelegate
    extends LocalizationsDelegate<CupertinoLocalizations> {
  const FallbackCupertinoLocalizationDelegate();

  @override
  bool isSupported(Locale locale) => _isSupportedLocale(locale);

  @override
  Future<CupertinoLocalizations> load(Locale locale) =>
      SynchronousFuture<CupertinoLocalizations>(
        const DefaultCupertinoLocalizations(),
      );

  @override
  bool shouldReload(FallbackCupertinoLocalizationDelegate old) => false;
}

class FFLocalizationsDelegate extends LocalizationsDelegate<FFLocalizations> {
  const FFLocalizationsDelegate();

  @override
  bool isSupported(Locale locale) => _isSupportedLocale(locale);

  @override
  Future<FFLocalizations> load(Locale locale) =>
      SynchronousFuture<FFLocalizations>(FFLocalizations(locale));

  @override
  bool shouldReload(FFLocalizationsDelegate old) => false;
}

Locale createLocale(String language) => language.contains('_')
    ? Locale.fromSubtags(
        languageCode: language.split('_').first,
        scriptCode: language.split('_').last,
      )
    : Locale(language);

bool _isSupportedLocale(Locale locale) {
  final language = locale.toString();
  return FFLocalizations.languages().contains(
    language.endsWith('_')
        ? language.substring(0, language.length - 1)
        : language,
  );
}

final kTranslationsMap = <Map<String, Map<String, String>>>[
  // intro
  {
    '5ylumjtu': {
      'en': 'INSTASHARE',
      'pl': 'INSTASHARE',
    },
    '800koz5x': {
      'en': 'Home',
      'pl': '',
    },
  },
  // SignUp
  {
    'vbj3c1sf': {
      'en': 'Let’s Begin',
      'pl': '',
    },
    'jzz9u0t5': {
      'en': 'Full Name',
      'pl': '',
    },
    '03s64zna': {
      'en': 'Email',
      'pl': '',
    },
    'ytwn4csj': {
      'en': 'Password',
      'pl': '',
    },
    'px0bzj7s': {
      'en': 'Confirm Password',
      'pl': '',
    },
    '6ldae7ik': {
      'en': 'I have read all the ',
      'pl': '',
    },
    '0hbs1q7c': {
      'en': 'terms and conditions ',
      'pl': '',
    },
    'rhm3wvmx': {
      'en': 'or',
      'pl': '',
    },
    'wtfhp0c0': {
      'en': 'Sign Up with Google',
      'pl': '',
    },
    'hdcnvrwy': {
      'en': 'Enter your name is required',
      'pl': '',
    },
    'nyv45oks': {
      'en': 'Please choose an option from the dropdown',
      'pl': '',
    },
    'g44exss3': {
      'en': 'Enter your Email is required',
      'pl': '',
    },
    'eybuzpqw': {
      'en': 'Please choose an option from the dropdown',
      'pl': '',
    },
    'pmjd8rq1': {
      'en': 'Enter your Password is required',
      'pl': '',
    },
    'cla1zuyx': {
      'en': 'Please choose an option from the dropdown',
      'pl': '',
    },
    '68sy583n': {
      'en': 'Re-Enter your Password is required',
      'pl': '',
    },
    'o9opi9n0': {
      'en': 'Please choose an option from the dropdown',
      'pl': '',
    },
    'qr7abzp5': {
      'en': 'Home',
      'pl': '',
    },
  },
  // SignIn
  {
    'm7if0j7t': {
      'en': 'WELCOME BACK',
      'pl': 'WITAMY PONOWNIE',
    },
    '5q7u6yta': {
      'en': 'Email / User Name',
      'pl': 'E-mail / Nazwa użytkownika',
    },
    '4nopyfux': {
      'en': 'Password',
      'pl': 'Hasło',
    },
    '2fkuas6i': {
      'en': 'Remember me',
      'pl': 'Zapamiętaj mnie',
    },
    '2pz3hg3m': {
      'en': 'Forgot Password?',
      'pl': 'Zapomniałeś hasła?',
    },
    'v65tr0ks': {
      'en': 'reset',
      'pl': '',
    },
    'q7w04bby': {
      'en': 'or',
      'pl': 'Lub',
    },
    'n485fxwg': {
      'en': 'Sign In with Google',
      'pl': 'Zaloguj się za pomocą Google',
    },
    'fa3rla92': {
      'en': 'NO ACCOUNT?',
      'pl': 'BRAK KONTA?',
    },
    '6ub5r3zk': {
      'en': ' SIGN UP',
      'pl': 'ZAPISAĆ SIĘ',
    },
    '5b5lwkjv': {
      'en': 'Home',
      'pl': '',
    },
  },
  // forgotPassword
  {
    'b6s4vpv0': {
      'en': 'INSTASHARE',
      'pl': '',
    },
    'hnt0ovh4': {
      'en': 'Your Email Adress',
      'pl': '',
    },
    '14m55x2n': {
      'en': 'Enter you Email',
      'pl': '',
    },
    'w9yaco0l': {
      'en': 'Home',
      'pl': '',
    },
  },
  // userProfile
  {
    'sdlnlmt8': {
      'en': 'Company',
      'pl': '',
    },
    'njemo7yu': {
      'en': 'Country',
      'pl': '',
    },
    'ehy6tmu9': {
      'en': 'City',
      'pl': '',
    },
    'usm97rle': {
      'en': 'Phone Number',
      'pl': '',
    },
    '14irm3ia': {
      'en': 'Bio',
      'pl': '',
    },
    'hp0ycjos': {
      'en': 'Home',
      'pl': '',
    },
  },
  // home
  {
    'ywx6j0ba': {
      'en': 'Task Record ',
      'pl': '',
    },
    '5s0n96uj': {
      'en': 'No Task is added yet.',
      'pl': '',
    },
    'uvosktzh': {
      'en':
          'Today, you don\'t have any task. Set your tasks for daily reminders.',
      'pl':
          'Dzisiaj nie masz żadnego zadania. Ustaw swoje zadania jako codzienne przypomnienia.',
    },
    '5o6pjlxy': {
      'en': 'View all',
      'pl': 'Zobacz wszystko',
    },
    'w22ct48z': {
      'en': 'Team Record',
      'pl': '',
    },
    '7fflbdal': {
      'en': 'You don\'t have an unleft Business from any team.',
      'pl': '',
    },
    '0g1b70ut': {
      'en': 'You didn’t have any Team yet.',
      'pl': 'Nie masz jeszcze żadnego zespołu.',
    },
    'dhnwqbcr': {
      'en': 'Invite',
      'pl': 'Zapraszać',
    },
    'hh2z74fa': {
      'en': 'Invite',
      'pl': 'Zapraszać',
    },
    'vz5cwomf': {
      'en': 'Home',
      'pl': '',
    },
  },
  // connectGrow
  {
    'u2oje7qd': {
      'en': 'Connect and Grow',
      'pl': 'Połącz się i rozwijaj',
    },
    'spkgxu2u': {
      'en': 'Home',
      'pl': '',
    },
  },
  // search
  {
    '64hgobvj': {
      'en': 'Search here...',
      'pl': '',
    },
    'fn3n6vl9': {
      'en': 'Option 1',
      'pl': 'Option 1',
    },
    'pqwh84am': {
      'en': 'Recent',
      'pl': 'Ostatni',
    },
    'n0h82br5': {
      'en': 'See all',
      'pl': 'Zobacz wszystko',
    },
    'nufksuzp': {
      'en': 'Users Record',
      'pl': '',
    },
    'd0zyha1w': {
      'en': 'No record found',
      'pl': '',
    },
    'o0a85xfb': {
      'en': 'Recent Searches',
      'pl': '',
    },
    '67cdc7is': {
      'en': 'You have to recent search',
      'pl': '',
    },
    'lcvt0uln': {
      'en': 'Home',
      'pl': '',
    },
  },
  // profile
  {
    'g8bxpieo': {
      'en': 'Add varification badge',
      'pl': 'Dodaj odznakę weryfikacyjną',
    },
    '8dmmcafr': {
      'en': 'verify',
      'pl': '',
    },
    'oegznmzb': {
      'en': ' l ',
      'pl': '',
    },
    'hgh3y9lb': {
      'en': 'Message',
      'pl': '',
    },
    'lrfmtspq': {
      'en': 'invite',
      'pl': '',
    },
    'kvga58fx': {
      'en': 'Business Activities',
      'pl': 'Działalność gospodarcza',
    },
    'k1ivj2x5': {
      'en': 'Networking',
      'pl': '',
    },
    'j5v0bbzr': {
      'en': 'Contact Details',
      'pl': 'Dane kontaktowe',
    },
    'pli1b3r0': {
      'en': 'Contact Details',
      'pl': 'Dane kontaktowe',
    },
    '02bz8jkm': {
      'en': 'Project Portfolio',
      'pl': 'Portfolio projektów',
    },
    'xlzt61pb': {
      'en': 'Duration',
      'pl': '',
    },
    'boipt1x2': {
      'en': 'Budget',
      'pl': '',
    },
    'zf2205vm': {
      'en': 'Portfolio Record',
      'pl': '',
    },
    '5axz3zf5': {
      'en': 'Add portfolios ',
      'pl': '',
    },
    'zpjwe1uw': {
      'en': 'Duration',
      'pl': '',
    },
    '7gdfzefp': {
      'en': 'Budget',
      'pl': '',
    },
    '8soicpzq': {
      'en': 'Portfolio Record',
      'pl': '',
    },
    'tcz9xpej': {
      'en': 'Add portfolios ',
      'pl': '',
    },
    'lbfj2e1u': {
      'en': 'Work Experience',
      'pl': 'Doświadczenie zawodowe',
    },
    'g5rsvh12': {
      'en': 'Work Experience',
      'pl': '',
    },
    '90kmzwgk': {
      'en': 'Add your work experience',
      'pl': '',
    },
    'tox756f4': {
      'en': 'User Profile',
      'pl': '',
    },
    'wckn74tf': {
      'en': 'Loading......',
      'pl': '',
    },
    '01ejddfp': {
      'en': 'Home',
      'pl': '',
    },
  },
  // taskManagement
  {
    'jlr2j2by': {
      'en': 'This week',
      'pl': 'W tym tygodniu',
    },
    'x4lz9vrb': {
      'en': 'Task Record',
      'pl': '',
    },
    'k16218jm': {
      'en': 'No task added yet',
      'pl': '',
    },
    'emilu1iy': {
      'en': 'Task Management',
      'pl': 'Zarządzanie zadaniami',
    },
    'k5e8a8kb': {
      'en': 'Task',
      'pl': '',
    },
  },
  // teamManagement
  {
    'cu0j1yj2': {
      'en': 'Team Management',
      'pl': 'Zarządzanie zespołem',
    },
    '00g97d43': {
      'en': 'Team Record',
      'pl': '',
    },
    '52pntkyr': {
      'en': 'No team created yet',
      'pl': '',
    },
    '2ovx2ak4': {
      'en': 'Team',
      'pl': '',
    },
  },
  // adminPanel
  {
    '6b74velr': {
      'en': 'Number of Registered Users',
      'pl': 'Liczba zarejestrowanych użytkowników',
    },
    '1t9yngcf': {
      'en': 'Number of Premium Users',
      'pl': 'Liczba użytkowników Premium',
    },
    'ynnvm60y': {
      'en': 'Number of Created Teams',
      'pl': 'Liczba utworzonych zespołów',
    },
    'zqx23iv9': {
      'en': 'User Verification',
      'pl': 'Weryfikacja użytkownika',
    },
    'nijb44q6': {
      'en': 'Home',
      'pl': '',
    },
  },
  // addTask
  {
    '3upz6t89': {
      'en': 'What is to be done?',
      'pl': 'Co należy zrobić?',
    },
    'ad7rpgad': {
      'en': 'Due date',
      'pl': 'Termin wykonania',
    },
    'x0s7xr5y': {
      'en': 'Time',
      'pl': 'Czas',
    },
    'z9yi95e4': {
      'en': 'Field is required',
      'pl': '',
    },
    'ojnly9l9': {
      'en': 'Please choose an option from the dropdown',
      'pl': '',
    },
    '9a58msge': {
      'en': 'New Task',
      'pl': 'Zarządzanie zadaniami',
    },
    '7ztgwiz3': {
      'en': 'Home',
      'pl': '',
    },
  },
  // clientDataBase
  {
    'ry87nymz': {
      'en': 'Name',
      'pl': '',
    },
    'ys4lhneu': {
      'en': 'Phone number',
      'pl': '',
    },
    'ava37a1u': {
      'en': 'Email',
      'pl': '',
    },
    'jpmd9tah': {
      'en': 'Contact status',
      'pl': '',
    },
    'qx0aqvef': {
      'en': 'Name is required',
      'pl': '',
    },
    'wj0656y1': {
      'en': 'Please choose an option from the dropdown',
      'pl': '',
    },
    'wkkhtz8f': {
      'en': 'Phone number is required',
      'pl': '',
    },
    '8wkpzj28': {
      'en': 'Please choose an option from the dropdown',
      'pl': '',
    },
    '4tfpa3mp': {
      'en': 'Email is required',
      'pl': '',
    },
    '5m5zxhgq': {
      'en': 'Please choose an option from the dropdown',
      'pl': '',
    },
    'h24t7fqy': {
      'en': 'Contact status is required',
      'pl': '',
    },
    'kns393at': {
      'en': 'Please choose an option from the dropdown',
      'pl': '',
    },
    'ba18zwzx': {
      'en': 'Client database',
      'pl': 'Zarządzanie zadaniami',
    },
    'l4jdzrxf': {
      'en': 'Home',
      'pl': '',
    },
  },
  // contackDetails
  {
    'vlddipph': {
      'en': 'Add Phone Number',
      'pl': 'Dodaj numer telefonu',
    },
    'xyk23nl9': {
      'en': 'Add Email Address',
      'pl': 'Dodaj adres e-mail',
    },
    '0baxq7nx': {
      'en': 'Add Home Address',
      'pl': 'Dodaj adres domowy',
    },
    'p4mhs80n': {
      'en': 'Add Whatsapp Link',
      'pl': 'Dodaj link Whatsapp',
    },
    'o7wog82m': {
      'en': 'Add Linkedin link',
      'pl': 'Dodaj link Linkedin',
    },
    'idvbqm7h': {
      'en': 'Add Instagram link',
      'pl': 'Dodaj link do Instagrama',
    },
    'mragqo5x': {
      'en': 'Add Facebook link',
      'pl': 'Dodaj link do Facebooka',
    },
    'p1kt66tq': {
      'en': 'Field is required',
      'pl': '',
    },
    '8jemfsf5': {
      'en': 'Please choose an option from the dropdown',
      'pl': '',
    },
    '86uw4ckk': {
      'en': 'Field is required',
      'pl': '',
    },
    'omhwt2wp': {
      'en': 'Please choose an option from the dropdown',
      'pl': '',
    },
    '654h92t4': {
      'en': 'Field is required',
      'pl': '',
    },
    'k8iwrle2': {
      'en': 'Please choose an option from the dropdown',
      'pl': '',
    },
    'asytp8bq': {
      'en': 'Field is required',
      'pl': '',
    },
    'wa22bf7m': {
      'en': 'Please choose an option from the dropdown',
      'pl': '',
    },
    'io53u7i8': {
      'en': 'Field is required',
      'pl': '',
    },
    'jyqbjruf': {
      'en': 'Please choose an option from the dropdown',
      'pl': '',
    },
    'qvnf2ogb': {
      'en': 'Field is required',
      'pl': '',
    },
    '3e8izaws': {
      'en': 'Please choose an option from the dropdown',
      'pl': '',
    },
    '8keueqtb': {
      'en': 'Field is required',
      'pl': '',
    },
    'cq2blfc8': {
      'en': 'Please choose an option from the dropdown',
      'pl': '',
    },
    '2d8thdql': {
      'en': 'Home',
      'pl': '',
    },
  },
  // workExperience
  {
    'a4v2w4k8': {
      'en': 'Job Title',
      'pl': 'Stanowisko',
    },
    '7osda1el': {
      'en': 'Department',
      'pl': 'Dział',
    },
    'bf1a6i8y': {
      'en': 'Contract Duration',
      'pl': 'Czas trwania umowy',
    },
    'vtq299hy': {
      'en': 'Company',
      'pl': 'Firma',
    },
    'u8zhcge6': {
      'en': 'Other Details',
      'pl': 'Inne szczegóły',
    },
    'mv6e2cis': {
      'en': 'Field is required',
      'pl': '',
    },
    'ma211rrd': {
      'en': 'Please choose an option from the dropdown',
      'pl': '',
    },
    '0dvx2ffk': {
      'en': 'Field is required',
      'pl': '',
    },
    'hx4bomdh': {
      'en': 'Please choose an option from the dropdown',
      'pl': '',
    },
    'x5eyuuuu': {
      'en': 'Field is required',
      'pl': '',
    },
    'u080dy8h': {
      'en': 'Please choose an option from the dropdown',
      'pl': '',
    },
    'ekzv58hr': {
      'en': 'Field is required',
      'pl': '',
    },
    'r6zosfvb': {
      'en': 'Please choose an option from the dropdown',
      'pl': '',
    },
    'i09otkgv': {
      'en': 'Field is required',
      'pl': '',
    },
    '6m0dlxp3': {
      'en': 'Please choose an option from the dropdown',
      'pl': '',
    },
    'bxmmr3f8': {
      'en': 'Home',
      'pl': '',
    },
  },
  // addProject
  {
    'h9cjbw49': {
      'en': 'Job Title',
      'pl': '',
    },
    'b71jo59y': {
      'en': 'Budget',
      'pl': '',
    },
    '6xwo3yd5': {
      'en': 'Duration',
      'pl': '',
    },
    '86qftzyz': {
      'en': 'Select...',
      'pl': '',
    },
    'egtlh8dq': {
      'en': 'Search...',
      'pl': '',
    },
    'gn5w5376': {
      'en': 'Day',
      'pl': '',
    },
    '4rmuihgd': {
      'en': 'Week',
      'pl': '',
    },
    'h5v9i0oc': {
      'en': 'Month',
      'pl': '',
    },
    '26sawvzr': {
      'en': 'Implementation Details',
      'pl': '',
    },
    'ybemwsr2': {
      'en': 'Add photos',
      'pl': '',
    },
    'ig348uvv': {
      'en': 'Field is required',
      'pl': '',
    },
    'ekhqpnzu': {
      'en': 'Please choose an option from the dropdown',
      'pl': '',
    },
    'l84e1ipt': {
      'en': 'Field is required',
      'pl': '',
    },
    'rgb023m6': {
      'en': 'Please choose an option from the dropdown',
      'pl': '',
    },
    'c47rslzc': {
      'en': 'Field is required',
      'pl': '',
    },
    'z73nqvgi': {
      'en': 'Please choose an option from the dropdown',
      'pl': '',
    },
    'r4ghfjjv': {
      'en': 'Field is required',
      'pl': '',
    },
    'ke2bq6yp': {
      'en': 'Please choose an option from the dropdown',
      'pl': '',
    },
    'k3f2uavu': {
      'en': 'Home',
      'pl': '',
    },
  },
  // chat_2_Details
  {
    'i5qhdvjl': {
      'en': 'Home',
      'pl': '',
    },
  },
  // chat_2_main
  {
    '43gwwjgd': {
      'en': 'Group Chat',
      'pl': 'Group Chat',
    },
    '0oqgbowj': {
      'en': 'No Chats',
      'pl': '',
    },
    '78mw89ld': {
      'en':
          'You don\'t have any chats created, start a chat by tapping the button in the top right. ',
      'pl': '',
    },
    'n06tfpfc': {
      'en': 'Chats',
      'pl': '',
    },
  },
  // image_Details
  {
    '9fju8ihl': {
      'en': 'Home',
      'pl': '',
    },
  },
  // proPlan
  {
    'ycw6h091': {
      'en': 'Basic  Plan',
      'pl': '',
    },
    '232nfnky': {
      'en': 'No Credit Card Required',
      'pl': '',
    },
    '67d6z35h': {
      'en': 'Task Management',
      'pl': '',
    },
    '4bzbxjmz': {
      'en': 'Team Management ',
      'pl': '',
    },
    'a7k1333l': {
      'en': '(2 Teams and\n10 Team Members)',
      'pl': '',
    },
    'r2kduef6': {
      'en': 'Verified User Account',
      'pl': '',
    },
    'roq9v56h': {
      'en': 'Premium Plan',
      'pl': '',
    },
    '6ift614i': {
      'en': '\$15 Per Month',
      'pl': '',
    },
    'lmkd8jfk': {
      'en': 'Task Management',
      'pl': '',
    },
    'wtcvjg75': {
      'en': 'Team Management ',
      'pl': '',
    },
    '73m7t64h': {
      'en': '(10 Teams and\n100 Team Members)',
      'pl': '',
    },
    'y6kh6t05': {
      'en': 'Verified User Account',
      'pl': '',
    },
    '8wh7yr63': {
      'en': 'Business Profile',
      'pl': '',
    },
    'j6yjwxgc': {
      'en': 'Home',
      'pl': '',
    },
  },
  // addTeam
  {
    '6zu6qmxk': {
      'en': 'Team Name',
      'pl': 'Nazwa zespołu',
    },
    'jfdg4g8n': {
      'en': 'Field is required',
      'pl': '',
    },
    'qeucr3ja': {
      'en': 'Please choose an option from the dropdown',
      'pl': '',
    },
    'auyyb373': {
      'en': 'New Team',
      'pl': 'Nowy zespół',
    },
    'sby8bik8': {
      'en': 'Home',
      'pl': '',
    },
  },
  // businessActivites
  {
    '4257evrn': {
      'en': 'Business Activities',
      'pl': 'Nazwa zespołu',
    },
    '0tnf5a1u': {
      'en': 'Field is required',
      'pl': '',
    },
    'n4174wbn': {
      'en': 'Please choose an option from the dropdown',
      'pl': '',
    },
    'aor95zpn': {
      'en': 'Home',
      'pl': '',
    },
  },
  // setting
  {
    '6d7kfxy8': {
      'en': 'Language',
      'pl': 'Język',
    },
    'w975nite': {
      'en': 'Theme',
      'pl': 'Temat',
    },
  },
  // manageUser
  {
    '0pnbim2m': {
      'en': 'Remove',
      'pl': '',
    },
    'hro9j42e': {
      'en': 'User Record',
      'pl': '',
    },
    'fc7vyd9w': {
      'en': 'No Record Found',
      'pl': '',
    },
    'hgntdvlc': {
      'en': 'Select',
      'pl': '',
    },
    'ld8h6c2i': {
      'en': 'User Record',
      'pl': '',
    },
    'fyrtxqh6': {
      'en': 'No Record Found',
      'pl': '',
    },
    '16hzu8kq': {
      'en': 'User Record',
      'pl': '',
    },
    '8a5f3fr5': {
      'en': 'No Record Found',
      'pl': '',
    },
    '4uvmtxbe': {
      'en': 'User Record',
      'pl': '',
    },
    '767ca2ko': {
      'en': 'No Record Found',
      'pl': '',
    },
    'uxh25psq': {
      'en': 'User Record',
      'pl': '',
    },
    't9el9fi5': {
      'en': 'No Record Found',
      'pl': '',
    },
  },
  // teamDelete
  {
    'kh91s87z': {
      'en': 'What do you want?',
      'pl': 'Czego chcesz?',
    },
    'w727iqm1': {
      'en': 'Delete',
      'pl': 'Usuwać',
    },
    '52cle4s8': {
      'en': 'Edit Name',
      'pl': 'Edytuj nazwę',
    },
    '1r5ws339': {
      'en': 'See Members',
      'pl': 'Zobacz członków',
    },
  },
  // chat_DetailsOverlay
  {
    'z60mnblv': {
      'en': 'Chat Details',
      'pl': 'Szczegóły czatu',
    },
    'y2eiw6c6': {
      'en': 'Group Chat ID: ',
      'pl': 'Identyfikator czatu grupowego:',
    },
    'ccvqtkda': {
      'en': 'In this chat',
      'pl': 'W tym czacie',
    },
    'pe8kle3g': {
      'en': 'Close',
      'pl': '',
    },
  },
  // chat_ThreadComponent
  {
    '7d4aoa6t': {
      'en': 'Start typing here...',
      'pl': 'Zacznij pisać tutaj...',
    },
    'ot1qddva': {
      'en': '',
      'pl': '',
    },
    'gv26k28f': {
      'en': 'You must enter a message...',
      'pl': '',
    },
    '09186n8b': {
      'en': 'Please choose an option from the dropdown',
      'pl': '',
    },
  },
  // user_ListSmall
  {
    'phz50dx0': {
      'en': 'ME',
      'pl': '',
    },
  },
  // deleteDialog
  {
    'zakss8t1': {
      'en': 'Options',
      'pl': 'Opcje',
    },
    'uhc1lifb': {
      'en': 'Invite Users',
      'pl': 'Zaproś użytkowników',
    },
    '9j36x1nk': {
      'en': 'Delete Chat',
      'pl': 'Usuń czat',
    },
    'n1nrfon4': {
      'en': 'Confirm Delete',
      'pl': '',
    },
    'd52v7dqj': {
      'en': 'You can\'t undo this action.',
      'pl': '',
    },
    'p7drbrah': {
      'en': 'Delete',
      'pl': '',
    },
  },
  // sideNev
  {
    'rutezcoo': {
      'en': 'Dashboard',
      'pl': '',
    },
    'nxhubvfr': {
      'en': 'Chats',
      'pl': '',
    },
    'eyod2xko': {
      'en': 'Chats',
      'pl': '',
    },
    'epobancn': {
      'en': 'Projects',
      'pl': '',
    },
    'xjr9tadr': {
      'en': 'Settings',
      'pl': '',
    },
    'zjxf9fzg': {
      'en': 'Language',
      'pl': '',
    },
    'j0db5fgg': {
      'en': 'Theme',
      'pl': '',
    },
  },
  // adminSheet
  {
    'tatg3q5a': {
      'en': 'What is to be done?',
      'pl': 'Co należy zrobić?',
    },
    'p85gewtf': {
      'en': 'Due date',
      'pl': 'Termin wykonania',
    },
    'fj5cmy9r': {
      'en': 'Time',
      'pl': 'Czas',
    },
    'h4o5t272': {
      'en': 'Location',
      'pl': 'Czas',
    },
  },
  // adminMessage
  {
    'vzlpvr28': {
      'en': 'Date:',
      'pl': '',
    },
    'xk9d8v18': {
      'en': 'Time:',
      'pl': '',
    },
    'v65901od': {
      'en': 'Link/Location:',
      'pl': '',
    },
    '2n10v8jc': {
      'en': 'Looking forward to your responses! 🚀',
      'pl': '',
    },
  },
  // Miscellaneous
  {
    'sfi2ck1w': {
      'en': '',
      'pl': '',
    },
    'y1r8s1jm': {
      'en': '',
      'pl': '',
    },
    'jdvm23oc': {
      'en': '',
      'pl': '',
    },
    '5f19yzzo': {
      'en': '',
      'pl': '',
    },
    'kqxturci': {
      'en': '',
      'pl': '',
    },
    '2rvter2f': {
      'en': '',
      'pl': '',
    },
    'mbeanzav': {
      'en': '',
      'pl': '',
    },
    '2gi4kl2v': {
      'en': '',
      'pl': '',
    },
    'b2g25fes': {
      'en': '',
      'pl': '',
    },
    '0s3lrk03': {
      'en': '',
      'pl': '',
    },
    'b55u8j4z': {
      'en': '',
      'pl': '',
    },
    'r58qq6zk': {
      'en': '',
      'pl': '',
    },
    'w827p3ik': {
      'en': '',
      'pl': '',
    },
    's68s8jz5': {
      'en': '',
      'pl': '',
    },
    'wwzx6xni': {
      'en': '',
      'pl': '',
    },
    '4cq33mz2': {
      'en': '',
      'pl': '',
    },
    '4b21btoy': {
      'en': '',
      'pl': '',
    },
    '4k9n5m22': {
      'en': '',
      'pl': '',
    },
    'ppgejayy': {
      'en': '',
      'pl': '',
    },
    'q36mcut5': {
      'en': '',
      'pl': '',
    },
    'zum9zopx': {
      'en': '',
      'pl': '',
    },
    'zdefrbie': {
      'en': '',
      'pl': '',
    },
    'fo3j02bb': {
      'en': '',
      'pl': '',
    },
    'b9v8qy23': {
      'en': '',
      'pl': '',
    },
    '2kwrbkbs': {
      'en': '',
      'pl': '',
    },
    'qgpt93jx': {
      'en': '',
      'pl': '',
    },
    '5l0tnlii': {
      'en': '',
      'pl': '',
    },
    'zy8so7ix': {
      'en': '',
      'pl': '',
    },
  },
].reduce((a, b) => a..addAll(b));
