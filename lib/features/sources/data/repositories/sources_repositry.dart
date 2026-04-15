

import 'package:news_app/Features/sources/data/data_source/Sources_datasource.dart';
import 'package:news_app/Features/sources/data/models/source.dart';

class SourcesRepository {
  SourcesDatasource datasource;
  SourcesRepository(this.datasource);
  Future<List<Source>> getSources(String cateid) async {
    return datasource.getSources(cateid);
  }
}
