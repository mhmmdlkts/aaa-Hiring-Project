import 'package:aaa_hiring/models/football_club.dart';
import 'package:aaa_hiring/screens/single_football_club_screen.dart';
import 'package:aaa_hiring/services/football_clubs_services.dart';
import 'package:aaa_hiring/widgets/football_club_item_widget.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class FootballClubsScreen extends StatefulWidget {
  const FootballClubsScreen({Key? key}) : super(key: key);

  @override
  State<FootballClubsScreen> createState() => _FootballClubsScreenState();
}

class _FootballClubsScreenState extends State<FootballClubsScreen> {

  List<FootballClub> clubsList = [];
  bool isAlphabeticallySorted = false;

  @override
  void initState() {
    super.initState();

    FootballClubsServices.fetchFootballClubs().then((value) {
      if (mounted) {
        setState(() {
          clubsList = value;
          FootballClubsServices.sortListByAlphabetic(value);
          isAlphabeticallySorted = true;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('APP_NAME'.tr(), style: const TextStyle(color: Colors.white)),
        systemOverlayStyle: SystemUiOverlayStyle.light,
        iconTheme: const IconThemeData(
          color: Colors.white,
        ),
        actions: <Widget>[
          IconButton(
            onPressed: () => setState((){
              if (isAlphabeticallySorted) {
                FootballClubsServices.sortListByValue(clubsList, isDesc: true);
              } else {
                FootballClubsServices.sortListByAlphabetic(clubsList);
              }
              isAlphabeticallySorted = !isAlphabeticallySorted;
            }),
            icon: Icon(Icons.sort),
          )
        ],
      ),
      body: ListView.separated(
        itemCount: clubsList.length,
        itemBuilder: (_, i) => InkWell(
          child: FootballClubItemWidget(clubsList[i]),
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => SingleFootballClubScreen(clubsList[i])),
            );
          },
        ),
        separatorBuilder:  (_, i) => const Divider(height: 1,),
      ),
    );
  }
}
