import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:patient/extensions/is_mobile_context.dart';
import 'package:patient/extensions/loc_ext.dart';
import 'package:patient/functions/debug_print.dart';
import 'package:patient/models/booking_data.dart';
import 'package:patient/models/clinic.dart';
import 'package:patient/models/doctor.dart';
import 'package:patient/models/server_response_model.dart';
import 'package:patient/pages/search_page/widgets/doc_card_xl/schedule_card_xl.dart';
import 'package:patient/providers/locale_px.dart';
import 'package:patient/providers/visit_update_px.dart';
import 'package:provider/provider.dart';

class BookingInfoCard extends StatefulWidget {
  const BookingInfoCard({
    super.key,
    required this.bookingData,
    required this.clinic,
    required this.doctor,
  });
  final BookingData bookingData;
  final Clinic clinic;
  final Doctor doctor;

  @override
  State<BookingInfoCard> createState() => _BookingInfoCardState();
}

class _BookingInfoCardState extends State<BookingInfoCard> {
  late BookingData _state;

  @override
  void initState() {
    _state = widget.bookingData;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: context.isMobile ? 12 : 36),
      child: Consumer2<PxLocale, PxVisitUpdate>(
        builder: (context, l, v, _) {
          return Card.outlined(
            color: Colors.white,
            elevation: 2,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Builder(
                builder: (context) {
                  return switch (v.state) {
                    BookingCardState.data => ListTile(
                        title: Row(
                          children: [
                            const SizedBox(width: 10),
                            const Icon(Icons.calendar_month),
                            const SizedBox(width: 10),
                            Text(context.loc.bookingInformation),
                          ],
                        ),
                        subtitle: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Row(
                                  children: [
                                    const SizedBox(width: 10),
                                    const Icon(Icons.person),
                                    const SizedBox(width: 10),
                                    SizedBox(
                                      width: context.isMobile ? 100 : 200,
                                      child: Text(context.loc.yourName),
                                    ),
                                    const SizedBox(width: 10),
                                    Text(v.bookingData!.user_name),
                                  ],
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Row(
                                  children: [
                                    const SizedBox(width: 10),
                                    const Icon(Icons.timer),
                                    const SizedBox(width: 10),
                                    SizedBox(
                                      width: context.isMobile ? 100 : 200,
                                      child: Text(context.loc.bookingDate),
                                    ),
                                    const SizedBox(width: 10),
                                    Text(
                                      DateFormat(
                                        'dd/MM/yyyy',
                                        context.loc.localeName,
                                      ).format(
                                        DateTime.parse(
                                          v.bookingData!.date_time,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    BookingCardState.schedule => Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          height: 280,
                          width: context.isMobile ? null : 400,
                          decoration: BoxDecoration(
                            color: Colors.green.shade100,
                          ),
                          child: Column(
                            children: [
                              Expanded(
                                child: ListView.builder(
                                  scrollDirection: Axis.horizontal,
                                  itemCount: 365,
                                  itemBuilder: (context, index) {
                                    return ScheduleCardXl(
                                      onTapReschedule: () {
                                        final now = DateTime.now();
                                        final d = DateTime(
                                            now.year, now.month, now.day);
                                        final newDate = d.copyWith(
                                          day: d.day + index,
                                        );
                                        setState(() {
                                          _state = _state.copyWith(
                                            date_time:
                                                newDate.toIso8601String(),
                                            day: newDate.day,
                                            month: newDate.month,
                                            year: newDate.year,
                                          );
                                        });
                                        v.changeState(BookingCardState.confirm);
                                      },
                                      model: ServerResponseModel(
                                        doctor: widget.doctor,
                                        clinic: widget.clinic,
                                        reviews: const [],
                                        total: 1,
                                      ),
                                      index: index,
                                    );
                                  },
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: ElevatedButton(
                                  onPressed: () {
                                    v.changeState(BookingCardState.data);
                                  },
                                  child: Text(context.loc.cancel),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    BookingCardState.confirm => ListTile(
                        title: Row(
                          children: [
                            const SizedBox(width: 10),
                            const Icon(Icons.calendar_month),
                            const SizedBox(width: 10),
                            Text(context.loc.bookingInformation),
                          ],
                        ),
                        subtitle: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Row(
                                  children: [
                                    const SizedBox(width: 10),
                                    const Icon(Icons.person),
                                    const SizedBox(width: 10),
                                    SizedBox(
                                      width: context.isMobile ? 100 : 200,
                                      child: Text(context.loc.yourName),
                                    ),
                                    const SizedBox(width: 10),
                                    Text(_state.user_name),
                                  ],
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Row(
                                  children: [
                                    const SizedBox(width: 10),
                                    const Icon(Icons.timer),
                                    const SizedBox(width: 10),
                                    SizedBox(
                                      width: context.isMobile ? 100 : 200,
                                      child: Text(context.loc.bookingDate),
                                    ),
                                    const SizedBox(width: 10),
                                    Text(
                                      DateFormat(
                                        'dd/MM/yyyy',
                                        context.loc.localeName,
                                      ).format(
                                        DateTime.parse(
                                          _state.date_time,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  ElevatedButton(
                                    onPressed: () async {
                                      try {
                                        await v.updateBookingData(
                                          update: _state.toPocketbaseJson(),
                                        );
                                        v.updateShowThankYou();
                                      } catch (e) {
                                        dprint(e);
                                      }
                                    },
                                    child: Text(context.loc.updateBooking),
                                  ),
                                  const SizedBox(width: 10),
                                  ElevatedButton(
                                    onPressed: () {
                                      v.changeState(BookingCardState.data);
                                    },
                                    child: Text(context.loc.cancel),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                  };
                },
              ),
            ),
          );
        },
      ),
    );
  }
}
