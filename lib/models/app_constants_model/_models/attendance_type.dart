import 'package:proklinik_patient/models/app_constants_model/_models/app_constant.dart';

class AttendanceType extends AppConstant {
  const AttendanceType({
    required super.id,
    required super.name_en,
    required super.name_ar,
  });
  factory AttendanceType.fromJson(Map<String, dynamic> map) {
    return AttendanceType(
      id: map['id'] as String,
      name_en: map['name_en'],
      name_ar: map['name_ar'],
    );
  }
}
