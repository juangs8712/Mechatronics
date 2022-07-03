import 'dart:io';

import 'package:flutter/material.dart';

import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';

class PdfViewerWidget extends StatelessWidget {
  const PdfViewerWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final String path = ModalRoute.of(context)!.settings.arguments.toString();
    return Container(child: SfPdfViewer.file(File(path)));
  }
}
