import 'package:flutter/material.dart';

class FullSecraen extends StatelessWidget {
  // ignore: non_constant_identifier_names
  final String url_image;
  FullSecraen(this.url_image);
  @override
  Widget build(BuildContext context) {
    // _showreaust(context) {
    //   return showModalBottomSheet(
    //     shape: RoundedRectangleBorder(
    //         borderRadius: BorderRadius.only(
    //           topLeft: Radius.circular(25),
    //           topRight: Radius.circular(25),
    //         )),
    //     context: context,
    //     builder: (BuildContext bc) {
    //       return Container(
    //         padding: EdgeInsets.only(top: 20),
    //         child: ListView(
    //           children: [
    //             Column(
    //               children: [
    //                 Icon(
    //                   Icons.done_outline_rounded,
    //                   size: 70,
    //                   color: Colors.greenAccent,
    //                 ),
    //                 Text(
    //                   'شكرا الطلبك',
    //                   style: TextStyle(color: Colors.redAccent, fontSize: 24),
    //                 ),
    //                 Text(
    //                   'يمكن تتبيع الطلبات  الخاصة بك من خلال هذا الزر ',
    //                   style: TextStyle(fontSize: 17),
    //                 ),
    //                 Padding(padding: EdgeInsets.only(top: 80)),
    //                 Padding(
    //                   padding:
    //                   const EdgeInsets.only(top: 20, left: 12, right: 12),
    //                   child: Container(
    //                     height: 40,
    //                     width: MediaQuery.of(context).size.width,
    //                     child: MaterialButton(
    //                       elevation: 0,
    //                       color: Colors.red[200],
    //                       onPressed: () async {
    //                         // final status = await Permission.storage.request();
    //                         // var dir = await getApplicationDocumentsDirectory();
    //                         // if (status.isGranted) {
    //                         //   final taskId = await FlutterDownloader.enqueue(
    //                         //     url: url_image,
    //                         //     savedDir: dir.path,
    //                         //     showNotification:
    //                         //     true, // show download progress in status bar (for Android)
    //                         //     openFileFromNotification:
    //                         //     true, // click on notification to open downloaded file (for Android)
    //                         //   );
    //                         // } else {
    //                         //   print('object');
    //                         // }
    //                       },
    //                       shape: RoundedRectangleBorder(
    //                         borderRadius: BorderRadius.circular(12),
    //                       ),
    //                       child: Text(
    //                         'تنزيل الصورة',
    //                         style: TextStyle(color: Colors.white, fontSize: 19),
    //                       ),
    //                     ),
    //                   ),
    //                 ),
    //               ],
    //             )
    //           ],
    //         ),
    //       );
    //     },
    //   );
    // }

    return Container(
      decoration: BoxDecoration(
        image:
        DecorationImage(image: NetworkImage(url_image), fit: BoxFit.cover),
      ),
      child: Container(
        padding: EdgeInsets.only(top: 25),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            // GestureDetector(
            //   // onTap: () {
            //   //   _showreaust(context);
            //   // },
            //   // child: Icon(
            //   //   Icons.more_vert_sharp,
            //   //   size: 50,
            //   //   color: Colors.white,
            //   // ),
            // ),
          ],
        ),
      ),
    );
  }
}
