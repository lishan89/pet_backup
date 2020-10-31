import 'package:flutter/material.dart';
import 'package:flutter_app/models/Profile.dart';
import '../../../constants.dart';

class ItemCard extends StatelessWidget {
  final Profile profile;
  final Function press;
  const ItemCard({
    Key key,
    this.profile,
    this.press,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: press,
      child: Column(
        // crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Expanded(
            child: Container(
              padding: EdgeInsets.all(kDefaultPadding / 2),
              // height: 180,
              // width: 160,
              decoration: BoxDecoration(
                color: kBackgroundColor,
                borderRadius: BorderRadius.circular(16),
              ),
              child: Image.asset(profile.image),
              // child: Image.asset("assets/images/havanese.jpg")
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: kDefaultPadding / 10),
            child: Text(
              profile.name,
              style: TextStyle(color: kTextColor),
            ),
          ),
          Text(
            profile.availability,
            style: TextStyle(fontWeight: FontWeight.bold),
          )
        ],
      ),
    );
  }
}
