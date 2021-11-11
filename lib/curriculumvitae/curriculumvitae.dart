import 'dart:ui';
import 'package:flutter/material.dart';

class CurriculumVitae extends StatefulWidget {
  const CurriculumVitae({Key? key}) : super(key: key);
  @override
  _CurriculumVitaeState createState() => _CurriculumVitaeState();
}

class _CurriculumVitaeState extends State<CurriculumVitae> {
  List infoperson = [
    {
      'name': 'karar',
    }
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color(0xff0e1c36),
        appBar: AppBar(
          title: const Text('السير الذاتية'),
        ),
        body: ListView.builder(
          itemCount: infoperson.length,
          itemBuilder: (context, index) {
            return DataInfoPreson(
              dec: infoperson[index]['name'],
              id: 1,
              name: infoperson[index]['name'],
            );
          },
        ));
  }
}

class DataInfoPreson extends StatelessWidget {
  final int id;
  final String name;
  final String dec;
  const DataInfoPreson(
      {Key? key, required this.id, required this.name, required this.dec})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: Container(
        decoration: BoxDecoration(
            color: Colors.white, borderRadius: BorderRadius.circular(13)),
        height: 100,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            InkWell(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const CurriculumVitae(),
                    ));
              },
              child: ListTile(
                title: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(60),
                      child: Image.asset(
                        'image/agust.jpg',
                      ),
                    )
                  ],
                ),
                subtitle: const Text(
                  'Agust D ',
                  style: TextStyle(color: Colors.black),
                ),
                trailing: Text(
                  'قراء المزيد',
                  style: TextStyle(color: Colors.blue),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
