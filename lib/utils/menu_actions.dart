import 'package:flutter/material.dart';
import 'package:mechatronics/model/document_list_model.dart';

import '../router/router.dart';
import 'custom_path_provider.dart';

// ---------------------------------------------------------------------------
class MenuAction {
  static void listFiles(BuildContext context, String title, String rootPath) {
    DocumentModel docModel = DocumentModel(title: title, folderPath: rootPath);
    Navigator.of(context)
        .pushNamed(Flurorouter.documentList, arguments: docModel);
  }

  // -------------------------------------------------------------------------
  static void showLinksPage(BuildContext context, String? pathName) async {
    // crear el nombre del fichero a mostrar
    final fileName = CustomPathProvider.join(
        root: pathName ?? '', fileName: '/07_others/links.json');

    // verificar que exista el fichero terms.json,
    // en caso contrario salir sin navegar a la pagina
    if (!await CustomPathProvider.existsFile(context, fileName)) {
      return;
    }

    Navigator.of(context).pushNamed(Flurorouter.links, arguments: fileName);
  }

  // -------------------------------------------------------------------------
  static void showTermsPage(BuildContext context, String? pathName) async {
    //
    // crear el nombre del fichero a mostrar
    final fileName = CustomPathProvider.join(
        root: pathName ?? '', fileName: '/07_others/terms.json');

    // verificar que exista el fichero terms.json,
    // en caso contrario salir sin navegar a la pagina
    if (!await CustomPathProvider.existsFile(context, fileName)) return;

    Navigator.of(context).pushNamed(Flurorouter.terms, arguments: fileName);
  }
}
// ---------------------------------------------------------------------------
