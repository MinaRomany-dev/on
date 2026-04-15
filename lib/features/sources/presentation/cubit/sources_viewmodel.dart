import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:globaltimes/features/sources/data/repositories/sources_repositry.dart';
import 'package:globaltimes/features/sources/presentation/cubit/sources_state.dart';


class SourcesViewmodel extends Cubit<SourcesState> {
  late final SourcesRepository sourcesRepository;
  SourcesViewmodel() : super(SourcesInitial()) {
    sourcesRepository = SourcesRepository(ServiceLocator.sourcesDatasource);
  }

  Future<void> getSources(String cate) async {
   // emit(LoadingSources());

    try {
      final mysources = await sourcesRepository.getSources(cate);
      emit(GetsSources(mysources));
    } catch (error) {
      emit(ErrorGetSources(error.toString()));
    }
  }
}
