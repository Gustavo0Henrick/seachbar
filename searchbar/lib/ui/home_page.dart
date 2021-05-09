import 'package:flutter/material.dart';
import 'package:searchbar/core/search.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        centerTitle: true,
        title: Text('Search Bar'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: ElevatedButton(
              onPressed: () {
                showSearch(context: context, delegate: ListVagas());
              },
              style: ElevatedButton.styleFrom(
                elevation: 5,
                primary: Colors.blue,
              ),
              child: Text('Aperte'),
            ),
          )
        ],
      ),
    );
  }
}
