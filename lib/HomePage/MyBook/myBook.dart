import 'package:epub_view/epub_view.dart';
import 'package:flutter/material.dart';
import 'dart:typed_data';

import 'package:flutter/material.dart';
 import 'package:flutter/services.dart' show rootBundle;



class MyBook extends StatefulWidget {
  const MyBook({ Key? key }) : super(key: key);

  @override
  _MyBookState createState() => _MyBookState();
}

class _MyBookState extends State<MyBook> {
  @override
   
Future<Uint8List> _loadFromAssets(String assetName) async {
  final bytes = await rootBundle.load(assetName);
  return bytes.buffer.asUint8List();
}

late EpubController _epubController;

@override
void initState() {
  _epubController = EpubController(
    // Load document
    document: EpubReader.readBook(_loadFromAssets('assets/book.epub')),
    // Set start point
    epubCfi: 'epubcfi(/6/6[chapter-2]!/4/2/1612)',
  );
  super.initState();
}

@override
Widget build(BuildContext context) => Scaffold(
  appBar: AppBar(
    // Show actual chapter name
    title: EpubActualChapter(
      controller: _epubController,
      builder: (chapterValue) => Text(
        'Chapter ${chapterValue?.chapter?.Title ?? ''}',
        textAlign: TextAlign.start,
      ),
    ),
  ),
  // Show table of contents
 // drawer: Drawer(
   // child: EpubReaderTableOfContents(
     // controller: _epubController,
   // ),
 // ),
  // Show epub document
  body: EpubView(
    controller: _epubController,
  ));
}
 