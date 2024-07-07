import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:patient/functions/scroll_direction.dart';
import 'package:patient/models/server_response_model.dart';
import 'package:patient/pages/search_page/widgets/doc_card_xl/doc_data_xl.dart';
import 'package:patient/pages/search_page/widgets/doc_card_xl/doc_image_xl.dart';
import 'package:patient/pages/search_page/widgets/doc_card_xl/schedule_card_xl.dart';
import 'package:patient/providers/locale_px.dart';
import 'package:patient/router/router.dart';
import 'package:provider/provider.dart';

class DocInfoCardXl extends StatefulWidget {
  const DocInfoCardXl({super.key, required this.responseModel});
  final ServerResponseModel responseModel;

  //todo: accept doctor info
  //todo: translate component

  @override
  State<DocInfoCardXl> createState() => _DocInfoCardXlState();
}

class _DocInfoCardXlState extends State<DocInfoCardXl> {
  bool isHovering = false;
  late final ScrollController _controller;

  @override
  void initState() {
    _controller = ScrollController();
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void scrollNext() => scrollHorizontally(
        controller: _controller,
        direction: HorizontalScrollDirecion.next,
      );
  void scrollPrevious() => scrollHorizontally(
        controller: _controller,
        direction: HorizontalScrollDirecion.previous,
      );

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: MouseRegion(
        cursor: SystemMouseCursors.click,
        onEnter: (event) {
          setState(() {
            isHovering = true;
          });
        },
        onExit: (event) {
          setState(() {
            isHovering = false;
          });
        },
        child: InkWell(
          onTap: () {
            //todo: navigate to doctor profile page by id
            GoRouter.of(context).goNamed(
              AppRouter.docquery,
              pathParameters: {
                ...defaultPathParameters(context),
                "docid": widget.responseModel.doctor.synd_id.toString(),
              },
            );
          },
          child: Container(
            height: 350,
            decoration: BoxDecoration(
              color: isHovering ? Colors.green.shade100 : Colors.white,
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(30),
                topRight: Radius.circular(30),
              ),
            ),
            child: Row(
              children: [
                ///doctor image section
                DocImageXl(
                  doctor: widget.responseModel.doctor,
                ),
                const SizedBox(width: 10),

                ///doctor data section
                DocDataXl(
                  responseModel: widget.responseModel,
                ),
                const SizedBox(width: 10),

                ///Times Section
                ///row => expanded => column
                Expanded(
                  flex: 390,
                  child: Column(
                    children: [
                      const SizedBox(height: 40),

                      ///times cards && navigator
                      Expanded(
                        flex: 22,
                        child: Row(
                          children: [
                            const SizedBox(width: 10),
                            IconButton.outlined(
                              onPressed: scrollPrevious,
                              icon: const Icon(Icons.arrow_back),
                            ),
                            const SizedBox(width: 10),

                            ///times cards
                            Expanded(
                              child: ListView.builder(
                                //todo: replace with schedule generator
                                scrollDirection: Axis.horizontal,
                                controller: _controller,
                                itemCount:
                                    widget.responseModel.clinic.schedule.length,
                                itemBuilder: (context, index) {
                                  final schedule = widget
                                      .responseModel.clinic.schedule[index];
                                  return ScheduleCardXl(schedule: schedule);
                                },
                              ),
                            ),
                            const SizedBox(width: 10),
                            IconButton.outlined(
                              onPressed: scrollNext,
                              icon: const Icon(Icons.arrow_forward),
                            ),
                            const SizedBox(width: 10),
                          ],
                        ),
                      ),
                      Expanded(
                        flex: 13,
                        child: Column(
                          children: [
                            const SizedBox(height: 10),
                            //todo: accept reservation type
                            Builder(
                              builder: (context) {
                                final attendence =
                                    widget.responseModel.clinic.attendance;
                                return Text(
                                    attendanceFromBool(context, attendence));
                              },
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

String attendanceFromBool(BuildContext context, bool attendance) {
  final isEnglish = context.read<PxLocale>().isEnglish;
  return switch ((isEnglish, attendance)) {
    (true, true) => "Reservation required, first-come, first-served.",
    (false, true) => "الدكتور يتطلب الحجز, الدخول باسبقية الحضور.",
    (true, false) => "Reservation required, On Appointment.",
    (false, false) => "الدكتور يتطلب الحجز, الدخول بموعد مسبق.",
  };
}
