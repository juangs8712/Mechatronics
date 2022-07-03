import 'dart:convert';

import 'package:flutter/material.dart';

import '../../model/tile_model.dart';
import '../widget/tile_model_widget.dart';
import '../../utils/utils.dart' as utils;

// --------------------------------------------------------------------------
class LinksPage extends StatelessWidget {
  const LinksPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final String fileName =
        ModalRoute.of(context)!.settings.arguments as String;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Enlaces externos '),
      ),
      body: JsonContainWidget(fileName: fileName),
    );
  }
}

// --------------------------------------------------------------------------

class JsonContainWidget extends StatelessWidget {
  const JsonContainWidget({Key? key, required this.fileName}) : super(key: key);

  final String fileName;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
        child: FutureBuilder(

            // leer el contenido del fichero de los enlaces
            future: utils.readFileAsString(fileName),

            // Construir el Widget a mostrar segun sea necesario
            builder: (context, AsyncSnapshot<String?> snapshot) {
              if (!snapshot.hasData) {
                return const CircularProgressIndicator();
              } else {
                final json = jsonDecode(snapshot.data!);

                final items = TileList.fromJson(json).tileList;

                return SeparatedListView(items: items);
              }
            }),
      ),
    );
  }
}

// --------------------------------------------------------------------------

class SeparatedListView extends StatelessWidget {
  const SeparatedListView({Key? key, required this.items}) : super(key: key);

  final List<TileModel> items;

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
        physics: const BouncingScrollPhysics(),
        itemBuilder: (context, index) {
          return TileModelWidget(
            tileModel: items[index],
            iconData: Icons.link_outlined,
            onPressed: () {
              utils.launchInBrowser(Uri.parse(items[index].subtitle));
            },
          );
        },
        separatorBuilder: (context, index) {
          return const Divider();
        },
        itemCount: items.length);
  }
}
// --------------------------------------------------------------------------