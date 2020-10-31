import 'package:flutter/material.dart';
import 'package:flutter_app/constants.dart';
import 'package:flutter_app/models/Profile.dart';
import 'package:flutter_app/screens/details/components/profile_tile_with_image.dart';

class Body extends StatelessWidget {
  final Profile profile;

  const Body({Key key, this.profile}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return ListView(
        children: <Widget>[
          Image.asset(
            profile.image,
            width: 600,
            height: 240,
            fit: BoxFit.fill,
          ),
          titleSection(profile),
          textSection(profile),
          // FlatButton(
          //   child: Text("Do"),
          //   onPressed: () {},
          // ),
          Container(
            margin: EdgeInsets.all(15),
            child: FlatButton(
              child: Text('Adopt'),
              color: kPrimaryColor,
              textColor: Colors.white,
              onPressed: () {},
            ),
          ),
          Container(
            margin: EdgeInsets.all(15),
            child: FlatButton(
              child: Text('Delete Profile'),
              color: Colors.blueAccent,
              textColor: Colors.white,
              onPressed: () {},
            ),
          ),
        ],
      );
  }
}

Widget titleSection(Profile profile) {
  return Container(
    padding: const EdgeInsets.all(32),
    child: Row(
      children: [
        Expanded(
          /*1*/
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              /*2*/
              Container(
                padding: const EdgeInsets.only(bottom: 8),
                child: Text(
                  profile.name,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 6),
                child: Text(
                  'breed placeholder',
                  style: TextStyle(
                    color: Colors.grey[500],
                  ),
                ),
              ),
              Text(
                profile.availability,
                style: TextStyle(
                  color: Colors.grey[500],
                ),
              ),
            ],
          ),
        ),
        /*3*/
        // Icon(
        //   Icons.star,
        //   color: Colors.red[500],
        // ),
        // Text('41'),
        FavoriteWidget(),
      ],
    ),
  );
}

Widget textSection(Profile profile) {
  return Container(
    padding: const EdgeInsets.all(32),
    child: Text(
      profile.status,
      softWrap: true,
    ),
  );
}

class FavoriteWidget extends StatefulWidget {
  @override
  _FavoriteWidgetState createState() => _FavoriteWidgetState();
}

class _FavoriteWidgetState extends State<FavoriteWidget> {
  bool _isFavorited = true;
  int _favoriteCount = 20;

  void _toggleFavorite() {
    setState(() {
      if (_isFavorited) {
        _favoriteCount -= 1;
        _isFavorited = false;
      } else {
        _favoriteCount += 1;
        _isFavorited = true;
      }
    });
  }
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          padding: EdgeInsets.all(0),
          child: IconButton(
            padding: EdgeInsets.all(0),
            alignment: Alignment.centerRight,
            icon: (_isFavorited ? Icon(Icons.star) : Icon(Icons.star_border)),
            color: Colors.red[500],
            onPressed: _toggleFavorite,
          ),
        ),
        SizedBox(
          width: 18,
          child: Container(
            child: Text('$_favoriteCount'),
          ),
        ),
      ],
    );
  }
}
//
//
// class FavorsPageState extends State<FavorsPage> {
//   // using mock values from mock_favors dart file for now
//   List<Favor> pendingAnswerFavors;
//   List<Favor> acceptedFavors;
//   List<Favor> completedFavors;
//   List<Favor> refusedFavors;
//
//   @override
//   void initState() {
//     super.initState();
//
//     pendingAnswerFavors = List();
//     acceptedFavors = List();
//     completedFavors = List();
//     refusedFavors = List();
//
//     loadFavors();
//   }
//
//   void loadFavors() {
//     pendingAnswerFavors.addAll(mockPendingFavors);
//     acceptedFavors.addAll(mockDoingFavors);
//     completedFavors.addAll(mockCompletedFavors);
//     refusedFavors.addAll(mockRefusedFavors);
//   }
//
//   static FavorsPageState of(BuildContext context) {
//     return context.ancestorStateOfType(TypeMatcher<FavorsPageState>());
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return DefaultTabController(
//       length: 4,
//       child: Scaffold(
//         appBar: AppBar(
//           title: Text("Your favors"),
//           bottom: TabBar(
//             isScrollable: true,
//             tabs: [
//               _buildCategoryTab("Requests"),
//               _buildCategoryTab("Doing"),
//               _buildCategoryTab("Completed"),
//               _buildCategoryTab("Refused"),
//             ],
//           ),
//         ),
//         body: TabBarView(
//           children: [
//             FavorsList(title: "Pending Requests", favors: pendingAnswerFavors),
//             FavorsList(title: "Doing", favors: acceptedFavors),
//             FavorsList(title: "Completed", favors: completedFavors),
//             FavorsList(title: "Refused", favors: refusedFavors),
//           ],
//         ),
//         floatingActionButton: FloatingActionButton(
//           onPressed: () {
//             Navigator.of(context).push(
//               MaterialPageRoute(
//                 builder: (context) => RequestFavorPage(
//                   friends: mockFriends,
//                 ),
//               ),
//             );
//           },
//           tooltip: 'Ask a favor',
//           child: Icon(Icons.add),
//         ),
//       ),
//     );
//   }
//
//   Widget _buildCategoryTab(String title) {
//     return Tab(
//       child: Text(title),
//     );
//   }
//
//   void refuseToDo(Favor favor) {
//     setState(() {
//       pendingAnswerFavors.remove(favor);
//
//       refusedFavors.add(favor.copyWith(accepted: false));
//     });
//   }
//
//   void acceptToDo(Favor favor) {
//     setState(() {
//       pendingAnswerFavors.remove(favor);
//
//       acceptedFavors.add(favor.copyWith(accepted: true));
//     });
//   }
//
//   void giveUp(Favor favor) {
//     setState(() {
//       acceptedFavors.remove(favor);
//
//       refusedFavors.add(favor.copyWith(
//         accepted: false,
//       ));
//     });
//   }
//
//   void complete(Favor favor) {
//     setState(() {
//       acceptedFavors.remove(favor);
//
//       completedFavors.add(favor.copyWith(
//         completed: DateTime.now(),
//       ));
//     });
//   }
// }
//
//
//
// class FavorCardItem extends StatelessWidget {
//   final Favor favor;
//
//   const FavorCardItem({Key key, this.favor}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return Card(
//       key: ValueKey(favor.uuid),
//       margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 25.0),
//       child: Padding(
//         child: Column(
//           children: <Widget>[
//             _itemHeader(favor),
//             Text(favor.description),
//             _itemFooter(context, favor)
//           ],
//         ),
//         padding: EdgeInsets.all(8.0),
//       ),
//     );
//   }
//
//   Widget _itemFooter(BuildContext context, Favor favor) {
//     if (favor.isCompleted) {
//       final format = DateFormat();
//       return Container(
//         margin: EdgeInsets.only(top: 8.0),
//         alignment: Alignment.centerRight,
//         child: Chip(
//           label: Text("Completed at: ${format.format(favor.completed)}"),
//         ),
//       );
//     }
//     if (favor.isRequested) {
//       return Row(
//         mainAxisAlignment: MainAxisAlignment.end,
//         children: <Widget>[
//           FlatButton(
//             child: Text("Refuse"),
//             onPressed: () {
//               FavorsPageState.of(context).refuseToDo(favor);
//             },
//           ),
//           FlatButton(
//             child: Text("Do"),
//             onPressed: () {
//               FavorsPageState.of(context).acceptToDo(favor);
//             },
//           )
//         ],
//       );
//     }
//     if (favor.isDoing) {
//       return Row(
//         mainAxisAlignment: MainAxisAlignment.end,
//         children: <Widget>[
//           FlatButton(
//             child: Text("give up"),
//             onPressed: () {
//               FavorsPageState.of(context).giveUp(favor);
//             },
//           ),
//           FlatButton(
//             child: Text("complete"),
//             onPressed: () {
//               FavorsPageState.of(context).complete(favor);
//             },
//           )
//         ],
//       );
//     }
//
//     return Container();
//   }
//
//   Widget _itemHeader(Favor favor) {
//     return Row(
//       children: <Widget>[
//         CircleAvatar(
//           backgroundImage: NetworkImage(
//             favor.friend.photoURL,
//           ),
//         ),
//         Expanded(
//           child: Padding(
//               padding: EdgeInsets.only(left: 8.0),
//               child: Text("${favor.friend.name} asked you to... ")),
//         )
//       ],
//     );
//   }
// }

// class Body extends StatelessWidget {
//   final Profile profile;
//
//   const Body({Key key, this.profile}) : super(key: key);
//   @override
//   Widget build(BuildContext context) {
//     Size size = MediaQuery.of(context).size;
//     return SingleChildScrollView(
//       child: Column(
//         children: <Widget>[
//           SizedBox(
//             height: size.height,
//             child: Stack(
//               children: <Widget>[
//                 Container(
//                   margin: EdgeInsets.only(top: size.height * 0.3),
//                   height: 500,
//                   decoration: BoxDecoration(
//                       color: Colors.white,
//                       borderRadius: BorderRadius.only(
//                         topLeft: Radius.circular(24),
//                         topRight: Radius.circular(24),
//                       )),
//                   // child: Column(
//                   //   children: <Widget>[],
//                   // ),
//                 ),
//                 ProfileTitleWithImage(profile: profile)
//               ],
//             ),
//           )
//         ],
//       ),
//     );
//   }
// }
