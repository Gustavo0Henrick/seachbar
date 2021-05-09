import 'package:flutter/material.dart';
import 'package:searchbar/core/item.dart';
import 'package:searchbar/core/result.dart';

class SearchHomeCand extends StatefulWidget {
  @override
  _SearchHomeCandState createState() => _SearchHomeCandState();
}

class _SearchHomeCandState extends State<SearchHomeCand> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
      ),
    );
  }
}

class ListVagas extends SearchDelegate<String> {
  int idG;
  String searchFieldLabel = 'Digite...';
  TextInputAction textInputAction = TextInputAction.none;
  final vagas = [
    '${GetjobVagasGeral.listTitle[0]} - ${GetjobVagasGeral.listLocal[0]}',
    '${GetjobVagasGeral.listTitle[1]} - ${GetjobVagasGeral.listLocal[1]}',
    '${GetjobVagasGeral.listTitle[2]} - ${GetjobVagasGeral.listLocal[2]}',
    '${GetjobVagasGeral.listTitle[3]} - ${GetjobVagasGeral.listLocal[3]}',
    '${GetjobVagasGeral.listTitle[4]} - ${GetjobVagasGeral.listLocal[4]}',
    '${GetjobVagasGeral.listTitle[5]} - ${GetjobVagasGeral.listLocal[5]}',
    '${GetjobVagasGeral.listTitle[6]} - ${GetjobVagasGeral.listLocal[6]}',
    '${GetjobVagasGeral.listTitle[7]} - ${GetjobVagasGeral.listLocal[7]}',
  ];

  var recentVagas = [""];

  @override
  List<Widget> buildActions(BuildContext context) => [
        IconButton(
          icon: Icon(
            Icons.clear,
            color: Colors.blue,
          ),
          onPressed: () {
            query = '';
            showSuggestions(context);
          },
        )
      ];

  @override
  Widget buildLeading(BuildContext context) => IconButton(
      icon: Icon(
        Icons.chevron_left,
        color: Colors.blue,
      ),
      onPressed: () {
        query.isEmpty ? close(context, null) : showSuggestions(context);
        query = '';
      });

  @override
  Widget buildResults(BuildContext context) {
    return Result(
      id: idG,
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    final suggestion = query.isEmpty
        ? recentVagas
        : vagas.where((vagas) {
            final vagasLower = vagas.toLowerCase();
            final queryLower = query.toLowerCase();
            return vagasLower.startsWith(queryLower);
          }).toList();

    return buildSuggestionsSucess(suggestion);
  }

  Widget buildSuggestionsSucess(List<String> suggestions) => ListView.builder(
        itemCount: suggestions.length,
        itemBuilder: (context, index) {
          final suggestion = suggestions[index];
          final queryText = suggestion.substring(0, query.length);
          final remainingText = suggestion.substring(query.length);
          return query.isEmpty
              ? Container()
              : ListTile(
                  onTap: () {
                    idG = index;
                    query = suggestion;

                    showResults(context);
                  },
                  leading: Icon(
                    Icons.account_circle,
                    color: Colors.blue,
                  ),
                  title: RichText(
                    text: TextSpan(
                        text: queryText,
                        style: TextStyle(
                            color: Colors.blue, fontWeight: FontWeight.bold),
                        children: [
                          TextSpan(
                              text: remainingText,
                              style: TextStyle(
                                  color: Colors.blue,
                                  fontWeight: FontWeight.w400)),
                        ]),
                  ),
                );
        },
      );
}
