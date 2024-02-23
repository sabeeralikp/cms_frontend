import 'package:flutter/material.dart';
import 'package:expansion_tile_card/expansion_tile_card.dart';

class reviewNavPage extends StatefulWidget {
  const reviewNavPage({super.key});

  

  @override
  State<reviewNavPage> createState() => _reviewNavPageState();
}

class _reviewNavPageState extends State<reviewNavPage> {
  final GlobalKey<ExpansionTileCardState> cardA = GlobalKey();
  final GlobalKey<ExpansionTileCardState> cardB = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            onPressed: () {
              // method to show the search bar
              // showSearch(
              //   context: context,
              //   // delegate to customize the search bar
              //   delegate:,
              // );
            },
            icon: const Icon(Icons.search),
          )
        ],
      ),
      body: SafeArea(
        child: SingleChildScrollView(
            child:Padding(
              padding: EdgeInsets.all(10.0),
              child:  Column(
          children: [
            ExpansionTileCard(
              // key: cardA,
              title: const Text('Reviewed Papers'),
              children: <Widget>[
                const Divider(
                  thickness: 1.0,
                  height: 1.0,
                ),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 16.0,
                      vertical: 8.0,
                    ),
                    child: Text(
                      "Hi there, I'm a drop-in replacement for Flutter's ExpansionTile. Use me any time you think your app could benefit from being just a bit more Material. These buttons control the next card down!",
                      style: Theme.of(context)
                          .textTheme
                          .bodyMedium!
                          .copyWith(fontSize: 16),
                    ),
                  ),
                ),
              ],
            ),

             ExpansionTileCard(
              // key: cardA,
              title: const Text('Review Papers'),
              children: <Widget>[
                const Divider(
                  thickness: 1.0,
                  height: 1.0,
                ),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 16.0,
                      vertical: 8.0,
                    ),
                    child: Text(
                      "Hi there, I'm a drop-in replacement for Flutter's ExpansionTile. Use me any time you think your app could benefit from being just a bit more Material. These buttons control the next card down!",
                      style: Theme.of(context)
                          .textTheme
                          .bodyMedium!
                          .copyWith(fontSize: 16),
                    ),
                  ),
                ),
              ],
            ),

          ],
        ),
              )
              ),
      ),
    );
  }
}
