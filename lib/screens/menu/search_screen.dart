import 'package:flutter/material.dart';
import 'package:flutter_app/constants.dart';

class SearchPage extends StatefulWidget {
  SearchPage({Key key}) : super(key: key);

  @override
  SearchPageState createState() {
    return new SearchPageState();
  }
}

class SearchPageState extends State<SearchPage> {
  final _formKey = GlobalKey<FormState>();
  String selectedType = "Cat";
  String selectedAvail = "Available";
  String selectedBreed = 'other';
  bool goodWAnimals = true;
  bool goodWChild = true;
  bool leashed = true;

  static SearchPageState of(BuildContext context) {
    return context.findAncestorStateOfType<SearchPageState>();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Add search criterion"),
        leading: CloseButton(),
        actions: <Widget>[
          Builder(
            builder: (context) => FlatButton(
              child: Text("Filter"),
              textColor: Colors.white,
              onPressed: () {
                SearchPageState.of(context).save(context);
              },
            ),
          ),
        ],
      ),
      body: ListView(
        children: [Padding(
          padding: const EdgeInsets.all(12.0),
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Container(
                  height: 16.0,
                ),
                Text("Type:"),
                buildTypeDropdownButton(),
                Container(
                  height: 16.0,
                ),
                Text("Availability:"),
                buildAvailDropdownButton(),
                Container(
                  height: 16.0,
                ),
                Text("Breed:"),
                buildBreedDropdownButton(),
                Container(
                  height: 16.0,
                ),
                Text("Dispositions:"),
                buildGoodWAnimalListTile(),
                buildGoodWChildListTile(),
                buildLeashedListTile(),
                Container(
                  height: 16.0,
                ),
              ],
            ),
          ),
        ),
      ]),
    );
  }

  CheckboxListTile buildGoodWAnimalListTile() {
    return CheckboxListTile(
              title: Text('Good with animals'),
              value: goodWAnimals,
              onChanged: (newValue) {
                setState(() {
                  goodWAnimals = newValue;
                });
              },
              controlAffinity: ListTileControlAffinity.leading,  //  <-- leading Checkbox
            );
  }

  CheckboxListTile buildGoodWChildListTile() {
    return CheckboxListTile(
      title: Text('Good with children'),
      value: goodWChild,
      onChanged: (newValue) {
        setState(() {
          goodWChild = newValue;
        });
      },
      controlAffinity: ListTileControlAffinity.leading,  //  <-- leading Checkbox
    );
  }

  CheckboxListTile buildLeashedListTile() {
    return CheckboxListTile(
      title: Text('Must be leashed at all times'),
      value: leashed,
      onChanged: (newValue) {
        setState(() {
          leashed = newValue;
        });
      },
      controlAffinity: ListTileControlAffinity.leading,  //  <-- leading Checkbox
    );
  }

  DropdownButton<String> buildTypeDropdownButton() {
    return DropdownButton<String>(
              value: selectedType,
              icon: Icon(Icons.arrow_downward),
              iconSize: 24,
              elevation: 16,
              style: TextStyle(color: kPrimaryColor),
              underline: Container(
                height: 2,
                color: kPrimaryColor,
              ),
              onChanged: (String newValue) {
                setState(() {
                  selectedType = newValue;
                  selectedBreed = 'other';
                });
              },
              items: <String>['Dog', 'Cat', 'Other']
                  .map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
            );
  }

  DropdownButton<String> buildBreedDropdownButton() {
    var breeds = ['snoopy','husky', 'other'];
    if (selectedType == 'Cat') {
      breeds = ['helloKitty', 'Tom', 'other'];
    }
    else if (selectedType == 'Other') {
      breeds = ['other'];
    }

    return DropdownButton<String>(
      value: selectedBreed,
      icon: Icon(Icons.arrow_downward),
      iconSize: 24,
      elevation: 16,
      style: TextStyle(color: kPrimaryColor),
      underline: Container(
        height: 2,
        color: kPrimaryColor,
      ),
      onChanged: (String newValue) {
        setState(() {
          selectedBreed = newValue;
        });
      },
      items: breeds
          .map<DropdownMenuItem<String>>((String value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Text(value),
        );
      }).toList(),
    );
  }

  DropdownButton<String> buildAvailDropdownButton() {
    return DropdownButton<String>(
      value: selectedAvail,
      icon: Icon(Icons.arrow_downward),
      iconSize: 24,
      elevation: 16,
      style: TextStyle(color: kPrimaryColor),
      underline: Container(
        height: 2,
        color: kPrimaryColor,
      ),
      onChanged: (String newValue) {
        setState(() {
          selectedAvail = newValue;
        });
      },
      items: <String>['Available', 'Not available', 'Pending', 'Adopted']
          .map<DropdownMenuItem<String>>((String value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Text(value),
        );
      }).toList(),
    );
  }



  void save(context) {
    if (_formKey.currentState.validate()) {
      // store the favor request on firebase
      // Navigator.pop(context);
      // if (_formKey.currentState.validate()) {
        // If the form is valid, display a snackbar. In the real world,
        // you'd often call a server or save the information in a database.

        Scaffold
            .of(context)
            .showSnackBar(SnackBar(content: Text('Processing Data')));
        // final snackBar = SnackBar(content: Text('Are you talkin\' to me?'));
        // _scaffoldKey.currentState.showSnackBar(snackBar);

  }
    // }
  }
}