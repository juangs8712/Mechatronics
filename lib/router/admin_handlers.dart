import 'package:fluro/fluro.dart';

import '../ui/pages/document_list_page.dart';
import '../ui/pages/links_page.dart';
import '../ui/pages/pdf_viewer_widget.dart';
import '../ui/pages/terms_page.dart';
import '../ui/views/home_view.dart';

class AdminHandlers {
  static Handler home = Handler(handlerFunc: (context, params) {
    return const HomeView();
  });

  static Handler pdfViewer = Handler(handlerFunc: (context, params) {
    return const PdfViewerWidget();
  });

  static Handler docList = Handler(handlerFunc: (context, params) {
    return const DocumentListPage();
  });

  static Handler links = Handler(handlerFunc: (context, params) {
    return const LinksPage();
  });

  static Handler terms = Handler(handlerFunc: (context, params) {
    return const TermsPage();
  });
}
