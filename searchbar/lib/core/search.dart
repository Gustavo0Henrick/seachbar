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
    '${listItem.listTitle[0]} - ${listItem.listLocal[0]}',
    '${listItem.listTitle[1]} - ${listItem.listLocal[1]}',
    '${listItem.listTitle[2]} - ${listItem.listLocal[2]}',
    '${listItem.listTitle[3]} - ${listItem.listLocal[3]}',
    '${listItem.listTitle[4]} - ${listItem.listLocal[4]}',
    '${listItem.listTitle[5]} - ${listItem.listLocal[5]}',
    '${listItem.listTitle[6]} - ${listItem.listLocal[6]}',
    '${listItem.listTitle[7]} - ${listItem.listLocal[7]}',
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
