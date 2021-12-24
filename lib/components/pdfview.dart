// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:pdfdownload/pdfdownload.dart';
//
// class PDFViewerFromUrl extends StatelessWidget {
//   const PDFViewerFromUrl({Key key,  this.url}) : super(key: key);
//
//   final String url;
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('PDF DownLoand Page'),
//         backgroundColor: Color(0xff003cb3),
//         actions: [
//           Padding(
//             padding: const EdgeInsets.only(right:15.0),
//             child: DownloandPdf(
//               isUseIcon: true,
//               pdfUrl:
//               'https://www.panthercountry.org/userfiles/358/Classes/4914/NOUN%20Clause%20Practice.pdf',
//               fileNames: 'TestDownload.pdf',
//               color: Colors.white,
//             ),
//           ),
//         ],
//       ),
//       body: Center(
//         child: DownloandPdf(
//           pdfUrl:
//           'http://www.espressoenglish.net/wp-content/uploads/2012/07/Free-Grammar-Ebook-Level-2.pdf',
//           fileNames: 'TestDownload.pdf',
//           color: Theme.of(context).primaryColor,
//         ),
//       ),
//     );
//   }
// }
//
// // import 'dart:io';
// // import 'package:downloads_path_provider/downloads_path_provider.dart';
// // import 'package:flutter/material.dart';
// // import 'package:dio/dio.dart';
// // import 'package:open_file/open_file.dart';
// // import 'package:path_provider/path_provider.dart';
// // import 'dart:async';
// // import 'package:permission_handler/permission_handler.dart';
// // import 'package:intl/intl.dart';
// //
// // void main() => runApp(Downloader());
// //
// // class Downloader extends StatelessWidget {
// //   @override
// //   Widget build(BuildContext context) => MaterialApp(
// //     title: "File Downloader",
// //     debugShowCheckedModeBanner: false,
// //     home: FileDownloader(),
// //     theme: ThemeData(primarySwatch: Colors.blue),
// //   );
// // }
// //
// // class FileDownloader extends StatefulWidget {
// //   @override
// //   _FileDownloaderState createState() => _FileDownloaderState();
// // }
// //
// // class _FileDownloaderState extends State<FileDownloader> {
// //
// //   final pdfUrl = "https://www.w3.org/WAI/ER/tests/xhtml/testfiles/resources/pdf/dummy.pdf";
// //
// //   bool downloading = false;
// //   var progress = "";
// //   var path = "No Data";
// //   var platformVersion = "Unknown";
// //   var _onPressed;
// //   Directory externalDir;
// //
// //   @override
// //   void initState() {
// //     super.initState();
// //     downloadFile();
// //   }
// //
// //   String convertCurrentDateTimeToString() {
// //     String formattedDateTime =
// //     DateFormat('yyyyMMdd_kkmmss').format(DateTime.now()).toString();
// //     return formattedDateTime;
// //   }
// //
// //   Future<void> downloadFile() async {
// //     Dio dio = Dio();
// //
// //
// //     final status = await Permission.storage.request();
// //     if (status.isGranted) {
// //       String dirloc = "";
// //       if (Platform.isAndroid) {
// //         Directory downloadsDirectory = await  DownloadsPathProvider.downloadsDirectory;
// //
// //         print("gotdownloadpath ${(await getApplicationDocumentsDirectory()).path}");
// //
// //         dirloc = (await getApplicationDocumentsDirectory()).path;
// //       } else {
// //         dirloc = (await getApplicationDocumentsDirectory()).path;
// //       }
// //
// //       try {
// //         // FileUtils.mkdir([dirloc]);
// //
// //
// //         await dio.download(pdfUrl, dirloc + convertCurrentDateTimeToString() + ".pdf",
// //             onReceiveProgress: (receivedBytes, totalBytes) {
// //               print('here 1');
// //               setState(() {
// //                 downloading = true;
// //                 progress = ((receivedBytes / totalBytes) * 100).toStringAsFixed(0) + "%";
// //                 print(progress);
// //               });
// //               print('here 2');
// //             });
// //       } catch (e) {
// //         print('catch catch catch');
// //         print(e);
// //       }
// //
// //       setState(() {
// //         downloading = false;
// //         progress = "Download Completed.";
// //         path = dirloc + convertCurrentDateTimeToString() + ".pdf";
// //       });
// //       await OpenFile.open(path).catchError((e){print("error $e");});
// //       print(path);
// //       print('here give alert-->completed');
// //     } else {
// //       setState(() {
// //         progress = "Permission Denied!";
// //         _onPressed = () {
// //           downloadFile();
// //         };
// //       });
// //     }
// //   }
// //
// //   @override
// //   Widget build(BuildContext context) => Scaffold(
// //       appBar: AppBar(
// //         title: Text('File Downloader'),
// //       ),
// //       body: Center(
// //           child: downloading
// //               ? Container(
// //             height: 120.0,
// //             width: 200.0,
// //             child: Card(
// //               color: Colors.black,
// //               child: Column(
// //                 mainAxisAlignment: MainAxisAlignment.center,
// //                 children: <Widget>[
// //                   CircularProgressIndicator(),
// //                   SizedBox(
// //                     height: 10.0,
// //                   ),
// //                   Text(
// //                     'Downloading File: $progress',
// //                     style: TextStyle(color: Colors.white),
// //                   ),
// //                 ],
// //               ),
// //             ),
// //           )
// //               : Column(
// //             mainAxisAlignment: MainAxisAlignment.center,
// //             children: <Widget>[
// //               Text(path),
// //               MaterialButton(
// //                 child: Text('Request Permission Again.'),
// //                 onPressed: _onPressed,
// //                 disabledColor: Colors.blueGrey,
// //                 color: Colors.pink,
// //                 textColor: Colors.white,
// //                 height: 40.0,
// //                 minWidth: 100.0,
// //               ),
// //             ],
// //           )));
// // }
