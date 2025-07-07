import 'package:quran_test/data/database.dart';

typedef Segment = ({Ayah from, Ayah to});

class TemplateModel {
  final int id;
  final String name;
  final List<Segment> segments;

  TemplateModel({required this.id, required this.name, required this.segments});
}
