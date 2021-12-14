import 'package:dio/dio.dart';

class HomeController {
  var dio = Dio();

  getCharacters() async {
    final response =
        await dio.get('https://www.breakingbadapi.com/api/characters');

    if (response.statusCode == 200) {
      final character = response.data;
      return character;
    } else {
      print('error!');
      return [];
    }
  }
  getCharactersById(int id) async {
    final response =
    await dio.get('https://www.breakingbadapi.com/api/characters/$id');

    if (response.statusCode == 200) {
      final character = response.data;
      return character;
    } else {
      print('error!');
      return [];
    }
  }


  getCharactersQote() async {
    final response =
    await dio.get('https://www.breakingbadapi.com/api/quotes');

    if (response.statusCode == 200) {
      final character = response.data;
      return character;
    } else {
      print('error!');
      return [];
    }
  }

}
