import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:patient/extensions/is_mobile_context.dart';
import 'package:patient/extensions/loc_ext.dart';
import 'package:patient/providers/locale_px.dart';
import 'package:patient/router/router.dart';
import 'package:patient/theme/app_theme.dart';
import 'package:proklinik_models/models/query_object.dart';
import 'package:provider/provider.dart';

const _specialities = [
  {"en": "Dermatology", "ar": "الجلدية"},
  {"en": "Dentistry", "ar": "الاسنان"},
  {"en": "Psychiatry", "ar": "النفسية"},
  {"en": "Pediatrics", "ar": "الاطفال"},
  {"en": "Neurology", "ar": "مخ و اعصاب"},
  {"en": "Orthopedics", "ar": "العظام"},
  {"en": "Gynecology", "ar": "نسا و توليد"},
  {"en": "Otolaryngology", "ar": "انف و اذن و حنجرة"},
];

class SpecialityRow extends StatelessWidget {
  const SpecialityRow({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: AppTheme.greyBackgroundColor,
      ),
      height: 350,
      width: MediaQuery.sizeOf(context).width,
      child: Column(
        children: [
          const SizedBox(height: 10),
          Row(
            children: [
              SizedBox(width: context.isMobile ? 40 : 100),
              Text(
                context.loc.bookBySpeciality,
                style: TextStyle(
                  fontSize: context.isMobile ? 18 : 42,
                  fontWeight:
                      context.isMobile ? FontWeight.w500 : FontWeight.bold,
                  color: AppTheme.mainFontColor,
                ),
              ),
            ],
          ),
          const SizedBox(height: 10),
          Expanded(
            child: Consumer<PxLocale>(
              builder: (context, l, _) {
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        ..._specialities.map((x) {
                          return Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: InkWell(
                              mouseCursor: SystemMouseCursors.click,
                              onTap: () {
                                //todo: search by spec
                                GoRouter.of(context).goNamed(
                                  AppRouter.src,
                                  pathParameters:
                                      defaultPathParameters(context),
                                  queryParameters:
                                      QueryObject.nonFiltered(spec: x["en"]!)
                                          .toJson(),
                                );
                              },
                              child: Container(
                                width: 300,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(16),
                                  color: Colors.white,
                                ),
                                child: Column(
                                  children: [
                                    Expanded(
                                      child: Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: SvgPicture.asset(
                                          "assets/images/speciality_row/${x["en"]?.toLowerCase()}.svg",
                                          matchTextDirection: true,
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      height: 80,
                                      child: Center(
                                        child: Text(
                                          l.isEnglish ? x["en"]! : x["ar"]!,
                                          style: TextStyle(
                                            fontSize: 32,
                                            fontWeight: FontWeight.normal,
                                            color: AppTheme.mainFontColor,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          );
                        }),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
