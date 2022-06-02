import 'dart:convert';

import 'package:aaa_hiring/models/football_club.dart';
import 'package:http/http.dart' as http;

class FootballClubsServices {

  static const String CLUBS_API_URL = 'https://public.allaboutapps.at/hiring/clubs.json';

  static Future<List<FootballClub>> fetchFootballClubs() async {
    List<FootballClub> list = [];

    http.Response response = await http.get(Uri.parse(CLUBS_API_URL));

    List<dynamic> data = json.decode(utf8.decode(response.bodyBytes));
    
    data.forEach((element) {
      list.add(FootballClub.fromJson(element));
    });

    return list;
  }

  static void sortListByAlphabetic(List<FootballClub> list, {bool isDesc = false}) {
    list.sort((a, b) => a.name.compareTo(b.name) * (isDesc?-1:1));
  }

  static void sortListByValue(List<FootballClub> list, {bool isDesc = false}) {
    list.sort((a, b) => a.value.compareTo(b.value) * (isDesc?-1:1));
  }
}