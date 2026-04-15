import 'package:flutter/material.dart';
import 'package:globaltimes/features/sources/data/models/source.dart';
import 'package:globaltimes/features/sources/presentation/view/Tabitem.dart';

import 'package:provider/provider.dart';

class SourcesTabs extends StatefulWidget {
  static String routename = "/sourcescreen";
  final List<Source> sources;

  const SourcesTabs({required this.sources});

  @override
  State<SourcesTabs> createState() => _NewsSourcesScreenState();
}

class _NewsSourcesScreenState extends State<SourcesTabs>
    with SingleTickerProviderStateMixin {
    
  final viewmodel = NewsViewmodel() ;
  int currentindex = 0;
  late TabController tabController;

  @override
  void initState() {
    super.initState();
    tabController = TabController(length: widget.sources.length, vsync: this);
    tabController.addListener(() {
      if (tabController.indexIsChanging) return; 
      currentindex = tabController.index;
      viewmodel.getNewsbysource(widget.sources[currentindex].id!);
      setState(() {}); 
    });

    // initial fetch
    viewmodel.getNewsbysource(widget.sources[currentindex].id!);
  }

  @override
  void dispose() {
    tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => viewmodel,
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(
             horizontal: 5 ,vertical: 5),
            child: TabBar(
              controller: tabController,
              physics: BouncingScrollPhysics(),
              tabAlignment: TabAlignment.start,
              indicatorColor: Colors.transparent,
              dividerColor: Colors.transparent,
              isScrollable: true,
              tabs: widget.sources
                  .map((element) => TabItem(
                        isSelected: widget.sources.indexOf(element) == currentindex,
                        name: element.name!,
                      ))
                  .toList(),
            ),
          ),
          Expanded(
            child: Consumer<NewsViewmodel>(
              builder: (_, value, __) {
                if (value.isloading) {
                  return Center(
                      child: CircularProgressIndicator(color: Colors.green));
                } else if (value.errormessage != null) {
                  return Error_Indicator(error_msg: value.errormessage!);
                } else {
                  return ListView.builder(
                    physics: BouncingScrollPhysics(),
                    itemCount: value.myarticle.length,
                    itemBuilder: (_, index) =>
                        News_item(article: value.myarticle[index]),
                  );
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}