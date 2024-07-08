import 'dart:math';

import 'package:patient/models/clinic.dart';
import 'package:patient/models/destination.dart';
import 'package:patient/models/schedule.dart';
import 'package:patient/models/schedule_object.dart';
import 'package:uuid/uuid.dart';

// ignore: non_constant_identifier_names
List<Clinic> CLINICS = [
  Clinic(
    id: const Uuid().v4(),
    doc_id: "1",
    name_en: "Maadi Clinic",
    name_ar: "عيادة المعادي",
    mobile: "+201021646574",
    landline: "+225165064",
    attendance: true,
    published: true,
    consultation_fees: 300,
    followup_fees: 50,
    discount: 0,
    waiting_time: 10,
    followup_duration: 14,
    off_dates: [
      ...List.generate(
          10,
          (index) => DateTime.now()
              .add(Duration(days: Random().nextInt(28)))
              .toIso8601String())
    ],
    destination: const Destination(
      id: "1",
      govEn: "Cairo",
      govAr: "القاهرة",
      areaEn: "Maadi",
      areaAr: "المعادي",
      addressEn: "12 Al-Nasr Street, Giza District, Cairo, Egypt",
      addressAr: "١٢ شارع النصر، حي الجيزة، القاهرة، مصر",
      lon: 0.4,
      lat: 0.8,
    ),
    schedule: const [
      Schedule(
        id: "1",
        weekday: "Monday",
        intday: 1,
        startMin: 45,
        startHour: 19,
        endMin: 0,
        endHour: 22,
      ),
      Schedule(
        id: "2",
        weekday: "Tuesday",
        intday: 2,
        startMin: 30,
        startHour: 19,
        endMin: 0,
        endHour: 22,
      ),
      Schedule(
        id: "3",
        weekday: "Wednesday",
        intday: 3,
        startMin: 30,
        startHour: 18,
        endMin: 30,
        endHour: 21,
      ),
    ],
    scheduleobject: ScheduleObject.initialScheduleObjectList,
  ),
  Clinic(
    id: const Uuid().v4(),
    doc_id: "2",
    name_en: "Maadi Clinic",
    name_ar: "عيادة المعادي",
    mobile: "+201021646574",
    landline: "+225165064",
    attendance: false,
    published: true,
    consultation_fees: 600,
    followup_fees: 100,
    discount: 0,
    waiting_time: 45,
    followup_duration: 14,
    off_dates: [
      ...List.generate(
          10,
          (index) => DateTime.now()
              .add(Duration(days: Random().nextInt(28)))
              .toIso8601String())
    ],
    destination: const Destination(
      id: "2",
      govEn: "Cairo",
      govAr: "القاهرة",
      areaEn: "New Cairo",
      areaAr: "القاهرة الجديدة",
      addressEn: "7 Omar Ibn Al-Khattab Square, Heliopolis, Cairo, Egypt",
      addressAr: "ميدان عمر ابن الخطاب ٧، مصر الجديدة، القاهرة، مصر",
      lon: 0.4,
      lat: 0.8,
    ),
    schedule: const [
      Schedule(
        id: "1",
        weekday: "Saturday",
        intday: 6,
        startMin: 45,
        startHour: 20,
        endMin: 0,
        endHour: 23,
      ),
      Schedule(
        id: "2",
        weekday: "Friday",
        intday: 5,
        startMin: 0,
        startHour: 15,
        endMin: 0,
        endHour: 18,
      ),
      Schedule(
        id: "3",
        weekday: "Thursday",
        intday: 4,
        startMin: 30,
        startHour: 18,
        endMin: 30,
        endHour: 21,
      ),
    ],
    scheduleobject: ScheduleObject.initialScheduleObjectList,
  ),
  Clinic(
    id: const Uuid().v4(),
    doc_id: "3",
    name_en: "Maadi Clinic",
    name_ar: "عيادة المعادي",
    mobile: "+201021646574",
    landline: "+225165064",
    attendance: true,
    published: true,
    consultation_fees: 200,
    followup_fees: 50,
    discount: 0,
    waiting_time: 20,
    followup_duration: 14,
    off_dates: [
      ...List.generate(
          10,
          (index) => DateTime.now()
              .add(Duration(days: Random().nextInt(28)))
              .toIso8601String())
    ],
    destination: const Destination(
      id: "3",
      govEn: "Giza",
      govAr: "الجيزة",
      areaEn: "Haram",
      areaAr: "الهرم",
      addressEn:
          "Building 45, Al-Mahalla Al-Kubra Street, Downtown Cairo, Egyp",
      addressAr: "مبنى ٤٥، شارع المحلة الكبرى، وسط البلد، القاهرة، مصر ",
      lon: 0.4,
      lat: 0.8,
    ),
    schedule: const [
      Schedule(
        id: "1",
        weekday: "Sunday",
        intday: 7,
        startMin: 45,
        startHour: 19,
        endMin: 0,
        endHour: 22,
      ),
      Schedule(
        id: "2",
        weekday: "Monday",
        intday: 1,
        startMin: 30,
        startHour: 19,
        endMin: 0,
        endHour: 22,
      ),
      Schedule(
        id: "3",
        weekday: "Tuesday",
        intday: 2,
        startMin: 30,
        startHour: 18,
        endMin: 30,
        endHour: 21,
      ),
    ],
    scheduleobject: ScheduleObject.initialScheduleObjectList,
  ),
  Clinic(
    id: const Uuid().v4(),
    doc_id: "4",
    name_en: "Maadi Clinic",
    name_ar: "عيادة المعادي",
    mobile: "+201021646574",
    landline: "+225165064",
    attendance: false,
    published: true,
    consultation_fees: 350,
    followup_fees: 100,
    discount: 0,
    waiting_time: 20,
    followup_duration: 14,
    off_dates: [
      ...List.generate(
          10,
          (index) => DateTime.now()
              .add(Duration(days: Random().nextInt(28)))
              .toIso8601String())
    ],
    destination: const Destination(
      id: "4",
      govEn: "Cairo",
      govAr: "القاهرة",
      areaEn: "El-Zaytoun",
      areaAr: "الزيتون",
      addressEn: "Apartment 2B, Nile Corniche Street, Zamalek, Cairo, Egypt",
      addressAr: "شقة ٢ب، شارع كورنيش النيل، الزمالك، القاهرة، مصر",
      lon: 0.4,
      lat: 0.8,
    ),
    schedule: const [
      Schedule(
        id: "1",
        weekday: "Sunday",
        intday: 7,
        startMin: 45,
        startHour: 19,
        endMin: 0,
        endHour: 22,
      ),
      Schedule(
        id: "2",
        weekday: "Tuesday",
        intday: 2,
        startMin: 30,
        startHour: 19,
        endMin: 0,
        endHour: 22,
      ),
      Schedule(
        id: "3",
        weekday: "Thursday",
        intday: 4,
        startMin: 30,
        startHour: 18,
        endMin: 30,
        endHour: 21,
      ),
    ],
    scheduleobject: ScheduleObject.initialScheduleObjectList,
  ),
  Clinic(
    id: const Uuid().v4(),
    doc_id: "5",
    name_en: "Maadi Clinic",
    name_ar: "عيادة المعادي",
    mobile: "+201021646574",
    landline: "+225165064",
    attendance: true,
    published: true,
    consultation_fees: 400,
    followup_fees: 100,
    discount: 0,
    waiting_time: 30,
    followup_duration: 14,
    off_dates: [
      ...List.generate(
          10,
          (index) => DateTime.now()
              .add(Duration(days: Random().nextInt(28)))
              .toIso8601String())
    ],
    destination: const Destination(
      id: "5",
      govEn: "Cairo",
      govAr: "القاهرة",
      areaEn: "Maadi",
      areaAr: "المعادي",
      addressEn: "Villa 10, El-Mokattam District, Cairo, Egypt",
      addressAr: "فيلا ١٠، حي المقطم، القاهرة، مصر",
      lon: 0.4,
      lat: 0.8,
    ),
    schedule: const [
      Schedule(
        id: "1",
        weekday: "Monday",
        intday: 1,
        startMin: 45,
        startHour: 19,
        endMin: 0,
        endHour: 22,
      ),
      Schedule(
        id: "2",
        weekday: "Wednesday",
        intday: 3,
        startMin: 30,
        startHour: 19,
        endMin: 0,
        endHour: 22,
      ),
      Schedule(
        id: "3",
        weekday: "Saturday",
        intday: 6,
        startMin: 30,
        startHour: 18,
        endMin: 30,
        endHour: 21,
      ),
    ],
    scheduleobject: ScheduleObject.initialScheduleObjectList,
  ),
  Clinic(
    id: const Uuid().v4(),
    doc_id: "6",
    name_en: "Maadi Clinic",
    name_ar: "عيادة المعادي",
    mobile: "+201021646574",
    landline: "+225165064",
    attendance: true,
    published: true,
    consultation_fees: 450,
    followup_fees: 150,
    discount: 0,
    waiting_time: 57,
    followup_duration: 14,
    off_dates: [
      ...List.generate(
          10,
          (index) => DateTime.now()
              .add(Duration(days: Random().nextInt(28)))
              .toIso8601String())
    ],
    destination: const Destination(
      id: "6",
      govEn: "Cairo",
      govAr: "القاهرة",
      areaEn: "Rehab",
      areaAr: "الرحاب",
      addressEn: "Shop 3, Ramses Square, Bab El-Louk, Cairo, Egypt",
      addressAr: "محل ٣، ميدان رمسيس، باب اللوق، القاهرة، مصر",
      lon: 0.4,
      lat: 0.8,
    ),
    schedule: const [
      Schedule(
        id: "1",
        weekday: "Sunday",
        intday: 7,
        startMin: 45,
        startHour: 19,
        endMin: 0,
        endHour: 22,
      ),
      Schedule(
        id: "2",
        weekday: "Tuesday",
        intday: 2,
        startMin: 30,
        startHour: 19,
        endMin: 0,
        endHour: 22,
      ),
      Schedule(
        id: "3",
        weekday: "Thursday",
        intday: 4,
        startMin: 30,
        startHour: 18,
        endMin: 30,
        endHour: 21,
      ),
    ],
    scheduleobject: ScheduleObject.initialScheduleObjectList,
  ),
  Clinic(
    id: const Uuid().v4(),
    doc_id: "7",
    name_en: "Maadi Clinic",
    name_ar: "عيادة المعادي",
    mobile: "+201021646574",
    landline: "+225165064",
    attendance: true,
    published: true,
    consultation_fees: 400,
    followup_fees: 0,
    discount: 0,
    waiting_time: 45,
    followup_duration: 14,
    off_dates: [
      ...List.generate(
          10,
          (index) => DateTime.now()
              .add(Duration(days: Random().nextInt(28)))
              .toIso8601String())
    ],
    destination: const Destination(
      id: "7",
      govEn: "Cairo",
      govAr: "القاهرة",
      areaEn: "New Cairo",
      areaAr: "القاهرة الجديدة",
      addressEn: "2nd Floor, Muhammad Ali Street, Islamic Cairo, Egypt",
      addressAr: "الدور الثاني، شارع محمد علي، القاهرة الإسلامية، مصر",
      lon: 0.4,
      lat: 0.8,
    ),
    schedule: const [
      Schedule(
        id: "1",
        weekday: "Monday",
        intday: 1,
        startMin: 45,
        startHour: 19,
        endMin: 0,
        endHour: 22,
      ),
      Schedule(
        id: "2",
        weekday: "Wednesday",
        intday: 3,
        startMin: 30,
        startHour: 19,
        endMin: 0,
        endHour: 22,
      ),
      Schedule(
        id: "3",
        weekday: "Saturday",
        intday: 6,
        startMin: 30,
        startHour: 18,
        endMin: 30,
        endHour: 21,
      ),
    ],
    scheduleobject: ScheduleObject.initialScheduleObjectList,
  ),
  Clinic(
    id: const Uuid().v4(),
    doc_id: "8",
    name_en: "Maadi Clinic",
    name_ar: "عيادة المعادي",
    mobile: "+201021646574",
    landline: "+225165064",
    attendance: true,
    published: true,
    consultation_fees: 300,
    followup_fees: 80,
    discount: 0,
    waiting_time: 100,
    followup_duration: 14,
    off_dates: [
      ...List.generate(
          10,
          (index) => DateTime.now()
              .add(Duration(days: Random().nextInt(28)))
              .toIso8601String())
    ],
    destination: const Destination(
      id: "8",
      govEn: "Cairo",
      govAr: "القاهرة",
      areaEn: "Mokattam",
      areaAr: "المقطم",
      addressEn:
          "Al-Ahram Street, Giza Necropolis, Cairo, Egypt (area near the pyramids)",
      addressAr: "شارع الأهرام، جبانة الجيزة، القاهرة، مصر",
      lon: 0.4,
      lat: 0.8,
    ),
    schedule: const [
      Schedule(
        id: "1",
        weekday: "Monday",
        intday: 1,
        startMin: 45,
        startHour: 19,
        endMin: 0,
        endHour: 22,
      ),
      Schedule(
        id: "2",
        weekday: "Wednesday",
        intday: 3,
        startMin: 30,
        startHour: 19,
        endMin: 0,
        endHour: 22,
      ),
      Schedule(
        id: "3",
        weekday: "Saturday",
        intday: 6,
        startMin: 30,
        startHour: 18,
        endMin: 30,
        endHour: 21,
      ),
    ],
    scheduleobject: ScheduleObject.initialScheduleObjectList,
  ),
  Clinic(
    id: const Uuid().v4(),
    doc_id: "9",
    name_en: "Maadi Clinic",
    name_ar: "عيادة المعادي",
    mobile: "+201021646574",
    landline: "+225165064",
    attendance: true,
    published: true,
    consultation_fees: 200,
    followup_fees: 0,
    discount: 0,
    waiting_time: 60,
    followup_duration: 14,
    off_dates: [
      ...List.generate(
          10,
          (index) => DateTime.now()
              .add(Duration(days: Random().nextInt(28)))
              .toIso8601String())
    ],
    destination: const Destination(
      id: "9",
      govEn: "Cairo",
      govAr: "القاهرة",
      areaEn: "New Heliopolis",
      areaAr: "مصر الجديدة",
      addressEn: "Salah Salem Road, Al-Matariya District, Cairo, Egypt",
      addressAr: "طريق صلاح سالم، حي المطرية، القاهرة، مصر",
      lon: 0.4,
      lat: 0.8,
    ),
    schedule: const [
      Schedule(
        id: "1",
        weekday: "Monday",
        intday: 1,
        startMin: 45,
        startHour: 19,
        endMin: 0,
        endHour: 22,
      ),
      Schedule(
        id: "2",
        weekday: "Wednesday",
        intday: 3,
        startMin: 30,
        startHour: 19,
        endMin: 0,
        endHour: 22,
      ),
      Schedule(
        id: "3",
        weekday: "Saturday",
        intday: 6,
        startMin: 30,
        startHour: 18,
        endMin: 30,
        endHour: 21,
      ),
    ],
    scheduleobject: ScheduleObject.initialScheduleObjectList,
  ),
  Clinic(
    id: const Uuid().v4(),
    doc_id: "10",
    name_en: "Maadi Clinic",
    name_ar: "عيادة المعادي",
    mobile: "+201021646574",
    landline: "+225165064",
    attendance: true,
    published: true,
    consultation_fees: 500,
    followup_fees: 0,
    discount: 0,
    waiting_time: 40,
    followup_duration: 14,
    off_dates: [
      ...List.generate(
          10,
          (index) => DateTime.now()
              .add(Duration(days: Random().nextInt(28)))
              .toIso8601String())
    ],
    destination: const Destination(
      id: "10",
      govEn: "Cairo",
      govAr: "القاهرة",
      areaEn: "Maadi",
      areaAr: "المعادي",
      addressEn: "Zahraa El-Maadi, El Nada Tower",
      addressAr: "زهراء المعادي - برج الندي",
      lon: 0.4,
      lat: 0.8,
    ),
    schedule: const [
      Schedule(
        id: "1",
        weekday: "Monday",
        intday: 1,
        startMin: 45,
        startHour: 19,
        endMin: 0,
        endHour: 22,
      ),
      Schedule(
        id: "2",
        weekday: "Wednesday",
        intday: 3,
        startMin: 30,
        startHour: 19,
        endMin: 0,
        endHour: 22,
      ),
      Schedule(
        id: "3",
        weekday: "Saturday",
        intday: 6,
        startMin: 30,
        startHour: 18,
        endMin: 30,
        endHour: 21,
      ),
    ],
    scheduleobject: ScheduleObject.initialScheduleObjectList,
  ),
];
