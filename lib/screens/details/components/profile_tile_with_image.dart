import 'package:flutter/material.dart';
import 'package:flutter_app/models/Profile.dart';

import '../../../constants.dart';

class ProfileTitleWithImage extends StatelessWidget {
  const ProfileTitleWithImage({
    Key key,
    @required this.profile,
  }) : super(key: key);

  final Profile profile;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: kDefaultPadding),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            "AAA",
            style: TextStyle(color: Colors.white),
          ),
          Text(
            profile.name,
            style: Theme.of(context)
                .textTheme
                .headline4
                .copyWith(color: Colors.white, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: kDefaultPadding),
          Row(
            children: <Widget>[
              // RichText(
              //   text: TextSpan(
              //     children: [
              //       TextSpan(text: "Price\n"),
              //       // TextSpan(
              //       //   text: "${profile.status}",
              //       //   style: Theme.of(context)
              //       //       .textTheme
              //       //       .headline4
              //       //       .copyWith(
              //       //           color: Colors.white,
              //       //           fontWeight: FontWeight.bold),
              //       // ),
              //     ],
              //   ),
              // ),
              SizedBox(width: kDefaultPadding),
              Expanded(child: Image.asset(profile.image, fit: BoxFit.fill))
            ],
          )
        ],
      ),
    );
  }
}

// Widget titleSection = Container(
//   padding: const EdgeInsets.all(32),
//   child: Row(
//     children: [
//       Expanded(
//         /*1*/
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             /*2*/
//             Container(
//               padding: const EdgeInsets.only(bottom: 8),
//               child: Text(
//                 'Oeschinen Lake Campground',
//                 style: TextStyle(
//                   fontWeight: FontWeight.bold,
//                 ),
//               ),
//             ),
//             Text(
//               'Kandersteg, Switzerland',
//               style: TextStyle(
//                 color: Colors.grey[500],
//               ),
//             ),
//           ],
//         ),
//       ),
//       /*3*/
//       Icon(
//         Icons.star,
//         color: Colors.red[500],
//       ),
//       Text('41'),
//     ],
//   ),
// );
