// ignore_for_file: non_constant_identifier_names

import 'dart:convert';

import 'package:equatable/equatable.dart';
import 'package:patient/models/destination.dart';
import 'package:patient/models/schedule.dart';

class Tempo extends Equatable {
  final String id;
  final String doc_id;
  final String name_en;
  final String name_ar;
  final String mobile;
  final String landline;
  final bool attendance;
  final bool published;
  final int consultation_fees;
  final int followup_fees;
  final int discount;
  final int waiting_time;
  final int followup_duration;
  final List<String> off_dates;
  final Destination destination;
  final List<Schedule> schedule;

  const Tempo({
    required this.id,
    required this.doc_id,
    required this.name_en,
    required this.name_ar,
    required this.mobile,
    required this.landline,
    required this.attendance,
    required this.published,
    required this.consultation_fees,
    required this.followup_fees,
    required this.discount,
    required this.waiting_time,
    required this.followup_duration,
    required this.off_dates,
    required this.destination,
    required this.schedule,
  });

  Tempo copyWith({
    String? id,
    String? doc_id,
    String? name_en,
    String? name_ar,
    String? mobile,
    String? landline,
    bool? attendance,
    bool? published,
    int? consultation_fees,
    int? followup_fees,
    int? discount,
    int? waiting_time,
    int? followup_duration,
    List<String>? off_dates,
    Destination? destination,
    List<Schedule>? schedule,
  }) {
    return Tempo(
      id: id ?? this.id,
      doc_id: doc_id ?? this.doc_id,
      name_en: name_en ?? this.name_en,
      name_ar: name_ar ?? this.name_ar,
      mobile: mobile ?? this.mobile,
      landline: landline ?? this.landline,
      attendance: attendance ?? this.attendance,
      published: published ?? this.published,
      consultation_fees: consultation_fees ?? this.consultation_fees,
      followup_fees: followup_fees ?? this.followup_fees,
      discount: discount ?? this.discount,
      waiting_time: waiting_time ?? this.waiting_time,
      followup_duration: followup_duration ?? this.followup_duration,
      off_dates: off_dates ?? this.off_dates,
      destination: destination ?? this.destination,
      schedule: schedule ?? this.schedule,
    );
  }

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'id': id,
      'doc_id': doc_id,
      'name_en': name_en,
      'name_ar': name_ar,
      'mobile': mobile,
      'landline': landline,
      'attendance': attendance,
      'published': published,
      'consultation_fees': consultation_fees,
      'followup_fees': followup_fees,
      'discount': discount,
      'waiting_time': waiting_time,
      'followup_duration': followup_duration,
      'off_dates': off_dates,
      'destination': destination.toJson(),
      'schedule': schedule.map((x) => x.toJson()).toList(),
    };
  }

  factory Tempo.fromJson(Map<String, dynamic> map) {
    return Tempo(
      id: map['id'] as String,
      doc_id: map['doc_id'] as String,
      name_en: map['name_en'] as String,
      name_ar: map['name_ar'] as String,
      mobile: map['mobile'] as String,
      landline: map['landline'] as String,
      attendance: map['attendance'] as bool,
      published: map['published'] as bool,
      consultation_fees: map['consultation_fees'] as int,
      followup_fees: map['followup_fees'] as int,
      discount: map['discount'] as int,
      waiting_time: map['waiting_time'] as int,
      followup_duration: map['followup_duration'] as int,
      off_dates:
          (map['off_dates'] as List<dynamic>).map((e) => e.toString()).toList(),
      destination:
          Destination.fromJson(map['destination'] as Map<String, dynamic>),
      schedule: (map['schedule'] as List<dynamic>)
          .map((e) => Schedule.fromJson(e))
          .toList(),
    );
  }

  static List<String> fromString(String data) {
    final List json = jsonDecode(data);
    return json.map((e) => e.toString()).toList();
  }

  @override
  bool get stringify => true;

  @override
  List<Object> get props {
    return [
      id,
      doc_id,
      name_en,
      name_ar,
      mobile,
      landline,
      attendance,
      published,
      consultation_fees,
      followup_fees,
      discount,
      waiting_time,
      followup_duration,
      off_dates,
      destination,
      schedule,
    ];
  }
}