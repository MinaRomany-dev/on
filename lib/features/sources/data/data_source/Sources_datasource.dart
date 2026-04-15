// import 'package:news_app/Features/sources/data/models/source.dart';

// abstract  class SourcesDatasource {
// Future<List<Source>>getSources(String category);
// }
import 'package:news_app/Features/sources/data/models/source.dart';

abstract class SourcesDatasource {
  Future<List<Source>> getSources(String category);
}