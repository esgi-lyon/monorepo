import 'package:abcleaverfront/screen/stats/statsServices.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class StatPage extends StatefulWidget {
  const StatPage({Key? key}) : super(key: key);

  @override
  State<StatPage> createState() => _StatePage();
}

class _StatePage extends State<StatPage> {
  @override
  void initState() {
    StatsServices.getStat(123).then((value) {
      print("QE ARE INSIDE THEN");
      var stats = value;
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          title: Text(
            'Statistiques',
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.all(12),
          child: Column(
            children: const [
              Card(
                child: ListTile(
                  title: Text('Nombre de partie effectué'),
                  trailing: Text('20'),
                ),
              ),
              Card(
                child: ListTile(
                  title: Text('Nombre de reponse correcte moyenne par partie'),
                  trailing: Text('12/12'),
                ),
              ),
              Card(
                child: ListTile(
                  title: Text(
                      'Nombre de parti avec un nombre de réponse correcte inférieur à la  moyenne'),
                  trailing: Text('12/12'),
                ),
              ),
              Card(
                child: ListTile(
                  title: Text('Temps de réponse par seconcde'),
                  trailing: Text('5 secondes'),
                ),
              ),
            ],
          ),
        ));
  }
}
