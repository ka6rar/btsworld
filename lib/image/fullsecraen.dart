import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_cache_manager/flutter_cache_manager.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_downloader/image_downloader.dart';
import 'package:path_provider/path_provider.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:wallpaper_manager_flutter/wallpaper_manager_flutter.dart';



// ignore: must_be_immutable
class FullSecraen extends StatefulWidget {
   String url_image;
  FullSecraen(this.url_image, {Key? key}) : super(key: key);

  @override
  _FullSecraenState createState() => _FullSecraenState();
}

class _FullSecraenState extends State<FullSecraen> {

  int _progress = 0;
  bool  clickprogress = false ;

  @override
  void initState() {
    super.initState();
    ImageDownloader.callback(onProgressUpdate: (String? imageId,  int progress ) {
      setState(() {
        _progress = progress ;
      });
    });
  }




  @override
  Widget build(BuildContext context) {

    // Image Dimensions are 2400 x 3598
    Future<void> _setwallpaper(location) async {
      var file = await DefaultCacheManager().getSingleFile(widget.url_image);
      try {
        WallpaperManagerFlutter().setwallpaperfromFile(file, location);
        ScaffoldMessenger.of(context).showSnackBar(
        const   SnackBar(
            content: Text('تم تحديث الخلفية'),
          ),
        );
      } catch (e) {
        ScaffoldMessenger.of(context).showSnackBar(
         const  SnackBar(
            content: Text('خطأ في إعداد الخلفية'),
          ),
        );
        print(e);
      }
    }

    return Scaffold(
     body:  Stack(
       children: [
         Container(
           decoration: BoxDecoration(
             image:
             DecorationImage(image: NetworkImage(widget.url_image), fit: BoxFit.cover),
           ),
           child: Container(
             width: MediaQuery.of(context).size.width  ,
             padding: const  EdgeInsets.only(top: 34 ),
             child: Column(
               crossAxisAlignment: CrossAxisAlignment.end,
               children: [
                 PopupMenuButton(
                   padding: const  EdgeInsets.only(right: 36, top:  10),
                   icon: const   Padding(
                     padding:  EdgeInsets.only(right: 90),
                     child:  Icon(Icons.menu , size: 40  ,  color: Colors.white,),
                   ),
                   itemBuilder: (context) => [
                     PopupMenuItem(
                       onTap: () async{
                         final status = await Permission.storage.request();
                         if(status.isGranted) {
                           final externalDir = await getExternalStorageDirectory();
                           try {
                             setState(() {
                               clickprogress = true;
                             });
                             // Saved with this method.
                             var imageId = await ImageDownloader.downloadImage(widget.url_image);
                             if (imageId == null) {
                               return;
                             }
                             // Below is a method of obtaining saved image information.
                             var fileName = await ImageDownloader.findName(widget.url_image);
                             var path = await ImageDownloader.findPath(widget.url_image);
                             var size = await ImageDownloader.findByteSize(widget.url_image);
                             var mimeType = await ImageDownloader.findMimeType(widget.url_image);
                           } on PlatformException catch (error) {
                             print(error);
                           }


                         } else {
                            // ignore: avoid_print
                            print('Permission Denied');
                         }
                       },
                       child: Row(
                         crossAxisAlignment: CrossAxisAlignment.center,
                         mainAxisAlignment: MainAxisAlignment.end,
                         children:  [
                           Text("تنزيل الصورة"   , style: GoogleFonts.cairo()) ,
                           const Icon(Icons.arrow_downward_outlined , color: Colors.indigoAccent,) ,
                         ],
                       ),
                     ),

                     PopupMenuItem(
                       onTap: () {
                      _setwallpaper(WallpaperManagerFlutter.HOME_SCREEN);
                       },
                         child:Column(
                           children: [
                             Text('تعين كخلفية' , style: GoogleFonts.cairo())  ,
                             Row(
                               crossAxisAlignment: CrossAxisAlignment.center,
                               mainAxisAlignment: MainAxisAlignment.end,
                               children: [
                                 Text("الشاشة الرئيسية "  , style: GoogleFonts.cairo()),
                                 const Icon(Icons.home_outlined , color: Colors.indigoAccent,)
                               ],
                             ),
                           ],
                         ) ,
                         
                     ),
                   PopupMenuItem(
                     onTap: () {
                       _setwallpaper(WallpaperManagerFlutter.LOCK_SCREEN);
                     },
                     child:
                      Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Text("شاشة التأمين"  , style: GoogleFonts.cairo()),
                        const Icon(Icons.screen_lock_portrait_outlined , color: Colors.indigoAccent,)
                     ],
                     ) ,
                    )  ,
                     PopupMenuItem(
                       onTap: () {
                         _setwallpaper(WallpaperManagerFlutter.BOTH_SCREENS);
                       },
                         child: Row(
                       crossAxisAlignment: CrossAxisAlignment.center,
                       mainAxisAlignment: MainAxisAlignment.end,
                       children: [
                         Text(" كلاهما"  , style: GoogleFonts.cairo()),
                         const Icon(Icons.phone_android_outlined , color: Colors.indigoAccent,)
                       ],
                     ))
                   ],
                 )  ,



               ],
             ),
           ),
         ),

         if(clickprogress == true)
         Center(
           child: CircularPercentIndicator(
             radius: 70.0,
             lineWidth: 4.0,
             percent: _progress / 100 ,
             center:  Text(_progress.toString() , style: const  TextStyle(fontSize: 24 , color: Colors.green),),
             progressColor: Colors.green,
           ),
         ),

       ],
     )
   );



  }




}

