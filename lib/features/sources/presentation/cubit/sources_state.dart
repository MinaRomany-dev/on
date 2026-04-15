import 'package:globaltimes/features/sources/data/models/source.dart';

abstract class SourcesState {}

class SourcesInitial extends SourcesState {}

class GetsSources extends SourcesState {
  List<Source> sources;
  GetsSources(this.sources);
}

class LoadingSources extends SourcesState {}

class ErrorGetSources extends SourcesState {
  String errormessage;
  ErrorGetSources(this.errormessage);
}
  