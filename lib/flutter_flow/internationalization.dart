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

  static List<String> languages() => ['ar', 'en', 'tr'];

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
    String? arText = '',
    String? enText = '',
    String? trText = '',
  }) =>
      [arText, enText, trText][languageIndex] ?? '';

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
  // signup
  {
    'fe145b2w': {
      'ar': 'انشاء حساب جديد',
      'en': 'Create a new account',
      'tr': 'Yeni bir hesap oluştur',
    },
    'lq1syswq': {
      'ar': 'اهلا وسهلا بكم في منصة مية التعليمية',
      'en': 'Welcome to the hundred educational platform',
      'tr': 'Yüz eğitim platformuna hoş geldiniz',
    },
    'r5w0vrk1': {
      'ar': 'الأسم الثلاثي',
      'en': 'Full Name',
      'tr': 'Ad Soyad',
    },
    'abdnt3ta': {
      'ar': 'البريد الالكتروني',
      'en': 'E-mail',
      'tr': 'E-posta',
    },
    'cg5ds3cp': {
      'ar': 'الرقم السري',
      'en': 'password',
      'tr': 'Şifre',
    },
    'siwpvf8i': {
      'ar': 'اعادة ادخال الرقم السري',
      'en': 'Re-enter the password',
      'tr': 'Şifreyi tekrar girin',
    },
    'l3bz1yjl': {
      'ar': ' ',
      'en': '',
      'tr': '',
    },
    'c2a57uth': {
      'ar': '* الرمز غير متطابق',
      'en': '*The code does not match',
      'tr': '*Kod eşleşmiyor',
    },
    'yjnyab9j': {
      'ar': 'التالي',
      'en': 'Next',
      'tr': 'İleri',
    },
    '16n9w1ix': {
      'ar': 'هل لديك حساب بالفعل؟ ',
      'en': 'Do you already have an account?',
      'tr': 'zaten bir hesabın var mı?',
    },
    '5zhh5bgr': {
      'ar': 'تسجيل الدخول  ',
      'en': 'sign in',
      'tr': 'Giriş yap',
    },
    'yzd1d3df': {
      'ar': 'الصفحة الرئيسية',
      'en': 'Homepage',
      'tr': 'Ana sayfa',
    },
  },
  // signin
  {
    '7t0at2e8': {
      'ar': 'تسجيل الدخول',
      'en': 'sign in',
      'tr': 'Giriş yap',
    },
    'vurizlp4': {
      'ar': 'مرحبا بعودتك .. أمامك خطوة واحدة نحو القمة',
      'en': 'Welcome back.. You have one step ahead of you towards the summit',
      'tr': 'Tekrar hoş geldiniz.. Zirveye doğru bir adım kaldı',
    },
    'ta0a5vvm': {
      'ar': 'البريد الالكتروني',
      'en': 'E-mail',
      'tr': 'E-posta',
    },
    'hynbqo7m': {
      'ar': 'الرقم السري',
      'en': 'password',
      'tr': 'Şifre',
    },
    'e5a7jh1s': {
      'ar': 'تسجيل الدخول',
      'en': 'sign in',
      'tr': 'Giriş yap',
    },
    '6wuyuy1b': {
      'ar': 'هل انت جديد في المنصة ؟ ',
      'en': 'Are you new to the platform?',
      'tr': 'Platformda yeni misiniz?',
    },
    'shvznrbo': {
      'ar': 'اشترك الان',
      'en': 'subscribe now',
      'tr': 'şimdi kayıt ol',
    },
    'ztsxpqgw': {
      'ar': 'الصفحة الرئيسية',
      'en': 'Homepage',
      'tr': 'Ana sayfa',
    },
  },
  // profile_details
  {
    '2varwxta': {
      'ar': 'معلوماتي الشخصية',
      'en': 'My personal information',
      'tr': 'kişisel bilgilerim',
    },
    'iczydkn5': {
      'ar': 'يرجى التعريف عن نفسك  :-)',
      'en': 'Please introduce yourself :-)',
      'tr': 'Lütfen kendini tanıt :-)',
    },
    'mwcttqjc': {
      'ar': 'رقم هاتف الطالب',
      'en': 'Student phone number',
      'tr': 'Öğrenci telefon numarası',
    },
    'rr2epl6x': {
      'ar': 'رقم هاتف ولي الامر',
      'en': 'Parent\'s phone number',
      'tr': 'Ebeveynin telefon numarası',
    },
    'n79olv9k': {
      'ar': 'يرجى اختيار المحافظة',
      'en': 'Please select a governorate',
      'tr': 'Lütfen bir valilik seçin',
    },
    'nqeemvsb': {
      'ar': 'بحث عن مادة معينة',
      'en': 'Search for an item...',
      'tr': 'Bir öğeyi arayın...',
    },
    'l9uxitvr': {
      'ar': 'كركوك',
      'en': 'Kirkuk',
      'tr': 'Kerkük',
    },
    '04pz4zec': {
      'ar': 'بغداد',
      'en': 'Baghdad',
      'tr': 'Bağdat',
    },
    'rx4rh3q2': {
      'ar': 'دهوك',
      'en': 'Dohuk',
      'tr': 'Duhok',
    },
    '3w5lsdik': {
      'ar': 'اربيل',
      'en': 'Erbil',
      'tr': 'Erbil',
    },
    'ed32a7ab': {
      'ar': 'نينوى',
      'en': 'Nineveh',
      'tr': 'Ninova',
    },
    '6krgqr97': {
      'ar': 'السليمانية',
      'en': 'Sulaymaniyah',
      'tr': 'Süleymaniye',
    },
    'mzhyyjbr': {
      'ar': 'صلاح الدين',
      'en': 'Salahaddin',
      'tr': 'Selahaddin',
    },
    '00in5ais': {
      'ar': 'ديالى',
      'en': 'Diyala',
      'tr': 'Diyala',
    },
    'mrtp0re0': {
      'ar': 'الانبار',
      'en': 'Anbar',
      'tr': 'Anbar',
    },
    'iiyppv0u': {
      'ar': 'واسط',
      'en': 'Wasit',
      'tr': 'Vasit',
    },
    '7rst8vbi': {
      'ar': 'بابل',
      'en': 'Babylon',
      'tr': 'Babil',
    },
    'nulkg14w': {
      'ar': 'كربلاء',
      'en': 'Karbala',
      'tr': 'Kerbela',
    },
    'qho7nzlo': {
      'ar': 'النجف',
      'en': 'Najaf',
      'tr': 'Necef',
    },
    'gch3siyl': {
      'ar': 'الديوانية',
      'en': 'Diwaniyah',
      'tr': 'Divaniye',
    },
    'wstlo6cp': {
      'ar': 'ميسان',
      'en': 'Maysan',
      'tr': 'Meysan',
    },
    'c662ui3s': {
      'ar': 'ذي قار',
      'en': 'Dhi Qar',
      'tr': 'Dikar',
    },
    'fcoiwkjg': {
      'ar': 'المثنى',
      'en': 'Double',
      'tr': 'Mutena',
    },
    'fdwj0kxw': {
      'ar': 'البصرة',
      'en': 'Basra',
      'tr': 'Basra',
    },
    'gyijcoig': {
      'ar': 'عنوان السكن / اقرب نقطة دالة',
      'en': 'Residential address/nearest point',
      'tr': 'İkamet adresi/en yakın nokta',
    },
    '8fahd9l4': {
      'ar': 'اكمال التسجيل',
      'en': 'Complete registration',
      'tr': 'Kaydı tamamla',
    },
    'dixxj8wa': {
      'ar': 'الصفحة الرئيسية',
      'en': 'Homepage',
      'tr': 'Ana sayfa',
    },
  },
  // verify_email
  {
    'iftzhse4': {
      'ar': 'تم تأكيد حسابي بالفعل ',
      'en': 'My account has already been confirmed',
      'tr': 'Hesabım  onaylandım',
    },
    '90n857fb': {
      'ar': 'تأكيد البريد الالكتروني',
      'en': 'verify your e-mail',
      'tr': 'Eposta adresinizi doğrulayın',
    },
    '1byow9eo': {
      'ar': 'يرجى تأكيد حسابك',
      'en': 'Please confirm your account',
      'tr': 'Lütfen hesabınızı onaylayın',
    },
    'k0v9ohhx': {
      'ar':
          'لقد أرسلنا رابط تاكيد بريدك الالكتروني\nيرجى التحقق من صندوق البريد الوارد',
      'en':
          'We have sent a confirmation link to your email\nPlease check your inbox',
      'tr':
          'E-postanıza bir onay bağlantısı gönderdik\nLütfen gelen kutunuzu kontrol edin',
    },
    'at6w63by': {
      'ar': 'الصفحة الرئيسية',
      'en': 'Homepage',
      'tr': 'Ana sayfa',
    },
  },
  // emal_vrifided_done
  {
    'azbhuqv1': {
      'ar': 'هيا لنبدأ',
      'en': 'Lets start',
      'tr': 'Hadi başlayalım',
    },
    's2iv3l2n': {
      'ar': 'مبروك .. تم تسجيل حسابك',
      'en': 'Congratulations.. your account has been registered',
      'tr': 'Tebrikler.. hesabınız kaydedildi',
    },
    '8gw59srq': {
      'ar': 'النجاح لا يجد الشخص، بل الشخص هو الذي يجد النجاح',
      'en':
          'Success does not find the person, it is the person who finds success',
      'tr': 'Başarı kişiyi bulmaz, başarıyı bulan kişidir',
    },
    '4gr70q6w': {
      'ar': 'الصفحة الرئيسية',
      'en': 'Homepage',
      'tr': 'Ana sayfa',
    },
  },
  // onboarding
  {
    'm4bvt983': {
      'ar': 'مرحبا بك في منصة مية التعليمية',
      'en': 'Welcome to the Hundred educational platform',
      'tr': 'Yüz eğitim platformuna hoş geldiniz',
    },
    '39px2bnz': {
      'ar':
          'كل ما يحتاجه الطالب في تطبيق واحد\nمحاضرات فيديو مسجلة / امتحانات يومية وتراكمية / فقرة السؤال والجواب مع المدرس',
      'en':
          'Everything a student needs in one application\nRecorded video lectures / daily and cumulative exams / question and answer section with the teacher',
      'tr':
          'Bir öğrencinin ihtiyacı olan her şey tek uygulamada\nKaydedilmiş video dersler / günlük ve toplu sınavlar / öğretmenle soru-cevap bölümü',
    },
    'tj2bb918': {
      'ar': 'متعدد اللغات',
      'en': 'multilanguage',
      'tr': 'Birden fazla dil seçeneği',
    },
    '4z37oh90': {
      'ar':
          'اول منصة في العراق من حيث تعدد اللغات , حيث يحتوي على 4 لغات وهي الانكليزية والعربية والتركية والكردية لضمان اقصى استفادة للطالب',
      'en':
          'The first platform in Iraq in terms of multilingualism, as it contains 4 languages,  English, Arabic, Turkish, and Kurdish, to ensure maximum benefit for the student.',
      'tr':
          'Öğrenciye maksimum fayda sağlayacak şekilde İngilizce, Arapça, Türkçe ve Kürtçe olmak üzere 4 dili bünyesinde barındıran çok dillilik açısından Irak\'taki ilk platform.',
    },
    'tv8v1jha': {
      'ar': 'فيديوات بدقة عالية وصوت نقي',
      'en': 'High resolution videos and clear sound',
      'tr': 'Yüksek Kaliteli videolar ve net ses',
    },
    'h312b9pw': {
      'ar':
          'جميع المحاضرات مسجلة باجهزة ذات تقنيات عالية لضمان جودة الصورة ووضوح الصوت لايصال المحتوى الى الطالب بافضل ما يمكن ',
      'en':
          'All lectures are recorded with high-tech devices to ensure image quality and sound clarity to deliver the content to the student as best as possible.',
      'tr':
          'İçeriğin öğrenciye en iyi şekilde ulaştırılması amacıyla görüntü kalitesi ve ses netliği sağlanacak şekilde tüm dersler yüksek teknolojiye sahip cihazlarla kayıt altına alınmaktadır.',
    },
    'j92u45ta': {
      'ar': 'حماية عالية لمحتوى المدرس/المدرب',
      'en': 'High protection of teacher/trainer content',
      'tr': 'Öğretmen/eğitimci içeriğinin yüksek düzeyde korunması',
    },
    'a8b2k6rm': {
      'ar':
          'نظام تشفير عالي للفيديوات المخزنة بحيث لايمكن مشاركتها او تسجيلها لضمان حقوق النشر',
      'en':
          'A high encryption system for stored videos so that they cannot be shared or recorded to ensure copyright',
      'tr':
          'Telif hakkını garanti altına almak amacıyla, paylaşılamayacak veya kaydedilemeyecek şekilde saklanan videolar için yüksek bir şifreleme sistemi',
    },
    'apji1as8': {
      'ar': 'الصفحة الرئيسية',
      'en': 'Home',
      'tr': 'Ana sayfa',
    },
  },
  // dashboard2
  {
    'jpjn7875': {
      'ar': 'مرحبا بعودتك مجددا',
      'en': 'Welcome back',
      'tr': 'tekrar hoşgeldiniz',
    },
    'n82anv9s': {
      'ar': 'المواد الدراسية',
      'en': 'Subjects',
      'tr': 'Konular',
    },
    'd8bmwut0': {
      'ar': 'ابرز الدورات',
      'en': 'Top courses',
      'tr': 'En öne çıkan kurslar',
    },
    'rwfg9v8i': {
      'ar': ' / د.ع',
      'en': '/IQD',
      'tr': '/ Irak dinarı',
    },
    'dkg0aj8i': {
      'ar': 'محمد ماجد حميد',
      'en': '',
      'tr': '',
    },
    '4ltn025l': {
      'ar': 'ابرز المدرسين',
      'en': 'Top teachers',
      'tr': 'En çok beğenilen öğretmenler',
    },
    '5tsbgrn0': {
      'ar': 'Home',
      'en': 'Home',
      'tr': 'Ev',
    },
  },
  // stages
  {
    'uzyf2ofr': {
      'ar': 'من فضلك !\nيرجى اختيار المرحلة الدراسية',
      'en': 'please !\nPlease select the academic level',
      'tr': 'lütfen !\nLütfen akademik seviyeyi seçin',
    },
  },
  // lessonlist
  {
    '2m48z7aq': {
      'ar': 'محاضرة',
      'en': 'lecture',
      'tr': ' ders',
    },
    'cbjkkxox': {
      'ar': 'مكتملة',
      'en': 'Completed',
      'tr': 'Tamamlandı',
    },
    'bwvmyti7': {
      'ar': 'غير مكتلمة',
      'en': 'Uncompleated',
      'tr': 'Henüz tamamlanmadı',
    },
    'w70wh8ki': {
      'ar': 'Home',
      'en': 'Home',
      'tr': 'Ev',
    },
  },
  // course_details
  {
    'ykmq5p2a': {
      'ar': 'اضافة الى المفضلة',
      'en': 'Add to favorites',
      'tr': 'Favorilere ekle',
    },
    'ojfj3jer': {
      'ar': '   / دينار عراقي',
      'en': '/ IQD',
      'tr': '/ Irak Dinarı',
    },
    'mqiq0qdx': {
      'ar': '/   أ.',
      'en': '/ أ. ',
      'tr': '/ أ. ',
    },
    'l2l3uv3z': {
      'ar': 'Half Day Training',
      'en': 'Half day training',
      'tr': 'Yarım günlük eğitim',
    },
    'd2ruposf': {
      'ar': 'الاشتراك في الدورة',
      'en': 'Subscribe to the course',
      'tr': 'Kursa katıl',
    },
    'rokaadmd': {
      'ar': 'تم الاشتراك في الدورة',
      'en': 'The course has been registered',
      'tr': 'Kursa kayıt tamamlandı',
    },
    'j0dpndqj': {
      'ar': 'عن الدورة',
      'en': 'About the course',
      'tr': 'Kurs hakkında',
    },
    'fl7ilsbt': {
      'ar': 'مدرس المادة',
      'en': 'Subject teacher',
      'tr': 'Konu öğretmeni',
    },
    'u2m7qf7v': {
      'ar': 'المحتوى',
      'en': 'Content',
      'tr': 'İçerik',
    },
    '4ttr04p8': {
      'ar': 'المحاضرات المدفوعة',
      'en': 'Paid lectures',
      'tr': 'Ücretli dersler',
    },
    'lsbw9w88': {
      'ar': 'المحاضرات التجريبية',
      'en': 'Free lectures',
      'tr': 'Ücretsiz dersler',
    },
    'xq39czhz': {
      'ar': 'ملاحظات',
      'en': 'Notes',
      'tr': 'Notlar',
    },
    'mai35v29': {
      'ar': 'هذه الخاصية مفعلة فقط للطلبة المشتركين',
      'en': 'This feature is only activated for registered students',
      'tr': 'Bu özellik yalnızca kayıtlı öğrenciler için etkinleştirilir',
    },
    '1kwe82nu': {
      'ar': 'Home',
      'en': 'Home',
      'tr': 'Ev',
    },
  },
  // lesson_details
  {
    'pcaq2cjs': {
      'ar': 'س / ج',
      'en': 'Q/A',
      'tr': 'S/C',
    },
    '54n8rb79': {
      'ar': 'رد',
      'en': 'reply',
      'tr': 'cevap',
    },
    'vp33lbm8': {
      'ar': 'مفات الدرس',
      'en': 'Lesson notes',
      'tr': 'Ders notları',
    },
    'v5fzbbj9': {
      'ar': 'اضغط هنا لفتح الملف',
      'en': 'Click here to open the file',
      'tr': 'Dosyayı açmak için burayı tıklayın',
    },
    '94ie7sev': {
      'ar': 'الملاحظات',
      'en': 'Notes',
      'tr': 'Notlar',
    },
    'btbpkds4': {
      'ar': 'ارسال',
      'en': 'send',
      'tr': 'Gönder',
    },
    'otpffder': {
      'ar': 'أسأل سؤالك هنا .. ',
      'en': 'Ask your question here..',
      'tr': 'Sorunuzu buradan sorun..',
    },
    'ewmjlyeu': {
      'ar': 'الصفحة الرئيسية',
      'en': 'Home',
      'tr': 'Ana sayfa',
    },
  },
  // my_orders
  {
    'txgwq819': {
      'ar': 'دورات الخاصة بي',
      'en': 'My courses',
      'tr': 'Kurslarım',
    },
    'jgulmw4w': {
      'ar': 'مزامنة الدورات',
      'en': 'Synchronize courses',
      'tr': 'Kursları senkronize et',
    },
    'sqb0j3un': {
      'ar': 'الصفحة الرئيسية',
      'en': 'Home',
      'tr': 'Ana sayfa',
    },
  },
  // myorders_section
  {
    'ovjsjaeh': {
      'ar': 'محتويات الدورة',
      'en': 'Course contents',
      'tr': 'Ders içeriği',
    },
    '52dxxa40': {
      'ar': 'عن الدورة',
      'en': 'About the course',
      'tr': 'Kurs hakkında',
    },
    'vbp0xsyx': {
      'ar': 'مدرس المادة',
      'en': 'Subject teacher',
      'tr': 'Konu öğretmeni',
    },
    'nkafcqzr': {
      'ar': 'المحتوى',
      'en': 'Content',
      'tr': 'İçerik',
    },
    '2ui08qrn': {
      'ar': 'الصفحة الرئيسية',
      'en': 'Home',
      'tr': 'Ana sayfa',
    },
  },
  // free_course_page
  {
    '4q4upgbo': {
      'ar': 'س / ج',
      'en': 'Q/A',
      'tr': 'S/C',
    },
    '2anojjmq': {
      'ar': 'هذه الخاصية مفعلة فقط للطلبة المشتركين',
      'en': 'This feature is only activated for registered students',
      'tr': 'Bu özellik yalnızca kayıtlı öğrenciler için etkinleştirilir',
    },
    'hvgdsamh': {
      'ar': 'ملفات الدرس',
      'en': 'Lesson files',
      'tr': 'Ders dosyaları',
    },
    'm572kx7j': {
      'ar': 'هذه الخاصية مفعلة فقط للطلبة المشتركين',
      'en': 'This feature is only activated for registered students',
      'tr': 'Bu özellik yalnızca kayıtlı öğrenciler için etkinleştirilir',
    },
    'j1qmaqh2': {
      'ar': 'ملاحظات',
      'en': 'comments',
      'tr': 'yorumlar',
    },
    'wf0pgwvm': {
      'ar': 'هذه الخاصية مفعلة فقط للطلبة المشتركين',
      'en': 'This feature is only activated for registered students',
      'tr': 'Bu özellik yalnızca kayıtlı öğrenciler için etkinleştirilir',
    },
    '2q9mgswj': {
      'ar': 'الصفحة الرئيسية',
      'en': 'Home',
      'tr': 'Ana sayfa',
    },
  },
  // payment_done
  {
    '30m99bgn': {
      'ar': 'عملية دفع ناجحة',
      'en': 'Successful payment',
      'tr': 'Başarılı ödeme',
    },
    'rvmws9se': {
      'ar':
          'مبروك .. تم الأشتراك في الدورة\nيمكنك متابعة الدورة في صفحة الدورات الخاصة بي',
      'en':
          'Congratulations.. You have participated in the course\nYou can follow the course on my courses page',
      'tr':
          'Tebrikler.. Kursa katıldınız\nDersleri kurslarım sayfasından takip edebilirsiniz.',
    },
    'm11vueur': {
      'ar': 'هيا لنبدأ',
      'en': 'Lets start',
      'tr': 'Hadi başlayalım',
    },
    '3nqvnz2h': {
      'ar': 'Home',
      'en': 'Home',
      'tr': 'Ev',
    },
  },
  // subject_teacher
  {
    'hzy6em03': {
      'ar': '  د.ع',
      'en': 'IQD',
      'tr': 'Irak dinarı',
    },
    's8y5y67o': {
      'ar': 'Home',
      'en': 'Home',
      'tr': 'Ev',
    },
  },
  // dashboard_login_off
  {
    '2rduyl71': {
      'ar': 'اضغط هنا لتسجل الدخول',
      'en': 'Click here to log in',
      'tr': 'Giriş yapmak için buraya tıklayın',
    },
    '1cub2ivt': {
      'ar': 'اهلا وسهلا بك عزيزي الزائر',
      'en': 'Welcome, dear visitor',
      'tr': 'Hoş geldiniz sevgili ziyaretçi',
    },
    'tzcquu3j': {
      'ar': 'المواد الدراسية',
      'en': 'Subjects',
      'tr': 'Konular',
    },
    'd7fefqnl': {
      'ar': 'ابرز الدورات',
      'en': 'Top courses',
      'tr': 'En öne çıkan kurslar',
    },
    '6799jfh2': {
      'ar': ' / د.ع',
      'en': '/ IQD',
      'tr': '/ Irak Dinarı',
    },
    'dmpqmt87': {
      'ar': 'ابرز المدرسين',
      'en': 'Top teachers',
      'tr': 'En seçkin öğretmenler',
    },
    '7rztqzvy': {
      'ar': 'Home',
      'en': 'Home',
      'tr': 'Ev',
    },
  },
  // course_logout_page
  {
    '1lo0tz90': {
      'ar': 'اضافة الى المفضلة',
      'en': 'Add to favorites',
      'tr': 'Favorilere ekle',
    },
    'x899fz1z': {
      'ar': '/ دينار عراقي',
      'en': '/ Iraqi Dinar',
      'tr': '/ Irak Dinarı',
    },
    '71gpevff': {
      'ar': '/ أ.',
      'en': ' /Mr/Mrs.',
      'tr': ' / O.',
    },
    'wiiyezx4': {
      'ar': 'Half Day Training',
      'en': 'Half day training',
      'tr': 'Yarım günlük eğitim',
    },
    'mz4s5rcj': {
      'ar': 'الاشتراك في الدورة',
      'en': 'Subscribe to the course',
      'tr': 'Kursa abone olun',
    },
    'u53f5dm6': {
      'ar': 'عن الدورة',
      'en': 'About the course',
      'tr': 'Kurs hakkında',
    },
    'u766m7kn': {
      'ar': 'مدرس المادة',
      'en': 'Subject teacher',
      'tr': 'Konu öğretmeni',
    },
    'fmb1k6qj': {
      'ar': 'المحتوى',
      'en': 'Content',
      'tr': 'İçerik',
    },
    '4i2cwtt3': {
      'ar': 'المحاضرات المجانية',
      'en': 'Free lectures',
      'tr': 'ücretsiz dersler',
    },
    '1p80yxpm': {
      'ar': 'المحاضرات المدفوعة',
      'en': 'Paid lectures',
      'tr': 'ücretli dersler',
    },
    'elfkjc3r': {
      'ar': 'ملاحظات',
      'en': 'Notes',
      'tr': 'Notlar',
    },
    '7xoheobo': {
      'ar': '',
      'en': '',
      'tr': '',
    },
    'php3ozvr': {
      'ar': 'Home',
      'en': 'Home',
      'tr': 'Ev',
    },
  },
  // subject_techer_logout
  {
    'j50i6f99': {
      'ar': '  د.ع',
      'en': 'IQD',
      'tr': 'Irak dinarı',
    },
    'pz9m0bku': {
      'ar': 'Home',
      'en': 'Home',
      'tr': 'Ev',
    },
  },
  // stages_logout
  {
    'aohffu3w': {
      'ar': 'من فضلك !\nيرجى اختيار المرحلة الدراسية',
      'en': 'please !\nselect the academic level',
      'tr': 'lütfen !\nakademik seviyeyi seçin',
    },
  },
  // favourite
  {
    'p489ag06': {
      'ar': 'المفضلة',
      'en': 'Favorite',
      'tr': 'Favori',
    },
    'vgfd2d8c': {
      'ar': 'ازالة من المفضلة',
      'en': 'Remove from favorites',
      'tr': 'Favorilerden çıkar',
    },
    'b0bsvxys': {
      'ar': 'Home',
      'en': 'Home',
      'tr': 'Ev',
    },
  },
  // my_profile
  {
    'nvnp8ho5': {
      'ar': 'صفحتي الشخصية',
      'en': 'my personal page',
      'tr': 'kişisel sayfam',
    },
    'eql7yb6c': {
      'ar': 'المحفظة',
      'en': 'Wallet',
      'tr': 'Cüzdanım',
    },
    '57n3z2re': {
      'ar': 'د.ع',
      'en': 'IQD',
      'tr': 'Irak dinarı',
    },
    'v1x7read': {
      'ar': 'تعديل المرحلة الدراسية',
      'en': 'Change the academic stage',
      'tr': 'akademik seviyeyi Değiştir',
    },
    'vxk4rhox': {
      'ar': 'اللغة',
      'en': 'Language',
      'tr': 'dil',
    },
    'blhrndbw': {
      'ar': 'وضع النهار',
      'en': 'Light Mode',
      'tr': 'Işık Modu',
    },
    'pssvh98w': {
      'ar': 'وضع المظلم',
      'en': 'Dark Mode',
      'tr': 'Karanlık Mod',
    },
    '3np5h3yd': {
      'ar': 'تعديل المعلومات الشخصية',
      'en': 'Edit personal information',
      'tr': 'Kişisel bilgileri değiştirin',
    },
    'v9pbo17w': {
      'ar': 'تغيير الرقم السري',
      'en': 'Change the password',
      'tr': 'Şifreyi değiştir',
    },
    '7rc86y55': {
      'ar': 'الخصوصية',
      'en': 'Privacy & Terms',
      'tr': 'Gizlilik',
    },
    '90e1po5k': {
      'ar': 'الشروط والاحكام',
      'en': 'terms & conditions',
      'tr': 'Şartlar ve kanunlar',
    },
    'zat6vogs': {
      'ar': 'تسجيل الخروج',
      'en': 'sign out',
      'tr': 'çıkış Yap',
    },
    'xzwketam': {
      'ar': 'تسجيل الدخول',
      'en': 'sign in',
      'tr': 'Giriş yap',
    },
  },
  // recharge_wallet
  {
    '5dsf84w5': {
      'ar': 'تعبئة المحفظة',
      'en': 'Fill the wallet',
      'tr': 'Cüzdanı doldur',
    },
    'zl47ffn6': {
      'ar': 'رصيد حسابك هو :',
      'en': 'Your account balance is:',
      'tr': 'Hesap bakiyeniz:',
    },
    'pf0gwjva': {
      'ar': 'دينار عراقي',
      'en': 'Iraqi Dinar',
      'tr': 'Irak Dinarı',
    },
    'arggyhy7': {
      'ar': 'ادخل الكود هنا ...',
      'en': 'Enter the code here...',
      'tr': 'Kodu buraya girin...',
    },
    '4p3n3imj': {
      'ar': 'شحن',
      'en': 'Charge',
      'tr': 'Doldur',
    },
    'ao481lag': {
      'ar': 'Home',
      'en': 'Home',
      'tr': 'Ev',
    },
  },
  // wallet_charge_done
  {
    'mmm0j9o7': {
      'ar': 'تم الشحن بنجاح',
      'en': 'Charged successfully',
      'tr': 'Başarıyla Dolduruldu',
    },
    'h2okc0zf': {
      'ar':
          'يمكنك الان المتابعة والمشاركة في الدورات\nنتمنى لك النجاح والتوفيق',
      'en':
          'You can now follow and participate in the courses\nWe wish you success and success',
      'tr':
          'Artık dersleri takip edebilir ve katılabilirsiniz.\nSize başarılar diliyoruz',
    },
    'vsibc2cc': {
      'ar': 'متابعة',
      'en': 'tracking',
      'tr': 'İleri',
    },
    'qdld4kmu': {
      'ar': 'Home',
      'en': 'Home',
      'tr': 'Ev',
    },
  },
  // changestages
  {
    '23n8a6ak': {
      'ar': 'من فضلك !\nيرجى اختيار المرحلة الدراسية',
      'en': 'please !\nselect the academic level',
      'tr': 'lütfen !\nakademik seviyeyi seçin',
    },
  },
  // edit_profile
  {
    '815xwsvp': {
      'ar': 'تحديث المعلومات',
      'en': 'Update information',
      'tr': 'Bilgileri güncelle',
    },
    'qxw78ldu': {
      'ar': 'صورة الملف الشخصي',
      'en': 'profile picture',
      'tr': 'profil fotoğrafı',
    },
    'spgeszvl': {
      'ar': 'تحميل صورة',
      'en': 'Upload an image',
      'tr': ' görüntü yükle',
    },
    'sqmlh273': {
      'ar': 'الاسم الثلاثي',
      'en': 'Full Name',
      'tr': 'Ad Soyad',
    },
    'uq34qyc4': {
      'ar': 'Enter your full name',
      'en': 'Enter your full name',
      'tr': 'Ad ve soyadınızı girin',
    },
    'fg1cnwhu': {
      'ar': 'رقم هاتف الطالب',
      'en': 'Student phone number',
      'tr': 'Öğrenci telefon numarası',
    },
    'd2ftyuix': {
      'ar': 'Enter your full name',
      'en': 'Enter your full name',
      'tr': 'Ad ve soyadınızı girin',
    },
    'ru8lkozc': {
      'ar': 'رقم هاتف ولي الامر',
      'en': 'Parent\'s phone number',
      'tr': 'Ebeveynin telefon numarası',
    },
    '653cvkni': {
      'ar': 'المحافظة',
      'en': 'Governorate',
      'tr': 'Valilik',
    },
    '219on44o': {
      'ar': 'يرجى اختيار المحافظة',
      'en': 'Please select a governorate',
      'tr': 'Lütfen bir valilik seçin',
    },
    'duwgkruy': {
      'ar': 'Search for an item...',
      'en': 'Search for an item...',
      'tr': 'Bir öğeyi arayın...',
    },
    'h9et7kw7': {
      'ar': 'كركوك',
      'en': 'Kirkuk',
      'tr': 'Kerkük',
    },
    'teqjypqr': {
      'ar': 'بغداد',
      'en': 'Baghdad',
      'tr': 'Bağdat',
    },
    'uxr3xv3x': {
      'ar': 'دهوك',
      'en': 'Dohuk',
      'tr': 'Duhok',
    },
    '51cspjwj': {
      'ar': 'اربيل',
      'en': 'Erbil',
      'tr': 'Erbil',
    },
    '6mt009ai': {
      'ar': 'نينوى',
      'en': 'Nineveh',
      'tr': 'Ninova',
    },
    '28f9ldaj': {
      'ar': 'السليمانية',
      'en': 'Sulaymaniyah',
      'tr': 'Süleymaniye',
    },
    'yvz0ui4t': {
      'ar': 'صلاح الدين',
      'en': 'Salahaddin',
      'tr': 'Selahaddin',
    },
    'gcc00ulq': {
      'ar': 'ديالى',
      'en': 'Diyala',
      'tr': 'Diyala',
    },
    'i9d8bp9v': {
      'ar': 'الانبار',
      'en': 'Anbar',
      'tr': 'Anbar',
    },
    '165s34kf': {
      'ar': 'واسط',
      'en': 'Wasit',
      'tr': 'Vasit',
    },
    '4vsp4av1': {
      'ar': 'بابل',
      'en': 'Babylon',
      'tr': 'Babil',
    },
    'i3om2oib': {
      'ar': 'كربلاء',
      'en': 'Karbala',
      'tr': 'Kerbela',
    },
    'kyw2ed5d': {
      'ar': 'النجف',
      'en': 'Najaf',
      'tr': 'Necef',
    },
    'st7amjpi': {
      'ar': 'الديوانية',
      'en': 'Diwaniyah',
      'tr': 'Divaniye',
    },
    '3cgt51q3': {
      'ar': 'ميسان',
      'en': 'Maysan',
      'tr': 'Maysan',
    },
    'ie9mcsoj': {
      'ar': 'ذي قار',
      'en': 'Dhi Qar',
      'tr': 'Dikar',
    },
    't5kkrort': {
      'ar': 'المثنى',
      'en': 'Muthana',
      'tr': 'Mutenna',
    },
    'key0f6bn': {
      'ar': 'البصرة',
      'en': 'Basra',
      'tr': 'Basra',
    },
    'flt9pxdb': {
      'ar': 'عنوان السكن',
      'en': 'home adress',
      'tr': 'ev adresi',
    },
    'gdwmdils': {
      'ar': 'حفظ التغييرات',
      'en': 'Saving changes',
      'tr': 'Değişiklikleri kaydet',
    },
  },
  // teacher_profile
  {
    'cb7covzn': {
      'ar': 'المدرس / المدرب',
      'en': 'Teacher/coach',
      'tr': 'Öğretmen/antrenör',
    },
    '7exh3chh': {
      'ar': 'عن المدرس',
      'en': 'About',
      'tr': 'hakkında',
    },
    'si59me0k': {
      'ar': 'الدورات',
      'en': 'Courses',
      'tr': 'Dersler',
    },
    'pqlz0dbw': {
      'ar': 'المنشورات',
      'en': 'Posts',
      'tr': 'Gönderiler',
    },
    'nrak78ya': {
      'ar': 'Home',
      'en': 'Home',
      'tr': 'Ev',
    },
  },
  // query_orders_code
  {
    'msdzzx7g': {
      'ar': 'مزامنة الدورات',
      'en': 'Synchronize courses',
      'tr': 'Kursları senkronize et',
    },
    'vyllq2ab': {
      'ar': 'يرجى ادخال الكود من الجهاز الاخر',
      'en': 'Please enter the code from the other device',
      'tr': 'Lütfen diğer cihazdaki kodu girin',
    },
    'ogir51dv': {
      'ar': 'الرجاء التأكد من تطابق الرقم لكي يتم المزامنة',
      'en': 'Please make sure the number matches in order to sync',
      'tr': 'Senkronize etmek için lütfen numaranın eşleştiğinden emin olun',
    },
    'akh30rqd': {
      'ar': 'ادخل الكود هنا ...',
      'en': 'Enter the code here...',
      'tr': 'Kodu buraya girin...',
    },
    'dfqbwv6m': {
      'ar': 'مزامنة',
      'en': 'synchronization',
      'tr': 'senkronizasyon',
    },
    '4bluuer5': {
      'ar': 'Home',
      'en': 'Home',
      'tr': 'Ev',
    },
  },
  // query_order_done
  {
    'he0jaf15': {
      'ar': 'تم استرداد جميع الدورات',
      'en': 'All courses have been returned',
      'tr': 'Tüm derslerin iadesi yapıldı',
    },
    'qt0alcxz': {
      'ar': 'يمكنك متابعة الدورات من صفحة الدورات الخاص بي',
      'en': 'You can follow the courses from my courses page',
      'tr': 'Derslerinizi kurslarım sayfasından takip edebilirsiniz.',
    },
    'jmf3jf92': {
      'ar': 'انتقل الى الدورات',
      'en': 'Go to courses',
      'tr': 'Kurslara git',
    },
    '9q5arem6': {
      'ar': 'Home',
      'en': 'Home',
      'tr': 'Ev',
    },
  },
  // no_course
  {
    'p62zn9qo': {
      'ar': 'لا يوجد شئ حتى الان',
      'en': 'There is nothing yet',
      'tr': 'Henüz hiçbir şey yok',
    },
  },
  // reply
  {
    '5bfcuyl4': {
      'ar': 'ارسال',
      'en': 'send',
      'tr': 'Gönder',
    },
    '91e1do66': {
      'ar': 'رد على التعليق ..',
      'en': 'Reply to comment..',
      'tr': 'Yoruma cevap ver..',
    },
  },
  // Miscellaneous
  {
    'onblx0n6': {
      'ar': 'Button',
      'en': 'Button',
      'tr': 'Düğme',
    },
    'zsb3erh9': {
      'ar': 'يرجى منح الإذن للتطبيق لاستخدام الكاميرا',
      'en': 'Please give permission to app to use camera',
      'tr': 'Lütfen uygulamaya  kamerayı kullanma izni verin',
    },
    'sx9yy8uu': {
      'ar': 'يرجى منح الإذن للتطبيق لاستخدام الاستوديو',
      'en': 'Please give permission to app to use gallery and camera',
      'tr': 'Lütfen uygulamaya galeri ve kamerayı kullanma izni verin',
    },
    'r8zew2jr': {
      'ar': 'خطأ',
      'en': 'mistake',
      'tr': 'hata',
    },
    'oxknw6oz': {
      'ar': 'تم ارسال البريد الالكتروني لاعادة تعين الرقم السري',
      'en': 'An email has been sent to reset the password',
      'tr': 'Şifreyi sıfırlamak için bir e-posta gönderildi',
    },
    'j03fbgl2': {
      'ar': 'البريد الالكتروني مطلوب',
      'en': 'Email is required',
      'tr': 'Email gereklidir',
    },
    '5edrw2fs': {
      'ar': '',
      'en': '',
      'tr': '',
    },
    '7thyc3cx': {
      'ar': 'الرمز السري غير متطابق',
      'en': 'passwords don\'t match',
      'tr': 'Şifreler eşleşmiyor',
    },
    '4xwti1og': {
      'ar': '',
      'en': '',
      'tr': '',
    },
    '1zocx5c5': {
      'ar': '',
      'en': '',
      'tr': '',
    },
    '5s3bb8ga': {
      'ar': '',
      'en': '',
      'tr': '',
    },
    'alnkc20q': {
      'ar': '',
      'en': '',
      'tr': '',
    },
    'y7dd8fkh': {
      'ar': 'البريد الالكتروني مستخدم بالفعل',
      'en': 'Email is already in use',
      'tr': 'E-posta zaten kullanımda',
    },
    'yuy371j7': {
      'ar': 'بيانات الاعتماد غير صالحة',
      'en': 'Invalid credentials',
      'tr': 'Geçersiz kimlik bilgileri',
    },
    'mw7zccyb': {
      'ar': '',
      'en': '',
      'tr': '',
    },
    'sv7eq23r': {
      'ar': '',
      'en': '',
      'tr': '',
    },
    'j6m9bvac': {
      'ar': '',
      'en': '',
      'tr': '',
    },
    'letr3siy': {
      'ar': '',
      'en': '',
      'tr': '',
    },
    '4hcu5z7n': {
      'ar': '',
      'en': '',
      'tr': '',
    },
    'zvfqkaer': {
      'ar': '',
      'en': '',
      'tr': '',
    },
    's6nk5wmt': {
      'ar': '',
      'en': '',
      'tr': '',
    },
    'up3qb5v8': {
      'ar': '',
      'en': '',
      'tr': '',
    },
    'gkhazd02': {
      'ar': '',
      'en': '',
      'tr': '',
    },
    'w0l6xdk4': {
      'ar': '',
      'en': '',
      'tr': '',
    },
    '1avjl238': {
      'ar': '',
      'en': '',
      'tr': '',
    },
    'xf4mdx5r': {
      'ar': '',
      'en': '',
      'tr': '',
    },
    '43h1qeup': {
      'ar': '',
      'en': '',
      'tr': '',
    },
    'r5tbhudm': {
      'ar': '',
      'en': '',
      'tr': '',
    },
  },
].reduce((a, b) => a..addAll(b));
