import 'dart:convert';
import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:sampleflutter/team.dart';

class Api {
  Future<List<dynamic>> getTeams() async {
    var response = await http.get('https://www.thesportsdb.com/api/v1/json/1/search_all_teams.php?l=English%20Premier%20League');

    Map<String, dynamic> jsonResponse = json.decode(response.body);
    var rawTeam = jsonResponse["teams"];
    List<dynamic> teams = rawTeam.map(
            (team) => Team(team["strTeam"], team["strTeamBadge"])
    ).toList();
    return teams;
  }
}