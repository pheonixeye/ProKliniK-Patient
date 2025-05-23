import 'package:flutter/material.dart';
import 'package:proklinik_patient/extensions/is_mobile_context.dart';
import 'package:proklinik_patient/pages/search_page/pagination_row.dart';
import 'package:proklinik_patient/pages/search_page/widgets/doc_card_sm/doc_info_card_sm.dart';
import 'package:proklinik_patient/pages/search_page/widgets/doc_card_xl/doc_info_card_xl.dart';
import 'package:proklinik_patient/pages/search_page/widgets/filter_column/filter_column_xl.dart';
import 'package:proklinik_patient/pages/search_page/widgets/sorting_row/sorting_row_sm.dart';
import 'package:proklinik_patient/pages/search_page/widgets/sorting_row/sorting_row_xl.dart';
import 'package:proklinik_patient/providers/locale_px.dart';
import 'package:proklinik_patient/providers/search_px.dart';
import 'package:proklinik_patient/theme/app_theme.dart';
import 'package:proklinik_patient/widgets/central_loading/central_loading.dart';
import 'package:proklinik_patient/widgets/footer_section/footer_section.dart';
import 'package:proklinik_patient/widgets/no_results_found/no_results_found.dart';
import 'package:provider/provider.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  @override
  Widget build(BuildContext context) {
    return Consumer2<PxSearchController, PxLocale>(
      builder: (context, sc, l, _) {
        // while (sc.responseModel == null) {
        //   return const CentralLoading();
        // }
        // while (sc.responseModel != null && sc.responseModel!.isEmpty) {
        //   return const NoResultsFound();
        // }

        return Container(
          decoration: const BoxDecoration(
            color: AppTheme.greyBackgroundColor,
          ),
          child: ListView(
            cacheExtent: 3000,
            children: [
              Padding(
                padding: EdgeInsets.symmetric(
                  vertical: context.isMobile ? 8.0 : 24.0,
                ),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Spacer(flex: context.isMobile ? 1 : 100),
                    const FilterColumnXl(),
                    SizedBox(width: context.isMobile ? 0 : 20),
                    Expanded(
                      flex: 950,
                      child: Column(
                        //todo: generate by iteration
                        children: [
                          //todo: replace according to size
                          context.isMobile
                              ? const SortingRowSm()
                              : const SortingRowXl(),
                          if (sc.responseModel == null)
                            Padding(
                              padding: EdgeInsets.only(
                                top: context.isMobile ? 0 : 200.0,
                              ),
                              child: const CentralLoading(),
                            )
                          else if (sc.responseModel != null &&
                              sc.responseModel!.isEmpty)
                            Padding(
                              padding: EdgeInsets.only(
                                top: context.isMobile ? 0 : 100.0,
                              ),
                              child: const NoResultsFound(),
                            )
                          else
                            ...sc.responseModel!.map((response) {
                              return context.isMobile
                                  ? DocInfoCardSm(
                                      responseModel: response,
                                    )
                                  : DocInfoCardXl(
                                      responseModel: response,
                                    );
                            }),
                        ],
                      ),
                    ),
                    Spacer(flex: context.isMobile ? 1 : 100),
                  ],
                ),
              ),
              const PaginationRow(),
              const FooterSection(),
            ],
          ),
        );
      },
    );
  }
}
