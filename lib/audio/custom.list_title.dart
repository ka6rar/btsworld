import 'package:flutter/material.dart';

Widget customListTole({String? title, String? singer, String? covers, onTap}) {
  return InkWell(
    onTap: onTap,
    child: Container(
      padding: const EdgeInsets.all(8),
      child: Row(
        children: [
          Container(
            height: 80.0,
            width: 80.0,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                image: DecorationImage(
                  image: NetworkImage( covers.toString() ),
                  fit: BoxFit.cover,
                )),
          ),
          const SizedBox(width: 10),
          Column(
            crossAxisAlignment:CrossAxisAlignment.start ,
            children: [
              Text(
                title.toString(),
                style: const TextStyle(
                  fontSize: 18.0,
                  fontWeight: FontWeight.w300,
                    color: Colors.white  ,
                    fontFamily: "Gafata"


                ),
              ),
              const SizedBox(width: 5),
              Text(
                singer.toString(),
                style: const TextStyle(color: Colors.grey, fontSize: 16.0 ,
                    fontWeight: FontWeight.w300,
                    fontFamily: "Gafata"),
              )
            ],
          )
        ],
      ),
    ),
  );
}
