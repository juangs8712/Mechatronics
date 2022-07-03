import 'package:flutter/material.dart';
import 'package:mechatronics/model/document_list_model.dart';
import 'dart:io';

import 'package:mechatronics/model/list_file_model.dart';
import 'package:mechatronics/router/router.dart';
import 'package:url_launcher/url_launcher.dart';

import '../widget/custom_buttons.dart';

// -----------------------------------------------------------------------------
class DocumentListPage extends StatelessWidget {
  const DocumentListPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final DocumentModel docModel =
        ModalRoute.of(context)!.settings.arguments as DocumentModel;

    final String folderPath = docModel.folderPath;
    final fileList = ListFileModel.listFiles(folderPath);

    return Scaffold(
      appBar: AppBar(
        title: Text(docModel.title),
      ),
      body: DocumentListBody(fileList: fileList),
    );
  }
}

// --------------------------------------------------------------------------
class DocumentListBody extends StatelessWidget {
  const DocumentListBody({
    Key? key,
    required this.fileList,
  }) : super(key: key);

  final Future<List<File>> fileList;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: fileList,
      builder: (BuildContext context, AsyncSnapshot<List<File>> snapshot) {
        if (!snapshot.hasData) {
          return const Center(child: CircularProgressIndicator());
        } else {
          if (snapshot.data!.isEmpty) {
            return const _NoDocuments();
          }
          return ListView(
            physics: const BouncingScrollPhysics(),
            children:
                snapshot.data!.map((e) => _DocumentWidget(file: e)).toList(),
          );
        }
      },
    );
  }
}

// --------------------------------------------------------------------------
// Widget para indicar que no hay documentos para listar en esa seccion
class _NoDocuments extends StatelessWidget {
  const _NoDocuments({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
          padding: const EdgeInsets.all(15),
          margin: const EdgeInsets.symmetric(horizontal: 20),
          width: double.infinity,
          height: 70,
          decoration: _containerDecoration(),
          child: Row(
            children: <Widget>[
              Icon(Icons.no_sim_outlined,
                  size: 40, color: Colors.black.withOpacity(0.5)),
              Expanded(
                child: Text(
                  'No hay documentos a mostrar en este directorio.',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontSize: 16, color: Colors.black.withOpacity(0.7)),
                ),
              ),
            ],
          )),
    );
  }
}

// --------------------------------------------------------------------------

// Mostrar la informacion correspondiente a un documento
class _DocumentWidget extends StatelessWidget {
  const _DocumentWidget({Key? key, required this.file}) : super(key: key);

  final File file;

  @override
  Widget build(BuildContext context) {
    // obtener el nombre del fichero
    int index = file.path.lastIndexOf(Platform.pathSeparator);
    String? fileName;
    if (index == -1) {
      fileName = file.path;
    } else {
      fileName = file.path.substring(index + 1);
    }

    // eliminar la extension del fichero
    index = fileName.lastIndexOf('.');
    if (index != -1) {
      fileName = fileName.substring(0, index);
    }

    return Container(
      width: double.infinity,
      height: 75,
      child: CardButton(
          iconData: Icons.file_present,
          text: fileName,
          onPressed: () {
            Navigator.pushNamed(context, Flurorouter.pdfViewer,
                arguments: file.path);
          }),
    );
  }
}
// --------------------------------------------------------------------------

BoxDecoration _containerDecoration() {
  return BoxDecoration(
    color: Colors.white,
    borderRadius: BorderRadius.circular(20),
    boxShadow: <BoxShadow>[
      BoxShadow(
          color: Colors.black.withOpacity(0.2),
          offset: const Offset(4, 6),
          blurRadius: 10.0)
    ],
  );
}

// --------------------------------------------------------------------------