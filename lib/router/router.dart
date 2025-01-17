// ignore_for_file: non_constant_identifier_names

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:patient/pages/book_page/book_page.dart';
import 'package:patient/pages/contact_us_page/contact_us_page.dart';
import 'package:patient/pages/doc_profile_page/doc_profile_page.dart';
import 'package:patient/pages/error_page/error_page.dart';
import 'package:patient/pages/for_provider_page/for_provider_page.dart';
import 'package:patient/pages/homepage/homepage.dart';
import 'package:patient/pages/loading_root_page/loading_root_page.dart';
import 'package:patient/pages/pt_login_page/pt_login_page.dart';
import 'package:patient/pages/pt_signup_page/pt_signup_page.dart';
import 'package:patient/pages/review_submission_page/review_sub_page.dart';
import 'package:patient/pages/search_page/search_page.dart';
import 'package:patient/pages/shell_page/shell_page.dart';
import 'package:patient/pages/thank_you_page/thank_you_page.dart';
import 'package:patient/pages/under_construction/under_construction_page.dart';
import 'package:patient/pages/visit_update_page/visit_update_page.dart';
import 'package:patient/providers/doc_profile_px.dart';
import 'package:patient/providers/locale_px.dart';
import 'package:patient/providers/reviews_px.dart';
import 'package:patient/providers/search_px.dart';
import 'package:patient/providers/visit_update_px.dart';
import 'package:patient/router/meta_seo_helper.dart';
import 'package:patient/router/schema_org.dart';
import 'package:patient/utils/utils_keys.dart';
import 'package:patient/widgets/central_loading/central_loading.dart';
import 'package:proklinik_models/models/doctor.dart';
import 'package:proklinik_models/models/query_object.dart';
import 'package:provider/provider.dart';

const _langs = ["en", "ar"];

Map<String, String> defaultPathParameters(BuildContext context) {
  final lang = context.read<PxLocale>().lang;
  return {
    "lang": lang,
  };
}

/// GoRouter configuration
///
class AppRouter {
  AppRouter();
  static const String loading = "/";
  static const String home = ":lang";
  static const String src = "src";
  static const String book = "book";
  static const String signup = "signup";
  static const String login = "login";
  static const String forproviders = "forproviders";
  static const String contactus = "contactus";
  static const String docquery = "doc/:docid";
  static const String doc = "doc";
  static const String err = "404";
  //todo: thankyou page
  static const String thankyou = "thankyou";
  //todo: visit update / delete page
  static const String visit = "visit/:month/:year/:visit_id";
  //todo: review submission page
  static const String review = "review/:month/:year/:visit_id";
  static const String underconstruction = "underconstruction";

  static final router = GoRouter(
    refreshListenable: Listenable.merge(
      [
        PxLocale(),
        PxSearchController(
          query: QueryObject.empty(),
        ),
      ],
    ),
    navigatorKey: UtilsKeys.navigatorKey,
    initialLocation: loading,
    redirect: (context, state) {
      if (kDebugMode) {
        print(state.fullPath);
      }
      final lang = state.pathParameters['lang'];
      if (lang == null) {
        context.read<PxLocale>().setLang("en");
        return "/en${state.fullPath}";
      } else if (!_langs.contains(lang)) {
        context.read<PxLocale>().setLang("en");
        return "/en${state.fullPath}";
      } else {
        context.read<PxLocale>().setLang(lang);
        return null;
      }
    },
    errorPageBuilder: (context, state) {
      return MaterialPage(
        key: state.pageKey,
        child: ErrorPage(
          key: state.pageKey,
        ),
      );
    },
    routes: [
      GoRoute(
        path: loading,
        name: loading,
        builder: (context, state) {
          return LoadingRootPage(
            key: state.pageKey,
          );
        },
        routes: [
          ShellRoute(
            pageBuilder: (context, state, child) {
              final lang = state.pathParameters["lang"]!;

              ///schema-org tag injector
              final schemaOrg = SchemaOrgHelper(context);
              schemaOrg.init(lang);
              final key = ValueKey((lang, state.pageKey));
              return MaterialPage(
                child: ShellPage(
                  key: key,
                  child: child,
                ),
              );
            },
            routes: [
              GoRoute(
                name: home,
                path: home,
                builder: (context, state) {
                  final lang = state.pathParameters["lang"]!;
                  MetaTagsHelper tags = MetaTagsHelper(
                    lang: lang,
                    page: home,
                  );
                  tags.getTagsHomepage();
                  //#language path page
                  return HomePage(
                    key: state.pageKey,
                  );
                },
                routes: [
                  GoRoute(
                    //#visit update page
                    name: visit,
                    path: visit,
                    builder: (context, state) {
                      final visit_id = state.pathParameters['visit_id'];
                      final month = state.pathParameters['month'];
                      final year = state.pathParameters['year'];
                      if (visit_id == null || month == null || year == null) {
                        return ErrorPage(
                          key: state.pageKey,
                        );
                      } else {
                        final key = ValueKey('$month$year$visit_id');
                        return ChangeNotifierProvider(
                          key: key,
                          create: (context) => PxVisitUpdate(
                            visit_id: visit_id,
                            month: month,
                            year: year,
                          ),
                          child: VisitUpdatePage(
                            key: key,
                          ),
                        );
                      }
                    },
                  ),
                  GoRoute(
                    name: review,
                    path: review,
                    builder: (context, state) {
                      final visit_id = state.pathParameters['visit_id'];
                      final month = state.pathParameters['month'];
                      final year = state.pathParameters['year'];
                      if (visit_id == null || month == null || year == null) {
                        return ErrorPage(
                          key: state.pageKey,
                        );
                      } else {
                        final key = ValueKey('$month$year$visit_id');
                        return ChangeNotifierProvider(
                          key: key,
                          create: (context) => PxReviews(
                            month: month,
                            year: year,
                            visit_id: visit_id,
                          ),
                          child: ReviewSubmissionPage(
                            key: key,
                          ),
                        );
                      }
                    },
                  ),
                  GoRoute(
                    name: err,
                    path: err,
                    builder: (context, state) {
                      return ErrorPage(
                        key: state.pageKey,
                      );
                    },
                  ),
                  GoRoute(
                    name: underconstruction,
                    path: underconstruction,
                    builder: (context, state) {
                      return UnderConstructionPage(
                        key: state.pageKey,
                      );
                    },
                  ),
                  GoRoute(
                    path: signup,
                    name: signup,
                    builder: (context, state) {
                      return PatientSignUpPage(
                        key: state.pageKey,
                      );
                    },
                    redirect: (context, state) {
                      final lang = state.pathParameters["lang"];
                      return "/$lang/$underconstruction";
                    },
                  ),
                  GoRoute(
                    path: login,
                    name: login,
                    builder: (context, state) {
                      return PatientLoginPage(
                        key: state.pageKey,
                      );
                    },
                    redirect: (context, state) {
                      final lang = state.pathParameters["lang"];
                      return "/$lang/$underconstruction";
                    },
                  ),
                  GoRoute(
                    path: forproviders,
                    name: forproviders,
                    builder: (context, state) {
                      return ForProvidersPage(
                        key: state.pageKey,
                      );
                    },
                    redirect: (context, state) {
                      final lang = state.pathParameters["lang"];
                      return "/$lang/$underconstruction";
                    },
                  ),
                  GoRoute(
                    path: contactus,
                    name: contactus,
                    builder: (context, state) {
                      return ContactUsPage(
                        key: state.pageKey,
                      );
                    },
                  ),
                  GoRoute(
                    name: book,
                    path: book,
                    builder: (context, state) {
                      try {
                        //HACK:
                        final doctor = state.extra as Doctor?;
                        return BookPage(
                          key: state.pageKey,
                          doctor: doctor!,
                        );
                      } catch (e) {
                        return const ErrorPage();
                      }
                    },
                  ),
                  GoRoute(
                    name: thankyou,
                    path: thankyou,
                    builder: (context, state) {
                      return ThankYouPage(
                        key: state.pageKey,
                      );
                    },
                  ),
                  GoRoute(
                    path: doc,
                    name: doc,
                    builder: (context, state) {
                      return const CentralLoading();
                    },
                    redirect: (context, state) {
                      final lang = state.pathParameters["lang"];
                      return "/$lang/$err";
                    },
                  ),
                  GoRoute(
                    name: docquery,
                    path: docquery,
                    builder: (context, state) {
                      final query = state.pathParameters;
                      final docId = query["docid"];
                      if (docId == null || docId.isEmpty) {
                        throw Exception(
                            "Invalid Doctor Id.(from docquery route)");
                      }
                      final key = ValueKey((docId, state.pageKey));
                      return ChangeNotifierProvider(
                        key: key,
                        create: (context) => PxDocProfile(docId: docId),
                        child: DocProfilePage(
                          key: key,
                        ),
                      );
                    },
                  ),
                  GoRoute(
                    name: src,
                    path: src,
                    builder: (context, state) {
                      final query = state.uri.queryParameters;
                      final obj = QueryObject.fromJson(query);
                      final key = ValueKey((obj, state.pageKey));
                      if (kDebugMode) {
                        print("GoRoute($src)=$key");
                      }
                      return ChangeNotifierProvider(
                        key: key,
                        create: (context) => PxSearchController(
                          query: QueryObject.fromJson(query),
                        ),
                        builder: (context, child) {
                          return SearchPage(
                            key: key,
                          );
                        },
                      );
                    },
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    ],
  );
}
