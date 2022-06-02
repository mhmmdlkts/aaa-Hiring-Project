import 'package:aaa_hiring/models/football_club.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class FootballClubItemWidget extends StatelessWidget {

  final FootballClub footballClub;

  FootballClubItemWidget(this.footballClub, {key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Padding(
          padding: EdgeInsets.all(10),
          child: Image.network(footballClub.imageUrl, height: 80, width: 80, fit: BoxFit.contain),
        ),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(footballClub.name, style: const TextStyle(fontSize: 22),),
              Text(footballClub.country, style: const TextStyle(color: Colors.black54),),
              Padding(
                padding: EdgeInsets.only(right: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(),
                    Text("MILLION".tr(namedArgs: {'value': footballClub.value.toString()}), style: const TextStyle(fontSize: 18),)
                  ],
                ),
              )
            ],
          ),
        ),
      ],
    );
  }
}