import 'package:flutter/material.dart';
import 'package:flutter_app/models/Profile.dart';
import 'package:flutter_app/screens/details/components/body.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../constants.dart';

class DetailsScreen extends StatelessWidget {
  final Profile profile;

  const DetailsScreen({Key key, this.profile}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: buildAppBar(context),
      body: Body(profile: profile),
    );
  }

  AppBar buildAppBar(BuildContext context) {
    return AppBar(
      backgroundColor: Color(0xFFfeffff),
      elevation: 0,
      leading: IconButton(
        icon: SvgPicture.asset(
          'assets/icons/back_arrow.svg',
          color: Colors.black,
        ),
        onPressed: () => Navigator.pop(context),
      ),
      actions: <Widget>[
        // IconButton(
        //     icon: SvgPicture.asset("assets/icons/search.svg"),
        //     onPressed: () {}),
        SizedBox(width: kDefaultPadding / 2)
      ],
    );
  }
}




// import 'package:flutter/material.dart';
//
// void main() => runApp(MyApp());
//
// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     final appTitle = 'Form Validation Demo';
//
//     return MaterialApp(
//       title: appTitle,
//       home: Scaffold(
//         appBar: AppBar(
//           title: Text(appTitle),
//         ),
//         body: MyCustomForm(),
//       ),
//     );
//   }
// }
//
// // Create a Form widget.
// class MyCustomForm extends StatefulWidget {
//   @override
//   MyCustomFormState createState() {
//     return MyCustomFormState();
//   }
// }
//
// // Create a corresponding State class.
// // This class holds data related to the form.
// class MyCustomFormState extends State<MyCustomForm> {
//   // Create a global key that uniquely identifies the Form widget
//   // and allows validation of the form.
//   //
//   // Note: This is a GlobalKey<FormState>,
//   // not a GlobalKey<MyCustomFormState>.
//   final _formKey = GlobalKey<FormState>();
//
//   @override
//   Widget build(BuildContext context) {
//     // Build a Form widget using the _formKey created above.
//     return Form(
//       key: _formKey,
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: <Widget>[
//           TextFormField(
//             validator: (value) {
//               if (value.isEmpty) {
//                 return 'Please enter some text';
//               }
//               return null;
//             },
//           ),
//           Padding(
//             padding: const EdgeInsets.symmetric(vertical: 16.0),
//             child: ElevatedButton(
//               onPressed: () {
//                 // Validate returns true if the form is valid, or false
//                 // otherwise.
//                 if (_formKey.currentState.validate()) {
//                   // If the form is valid, display a Snackbar.
//                   Scaffold.of(context)
//                       .showSnackBar(SnackBar(content: Text('Processing Data')));
//                 }
//               },
//               child: Text('Submit'),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
