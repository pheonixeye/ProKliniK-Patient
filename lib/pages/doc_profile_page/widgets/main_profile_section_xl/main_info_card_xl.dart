import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:patient/assets/assets.dart';
import 'package:patient/extensions/loc_ext.dart';
import 'package:patient/extensions/number_translator.dart';
import 'package:patient/functions/stars_from_double.dart';
import 'package:patient/models/server_response_model.dart';
import 'package:patient/providers/locale_px.dart';
import 'package:patient/theme/app_theme.dart';
import 'package:provider/provider.dart';

class MainInfoCardXl extends StatelessWidget {
  const MainInfoCardXl({super.key, required this.model});
  final ServerResponseModel model;

  @override
  Widget build(BuildContext context) {
    ///doctor profile main card
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16.0),
      child: Container(
        height: 235,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Consumer<PxLocale>(
          builder: (context, l, _) {
            return Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ///white lateral margin
                const SizedBox(width: 30),

                ///doctor image avatar
                Column(
                  children: [
                    ///white upper margin
                    const SizedBox(height: 15),
                    Container(
                      width: 125,
                      height: 125,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        image: DecorationImage(
                          image: AssetImage(
                            //TODO: fetch data from link
                            Assets.doctorAvatar(model.doctor.synd_id),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),

                ///white middle separator
                const SizedBox(width: 15),
                Expanded(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      ///white upper margin
                      const SizedBox(width: 15),

                      ///doctor main info title
                      ListTile(
                        contentPadding: const EdgeInsets.all(0),
                        title: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            children: [
                              Text.rich(
                                TextSpan(
                                  text: "${context.loc.doctor}  ",
                                  style: TextStyle(
                                    color: AppTheme.mainFontColor,
                                    fontSize: 12,
                                    fontWeight: FontWeight.w400,
                                  ),
                                  children: [
                                    TextSpan(
                                      text: l.isEnglish
                                          ? model.doctor.name_en
                                          : model.doctor.name_ar,
                                      style: TextStyle(
                                        color: AppTheme.mainFontColor,
                                        fontSize: 16,
                                        fontWeight: FontWeight.w700,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              const Spacer(),
                              Text(
                                "${model.doctor.views.toString().toArabicNumber(context)} ${context.loc.views}",
                                style: TextStyle(
                                  color: AppTheme.mainFontColor,
                                  fontSize: 14,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ],
                          ),
                        ),
                        subtitle: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            children: [
                              Expanded(
                                child: Text(
                                  l.isEnglish
                                      ? model.doctor.title_en
                                      : model.doctor.title_ar,
                                  style: TextStyle(
                                    color: AppTheme.mainFontColor,
                                    fontSize: 14,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),

                      ///doctor spec && rating summary
                      ListTile(
                        contentPadding: const EdgeInsets.all(0),
                        title: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text.rich(
                            TextSpan(
                              text: l.isEnglish
                                  ? model.doctor.speciality_en
                                  : model.doctor.speciality_ar,
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w500,
                                color: AppTheme.appBarColor,
                              ),
                              children: [
                                const TextSpan(text: " - "),
                                TextSpan(
                                  text: l.isEnglish
                                      ? model.doctor.degree_en
                                      : model.doctor.degree_ar,
                                  style: TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w300,
                                    color: AppTheme.mainFontColor,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        subtitle: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            children: [
                              ...model.doctor.rating.toStars(
                                  size: 32,
                                  padding: const EdgeInsets.only(left: 5)),
                              const SizedBox(width: 10),
                              Text(
                                "${context.loc.overallRating} ${context.loc.from} ${model.reviews.length.toString().toArabicNumber(context)} ${context.loc.visitors}",
                                style: TextStyle(
                                  color: AppTheme.mainFontColor,
                                  fontSize: 10,
                                ),
                              ),
                              const SizedBox(width: 10),
                              Expanded(
                                child: Text.rich(
                                  TextSpan(
                                      text: context.loc.showAllReviews,
                                      recognizer: TapGestureRecognizer()
                                        ..onTap = () {
                                          //TODO: Scroll to reviews
                                        }),
                                  style: TextStyle(
                                    color: AppTheme.appBarColor,
                                    fontSize: 10,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                ),

                ///white lateral margin
                const SizedBox(width: 30),
              ],
            );
          },
        ),
      ),
    );
  }
}