// ignore_for_file: unnecessary_new

import 'package:fluro/fluro.dart';
import 'package:mechatronics/router/admin_handlers.dart';

import 'no_page_found_handlers.dart';

class Flurorouter {
  static final FluroRouter router = new FluroRouter();

  static String rootRoute = '/';
  // Auth router
  static String homeRoute = '/home';

  // dashboard
  static String dashboardRoute = '/dashboard';

  static String pdfViewer = '/pdf_viewer';

  static String documentList = '/doc_list';

  static String links = '/links';

  static String terms = '/terms';

  static void configureRoute() {
    // Auth routes
    router.define(rootRoute,
        handler: AdminHandlers.home, transitionType: TransitionType.none);

    router.define(homeRoute,
        handler: AdminHandlers.home, transitionType: TransitionType.none);

    router.define(pdfViewer,
        handler: AdminHandlers.pdfViewer, transitionType: TransitionType.none);

    router.define(documentList,
        handler: AdminHandlers.docList, transitionType: TransitionType.none);

    router.define(links,
        handler: AdminHandlers.links, transitionType: TransitionType.none);

    router.define(terms,
        handler: AdminHandlers.terms, transitionType: TransitionType.none);

    // 404
    router.notFoundHandler = NoPageFoundHandlers.noPageFound;
  }
}
