import 'package:aaa_hiring/models/football_club.dart';
import 'package:aaa_hiring/services/football_clubs_services.dart';
import 'package:aaa_hiring/widgets/football_club_item_widget.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:easy_localization/easy_localization.dart';

class SingleFootballClubScreen extends StatefulWidget {
  final FootballClub footballClub;

  const SingleFootballClubScreen(this.footballClub, {Key? key}) : super(key: key);

  @override
  State<SingleFootballClubScreen> createState() => _SingleFootballClubScreenState();
}

class _SingleFootballClubScreenState extends State<SingleFootballClubScreen> {

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.footballClub.name, style: const TextStyle(color: Colors.white)),
        systemOverlayStyle: SystemUiOverlayStyle.light,
        iconTheme: const IconThemeData(
          color: Colors.white,
        ),
      ),
      body: Column(
        children: [
          Row(
            children: [
              Expanded(
                child: Container(
                  color: Colors.black.withOpacity(0.8),
                  child: Padding(
                      padding: EdgeInsets.all(10),
                      child: Column(
                        children: [
                          Image.network(widget.footballClub.imageUrl, height: 200, width: 200,),
                          Container(height: 10),
                          Row(
                            children: [
                              Text(widget.footballClub.country, style: const TextStyle(color: Colors.white, fontSize: 28, fontWeight: FontWeight.bold)),

                            ],
                          )
                        ],
                      )
                  ),
                )
              )
            ],
          ),
          Padding(
            padding: EdgeInsets.all(10),
            child:
            Text('FOOTBALL_CLUB_INFO.VICTORY_INFO'.tr(namedArgs: {'club': widget.footballClub.name, 'titles': widget.footballClub.europeanTitles.toString()})),
          )
        ],
      ),
    );
  }
}
