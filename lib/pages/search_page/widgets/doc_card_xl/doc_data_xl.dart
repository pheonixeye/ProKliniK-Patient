import 'package:flutter/material.dart';
import 'package:proklinik_patient/extensions/loc_ext.dart';
import 'package:proklinik_patient/extensions/number_translator.dart';
import 'package:proklinik_patient/functions/stars_from_num.dart';
import 'package:proklinik_patient/models/search_response_model/search_response_model.dart';
import 'package:proklinik_patient/pages/search_page/widgets/doc_card_sm/tags_row.dart';
import 'package:proklinik_patient/providers/locale_px.dart';
import 'package:proklinik_patient/theme/app_theme.dart';
import 'package:provider/provider.dart';

class DocDataXl extends StatelessWidget {
  const DocDataXl({super.key, required this.responseModel});
  final SearchResponseModel responseModel;

  //todo: accept doctor data and rating overall

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 400,
      child: Consumer<PxLocale>(
        builder: (context, l, _) {
          return Column(
            children: [
              const SizedBox(height: 38),
              ListTile(
                contentPadding: const EdgeInsets.all(0),
                title: Text.rich(
                  TextSpan(
                    text: context.loc.doctor,
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                      color: Colors.green.shade500,
                    ),
                    children: [
                      const TextSpan(text: " "),
                      TextSpan(
                        text: l.isEnglish
                            ? responseModel.doctor.name_en
                            : responseModel.doctor.name_ar,
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
                          color: Colors.green.shade800,
                        ),
                      ),
                    ],
                  ),
                ),
                subtitle: Text(
                  l.isEnglish
                      ? responseModel.doctor.title_en
                      : responseModel.doctor.title_ar,
                  style: TextStyle(
                    color: AppTheme.mainFontColor,
                  ),
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              ListTile(
                contentPadding: const EdgeInsets.all(0),
                title: Row(
                  children: [
                    //todo: generate star row from double rating

                    if (responseModel.doctor_website_info.average_rating == 0)
                      ...5.0.toStars()
                    else
                      ...responseModel.doctor_website_info.average_rating
                          .toStars(),
                  ],
                ),
                //todo: fetch from ratings
                subtitle: responseModel.doctor_website_info.reviews_count != 0
                    ? Text(
                        "${context.loc.overallRating} ${context.loc.from} ${responseModel.doctor_website_info.reviews_count.toString().toArabicNumber(context)} ${context.loc.visitors}",
                        style: TextStyle(
                          fontSize: 10,
                          color: AppTheme.mainFontColor,
                        ),
                      )
                    : Text(
                        context.loc.joinedRecently,
                        style: TextStyle(
                          fontSize: 10,
                          color: AppTheme.mainFontColor,
                        ),
                      ),
              ),
              const SizedBox(height: 10),
              SecondaryDataItemXl(
                iconData: Icons.medical_services,
                title: context.loc.specTitle,
                data: l.isEnglish
                    ? responseModel.doctor.speciality.name_en
                    : responseModel.doctor.speciality.name_ar,
              ),
              //todo: fetch from selected clinic
              SecondaryDataItemXl(
                iconData: Icons.pin_drop,
                title: l.isEnglish
                    ? "${responseModel.clinic.city.name_en} : "
                    : "${responseModel.clinic.city.name_ar} : ",
                data: l.isEnglish
                    ? responseModel.clinic.address_en
                    : responseModel.clinic.address_ar,
              ),
              //todo: fetch fees from selected clinic
              SecondaryDataItemXl(
                iconData: Icons.monetization_on,
                title: context.loc.feesTitle,
                data:
                    "${responseModel.clinic.consultation_fees.toString().toArabicNumber(context)} ${context.loc.pound}",
              ),
              //todo: fetch from selected clinic
              SecondaryDataItemXl(
                iconData: Icons.timer,
                title: context.loc.waitingTimeTitle,
                data:
                    "${responseModel.clinic_waiting_time.toString().toArabicNumber(context)} ${context.loc.minutes}",
              ),
              SecondaryDataItemXl(
                iconData: Icons.phone,
                title: context.loc.ourHotlineTitle.toArabicNumber(context),
                data: context.loc.costRegularSubtitle,
              ),
              TagsRowXlSm(
                tags: responseModel.doctor_website_info.tags,
              ),
            ],
          );
        },
      ),
    );
  }
}

class SecondaryDataItemXl extends StatelessWidget {
  const SecondaryDataItemXl({
    super.key,
    required this.iconData,
    required this.title,
    required this.data,
  });
  final IconData iconData;
  final String title;
  final String data;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 2.5),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(iconData, size: 16),
          const SizedBox(width: 10),
          Expanded(
            child: Text.rich(
              TextSpan(
                text: title,
                style: TextStyle(
                  color: AppTheme.mainFontColor,
                ),
                children: [
                  TextSpan(
                    text: data,
                    style: TextStyle(
                      color: Colors.green.shade500,
                    ),
                  ),
                ],
              ),
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ],
      ),
    );
  }
}
