import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:globaltimes/features/sources/presentation/cubit/sources_state.dart';
import 'package:globaltimes/features/sources/presentation/cubit/sources_viewmodel.dart';
import 'package:globaltimes/features/sources/presentation/view/news_screen.dart';


class SourceTabs extends StatefulWidget {
  final String categid;
  const SourceTabs({super.key, required this.categid});

  @override
  State<SourceTabs> createState() => _SourceTabsState();
}

class _SourceTabsState extends State<SourceTabs> {
  bool isLoading = true;
  final viewmodel = SourcesViewmodel();
  @override
  void initState() {
    super.initState();
    viewmodel.getSources(widget.categid);
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => viewmodel,
      child: BlocBuilder<SourcesViewmodel, SourcesState>(
        builder: (context, state) {
          if (state is GetsSources) {
            return SourcesTabs(sources: state.sources);
          }
          if (state is ErrorGetSources) {
            return Error_Indicator(error_msg: state.errormessage);
          }
          if (state is LoadingSources) {
            return const CircularProgressIndicator(
              color: Colors.green,
            );
          } else {
            return const SizedBox();
          }
        },
      ),
    );
  }
}
