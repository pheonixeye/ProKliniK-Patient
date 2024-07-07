import 'dart:math';

import 'package:patient/models/destination.dart';
import 'package:patient/models/doctor.dart';
import 'package:uuid/uuid.dart';

// ignore: non_constant_identifier_names
List<Doctor> DOCTORS = [
  Doctor(
    id: const Uuid().v4(),
    synd_id: 1,
    joined_at: DateTime.now()
        .subtract(Duration(days: Random().nextInt(365)))
        .toIso8601String(),
    name_en: "Kareem Zaher",
    name_ar: "كريم زاهر",
    personal_phone: "+201227022248",
    speciality_en: "Urology",
    speciality_ar: "مسالك بولية",
    published: true,
    title_en: "Urology And Andrology Specialist Surgeon.",
    title_ar: "اخصائي جراحة المسالك البولية و الذكورة",
    about_en:
        "Urology And Andrology Specialist Surgeon - Msc In Urology - Al Azhar University - Member of The European Association Of Urology.",
    about_ar:
        "اخصائي جراحة المسالك البولية و الذكورة - ماجيستير جراحة المسالك البولية و الذكورة - جامعة الازهر - عضو الجمعية الاوروبية لجراحة المسالك البولية.",
    degree_en: "Specialist",
    degree_ar: "اخصائي",
    rating: 4.6,
    tags: const ["Hygine", "Good Listener", "Informative", "Friendly"],
    views: 6954,
    destinations: const [
      Destination(
        govEn: "Cairo",
        govAr: "القاهرة",
        areaEn: "Maadi",
        areaAr: "المعادي",
        addressEn: "Zahraa El-Maadi, El Nada Tower",
        addressAr: "زهراء المعادي - برج الندي",
      ),
    ],
  ),
  Doctor(
    id: const Uuid().v4(),
    synd_id: 2,
    joined_at: DateTime.now()
        .subtract(Duration(days: Random().nextInt(365)))
        .toIso8601String(),
    name_en: "Tarek Maged El Sakaty",
    name_ar: "طارق ماجد السقطي",
    personal_phone: "+201119877735",
    speciality_en: "Gastroenterology",
    speciality_ar: "جهاز هضمي",
    published: true,
    title_en: "Professor of Gastroentrology & Hepatology- Ain Shams University",
    title_ar: "استاذ الجهاز الهضمي و الكبد - جامعة عين شمس",
    about_en:
        "Endoscopy - Colonscope - ERCP - Esophagus Dilatation Head of Internal Medicine, Hepatology and Gastroenterology ( Ain Shams University)",
    about_ar:
        "تنظير - منظار القولون - تصوير البنكرياس والقنوات الصفراوية بالمنظار - توسيع المريء رئيس قسم الطب الباطني والكبد والجهاز الهضمي (جامعة عين شمس)",
    degree_en: "Consultant",
    degree_ar: "استشاري",
    rating: 4.6,
    tags: const ["Hygine", "Informative"],
    views: 174401,
    destinations: const [
      Destination(
        govEn: "Cairo",
        govAr: "القاهرة",
        areaEn: "New Cairo",
        areaAr: "القاهرة الجديدة",
        addressEn: "Zahraa El-Maadi, El Nada Tower",
        addressAr: "زهراء المعادي - برج الندي",
      ),
    ],
  ),
  Doctor(
    id: const Uuid().v4(),
    synd_id: 3,
    joined_at: DateTime.now()
        .subtract(Duration(days: Random().nextInt(365)))
        .toIso8601String(),
    name_en: "Mohamed Farag",
    name_ar: "محمد فرج",
    personal_phone: "+201552944485",
    speciality_en: "Dentistry",
    speciality_ar: "اسنان",
    published: true,
    title_en: "Oral surgeon & Implantologist.",
    title_ar: "جراح الفم وزراعة الأسنان",
    about_en: "Teaching Assisstant at BUE.",
    about_ar: "مدرس مساعد بالجامعة البريطانية الحديثة",
    degree_en: "Specialist",
    degree_ar: "اخصائي",
    rating: 4.6,
    tags: const ["Good Listener", "Informative", "Friendly"],
    views: 50737,
    destinations: const [
      Destination(
        govEn: "Giza",
        govAr: "الجيزة",
        areaEn: "Haram",
        areaAr: "الهرم",
        addressEn: "Zahraa El-Maadi, El Nada Tower",
        addressAr: "زهراء المعادي - برج الندي",
      ),
    ],
  ),
  Doctor(
    id: const Uuid().v4(),
    synd_id: 4,
    joined_at: DateTime.now()
        .subtract(Duration(days: Random().nextInt(365)))
        .toIso8601String(),
    name_en: "Said Labib El Atary",
    name_ar: "سيد لبيب العطاري",
    personal_phone: "+201002947384",
    speciality_en: "Pulmonology",
    speciality_ar: "امراض صدرية",
    published: true,
    title_en: "Chest Professor",
    title_ar: "استاذ الامراض الصدرية",
    about_en: "M.D , of chest diseases ACCP fellow",
    about_ar:
        "دكتوراه الامراض الصدرية - عضو الجمعية الامريكية للصيدلة الاكلينيكية",
    degree_en: "Consultant",
    degree_ar: "استشاري",
    rating: 4.5,
    tags: const ["Good Listener", "Informative", "Friendly"],
    views: 28954,
    destinations: const [
      Destination(
        govEn: "Cairo",
        govAr: "القاهرة",
        areaEn: "El-Zaytoun",
        areaAr: "الزيتون",
        addressEn: "Zahraa El-Maadi, El Nada Tower",
        addressAr: "زهراء المعادي - برج الندي",
      ),
    ],
  ),
  Doctor(
    id: const Uuid().v4(),
    synd_id: 5,
    joined_at: DateTime.now()
        .subtract(Duration(days: Random().nextInt(365)))
        .toIso8601String(),
    name_en: "Dalia El Kelany",
    name_ar: "داليا الكيلاني",
    personal_phone: "+201054733856",
    speciality_en: "Gynaecology",
    speciality_ar: "نساء و توليد",
    published: true,
    title_en: "Consultant of Gynacology ,Obstetrics and ICSI",
    title_ar: "استشاري أمراض النساء والتوليد والحقن المجهري",
    about_en:
        "Consultant of Gynacology , Obstetrics and IVF - Member of The Egyptian Society of Fertility and Infertility- Member of the Arab Society of Feotal Medicine",
    about_ar:
        "استشارى امراض النساء والتوليد وأطفال الأنابيب - عضو الجمعية المصرية للخصوبة والعقم - عضو الجمعية العربية لطب الجنين",
    degree_en: "Consultant",
    degree_ar: "استشاري",
    rating: 4.5,
    tags: const ["Hygine", "Good Listener", "Friendly"],
    views: 37257,
    destinations: const [
      Destination(
        govEn: "Cairo",
        govAr: "القاهرة",
        areaEn: "Maadi",
        areaAr: "المعادي",
        addressEn: "Zahraa El-Maadi, El Nada Tower",
        addressAr: "زهراء المعادي - برج الندي",
      ),
    ],
  ),
  Doctor(
    id: const Uuid().v4(),
    synd_id: 6,
    joined_at: DateTime.now()
        .subtract(Duration(days: Random().nextInt(365)))
        .toIso8601String(),
    name_en: "Hesham Abdelrahman",
    name_ar: "هشام عبد الرحمن",
    personal_phone: "+201274899903",
    speciality_en: "Psychiatry",
    speciality_ar: "نفسية",
    published: true,
    title_en: "Child Psychiatrist",
    title_ar: "استشاري نفسية اطفال",
    about_en: "Child Psychiatrist; Psychiatry; M.D. Child Psychiatrist",
    about_ar: "طبيب نفسي للأطفال; الطب النفسي؛ دكتوراه في الطب النفسي للأطفال",
    degree_en: "Consultant",
    degree_ar: "استشاري",
    rating: 4.5,
    tags: const ["Good Listener", "Informative"],
    views: 25847,
    destinations: const [
      Destination(
        govEn: "Cairo",
        govAr: "القاهرة",
        areaEn: "Rehab",
        areaAr: "الرحاب",
        addressEn: "Zahraa El-Maadi, El Nada Tower",
        addressAr: "زهراء المعادي - برج الندي",
      ),
    ],
  ),
  Doctor(
    id: const Uuid().v4(),
    synd_id: 7,
    joined_at: DateTime.now()
        .subtract(Duration(days: Random().nextInt(365)))
        .toIso8601String(),
    name_en: "Hany El Nady",
    name_ar: "هاني النادي",
    personal_phone: "+201283755546",
    speciality_en: "General Surgery",
    speciality_ar: "جراحة عامة",
    published: true,
    title_en: "Consultant Of General surgery and Plastic surgery",
    title_ar: "استشاري الجراحة العامة وجراحة التجميل",
    about_en: "Consultant Of General surgery and Plastic surgery",
    about_ar: "استشاري الجراحة العامة وجراحة التجميل",
    degree_en: "Consultant",
    degree_ar: "استشاري",
    rating: 4.5,
    tags: const [],
    views: 56847,
    destinations: const [
      Destination(
        govEn: "Cairo",
        govAr: "القاهرة",
        areaEn: "New Cairo",
        areaAr: "القاهرة الجديدة",
        addressEn: "Zahraa El-Maadi, El Nada Tower",
        addressAr: "زهراء المعادي - برج الندي",
      ),
    ],
  ),
  Doctor(
    id: const Uuid().v4(),
    synd_id: 8,
    joined_at: DateTime.now()
        .subtract(Duration(days: Random().nextInt(365)))
        .toIso8601String(),
    name_en: "Sohir Taha",
    name_ar: "سهير طه",
    personal_phone: "+201555980097",
    speciality_en: "Dermatology",
    speciality_ar: "جلدية",
    published: true,
    title_en: "Dermatology Consultant",
    title_ar: "استشاري الامراض الجلدية",
    about_en:
        "Masters in dermatology Faculty of Medicine - Al Azhar University",
    about_ar: "ماجستير الأمراض الجلدية كلية الطب - جامعة الأزهر",
    degree_en: "Consultant",
    degree_ar: "استشاري",
    rating: 4.5,
    tags: const [],
    views: 36847,
    destinations: const [
      Destination(
        govEn: "Cairo",
        govAr: "القاهرة",
        areaEn: "Mokattam",
        areaAr: "المقطم",
        addressEn: "Zahraa El-Maadi, El Nada Tower",
        addressAr: "زهراء المعادي - برج الندي",
      ),
    ],
  ),
  Doctor(
    id: const Uuid().v4(),
    synd_id: 9,
    joined_at: DateTime.now()
        .subtract(Duration(days: Random().nextInt(365)))
        .toIso8601String(),
    name_en: "Mina Wassef Girgiss",
    name_ar: "مينا واصف جرجس",
    personal_phone: "+201111985768",
    speciality_en: "Endocrinology",
    speciality_ar: "غدد صماء",
    published: true,
    title_en:
        "Professor and Consultant of Endocrinology , Diabetology and Internal Medicine",
    title_ar: "أستاذ واستشاري الغدد الصماء والسكري والطب الباطني",
    about_en:
        "Professor Dr. Mina Wassef Girgiss Doctorate degree and Consultant Endocrinology, Diabetology and Internal Medicine; Cairo University Professor and Consultant of diabetology, endocrinology, obesity (delayed growth and puberty) and atherosclerosis, neuropathic pain Member of the : American Diabetes Association American Thyroid Association Egyptian Association of Endocrinology, Diabetes and Atherosclerosis More than 30 years of experience Dietary regims tailored Price is double for foreigners",
    about_ar:
        "الأستاذ الدكتور مينا واصف جرجس درجة الدكتوراه واستشاري أمراض الغدد الصماء والسكري والطب الباطني. أستاذ جامعة القاهرة واستشاري أمراض السكر والغدد الصماء والسمنة (تأخر النمو والبلوغ) وتصلب الشرايين وآلام الأعصاب عضو: الجمعية الأمريكية للسكري الجمعية الأمريكية للغدة الدرقية الجمعية المصرية للغدد الصماء والسكري وتصلب الشرايين أكثر من 30 عامًا من الخبرة أنظمة غذائية مصممة حسب الطلب السعر مزدوج للأجانب",
    degree_en: "Consultant",
    degree_ar: "استشاري",
    rating: 5.0,
    tags: const [],
    views: 22847,
    destinations: const [
      Destination(
        govEn: "Cairo",
        govAr: "القاهرة",
        areaEn: "New Heliopolis",
        areaAr: "مصر الجديدة",
        addressEn: "Zahraa El-Maadi, El Nada Tower",
        addressAr: "زهراء المعادي - برج الندي",
      ),
    ],
  ),
  Doctor(
    id: const Uuid().v4(),
    synd_id: 10,
    joined_at: DateTime.now()
        .subtract(Duration(days: Random().nextInt(365)))
        .toIso8601String(),
    name_en: "Doaa Abdellatif Elelwany",
    name_ar: "دعاء عبد اللطيف العلواني",
    personal_phone: "+201000294867",
    speciality_en: "Neurology",
    speciality_ar: "مخ و اعصاب",
    published: true,
    title_en: "Neurology consultant and lecturer at Cairo University",
    title_ar: "استشاري أمراض المخ والأعصاب ومدرس بجامعة القاهرة",
    about_en: "Neurology consultant and lecturer at Cairo University",
    about_ar: "استشاري أمراض المخ والأعصاب ومدرس بجامعة القاهرة",
    degree_en: "Consultant",
    degree_ar: "استشاري",
    rating: 0.0,
    tags: const [],
    views: 2,
    destinations: const [
      Destination(
        govEn: "Cairo",
        govAr: "القاهرة",
        areaEn: "Maadi",
        areaAr: "المعادي",
        addressEn: "Zahraa El-Maadi, El Nada Tower",
        addressAr: "زهراء المعادي - برج الندي",
      ),
    ],
  ),
];
