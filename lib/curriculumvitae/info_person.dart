import 'package:btsworld/style/style.dart';
import 'package:flutter/material.dart';
// ignore: must_be_immutable
class InfoPerson extends StatelessWidget {

  int id;
  String name;
  String dec;
  String img;
  String live ;
  // ignore: non_constant_identifier_names
  String  technical_name;
  // ignore: non_constant_identifier_names
  String technical_abilities;
  String position_influence;
  String his_personal_life;
  // ignore: non_constant_identifier_names
  InfoPerson({Key? key ,
    required this.id ,
    required this.name ,
    required this.dec ,
    required this.img ,
    required this.live ,
    required this.technical_name  ,
    required this.technical_abilities ,
    required this.position_influence ,
    required this.his_personal_life

  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff0e1c36),
      appBar: AppBar(
        backgroundColor: const Color(0xff0e1c36),
        elevation: 0,
        centerTitle: true,
      ),
      body: ListView(
        children: [
             Column(
               children: [
               const  SizedBox(height: 15,) ,
                 Container(
                     width: 100,
                     height: 100,
                     decoration:  BoxDecoration(
                         shape: BoxShape.circle,
                         image:  DecorationImage(
                             fit: BoxFit.fill,
                             image: AssetImage(   img )
                         )
                     ))  ,

                 Padding(
                   padding: const EdgeInsets.all(16),
                   child: Text(name , style:text_style_info_person_name,),
                 )  ,

                 dec !=  ''   ? ExpansionTile(
                   collapsedIconColor: Colors.white,
                   collapsedTextColor:  Colors.white,
                   textColor: Colors.white,
                   iconColor: Colors.white,
                   title: Text('$name من هو '  ,style: text_style_info_person, textAlign: TextAlign.end,),
                   children: <Widget>[
                     Padding(
                       padding: const EdgeInsets.all(9),
                       child: Text(
                         dec,  style:text_style_info_person,
                         textAlign: TextAlign.start,
                         textDirection: TextDirection.rtl,
                       ),
                     ),

                   ],
                 ) :Text(''),
                 live !=  ''   ? ExpansionTile(
                   collapsedIconColor: Colors.white,
                   collapsedTextColor:  Colors.white,
                   textColor: Colors.white,
                   iconColor: Colors.white,
                   title:  Text('حياته ومسيرته'  ,style: text_style_info_person, textAlign: TextAlign.end,),
                   children: <Widget>[
                     Padding(
                       padding: const EdgeInsets.all(9),
                       child: Text(
                          live,  style: text_style_info_person,
                         textAlign: TextAlign.start,
                         textDirection: TextDirection.rtl,
                       ),
                     ),

                   ],
                 ) :Text(''),
                 technical_name !=  ''   ? ExpansionTile(
                   collapsedIconColor: Colors.white,
                   collapsedTextColor:  Colors.white,
                   textColor: Colors.white,
                   iconColor: Colors.white,
                   title:  Text('الاسم الفني'  ,style: text_style_info_person, textAlign: TextAlign.end,),
                   children: <Widget>[
                     Padding(
                       padding: const EdgeInsets.all(9),
                       child: Text(
                         technical_name,  style: text_style_info_person,
                         textAlign: TextAlign.start,
                         textDirection: TextDirection.rtl,
                       ),
                     ),

                   ],
                 ):  Text(''),
                 technical_abilities !=  ''   ?  ExpansionTile(
                   collapsedIconColor: Colors.white,
                   collapsedTextColor:  Colors.white,
                   textColor: Colors.white,
                   iconColor: Colors.white,
                   title:  Text('قدراته الفنية'  ,style: text_style_info_person, textAlign: TextAlign.end,),
                   children: <Widget>[
                     Padding(
                       padding: const EdgeInsets.all(9),
                       child: Text(
                         technical_abilities,  style: text_style_info_person,
                         textAlign: TextAlign.start,
                         textDirection: TextDirection.rtl,
                       ),
                     ),

                   ],
                 ) :  Text(''),
                 position_influence !=  ''   ?  ExpansionTile(
                   collapsedIconColor: Colors.white,
                   collapsedTextColor:  Colors.white,
                   textColor: Colors.white,
                   iconColor: Colors.white,
                   title:  Text('مكانته وتأثيره'  ,style: text_style_info_person, textAlign: TextAlign.end,),
                   children: <Widget>[
                     Padding(
                       padding: const EdgeInsets.all(9),
                       child: Text(
                         position_influence,  style:text_style_info_person,
                         textAlign: TextAlign.start,
                         textDirection: TextDirection.rtl,
                       ),
                     ),

                   ],
                 )  :  Text(''),
                 his_personal_life  !=  ''   ?    ExpansionTile(
                   collapsedIconColor: Colors.white,
                   collapsedTextColor:  Colors.white,
                   textColor: Colors.white,
                   iconColor: Colors.white,
                   title:  Text('حياته الشخصية'  ,style: text_style_info_person, textAlign: TextAlign.end,),
                   children: <Widget>[
                     Padding(
                       padding: const EdgeInsets.all(9),
                       child: Text(
                         his_personal_life,  style: text_style_info_person,
                         textAlign: TextAlign.start,
                         textDirection: TextDirection.rtl,
                       ),
                     ),

                   ],
                 ) :  Text(''),
               ],
             ) ,

        ],
      ),
    );
  }
}
