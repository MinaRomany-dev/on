// import 'dart:convert';
// import 'package:http/http.dart' as http;
// import 'package:news_app/Core/Api/api_constant.dart';
// import 'package:news_app/Features/sources/data/data_source/Sources_datasource.dart';
// import 'package:news_app/Features/sources/data/models/source.dart';
// import 'package:news_app/Features/sources/data/models/sourcesresponse.dart';

// class Apisources extends SourcesDatasource {
//   @override
//   Future<List<Source>> getSources(String cate) async {
//     final uri = Uri.https(
//       ApiConstant.baseUrl, 
//       ApiConstant.sourcesEndpoint,
//         { 
//           'apikey': 'eff0da2d38324383857a58563e4db3c0',
//           'category': cate
//         });
//     final response = await http.get(uri);
//     final json = jsonDecode(response.body);
  
//     final sourcesresponse = SourcesResponse.fromJson(json);

//     if (sourcesresponse.status == 'ok' && sourcesresponse.sources != null) {
//       return sourcesresponse.sources!;
//     } else {
//       //   ممكن بعمل تسجيل دخول و مش هحتاج ارجع حاجه زي Update 
//       throw  Exception("Fail to get sources!") ;
//     }
//   }
// }


import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:news_app/Core/Api/api_constant.dart';
import 'package:news_app/Features/sources/data/models/source.dart';
import 'package:news_app/Features/sources/data/models/sourcesresponse.dart';
import 'package:news_app/Features/sources/data/data_source/Sources_datasource.dart';



class Apisources implements SourcesDatasource {
  @override
  Future<List<Source>> getSources(String category) async {
    final uri = Uri.https(
      ApiConstant.baseUrl,
      ApiConstant.sourcesEndpoint,
      {'apikey': 'eff0da2d38324383857a58563e4db3c0', 'category': category},
    );
    
    final response = await http.get(uri);
    final json = jsonDecode(response.body);
    final sourcesresponse = SourcesResponse.fromJson(json);

    if (sourcesresponse.status == 'ok' && sourcesresponse.sources != null) {
      return sourcesresponse.sources!; // هذا الآن Future<List<Source>> بسبب async
    } else {
      throw Exception("Fail to get sources!");
    }
  }
}