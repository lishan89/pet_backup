import 'package:flutter/material.dart';
import 'package:flutter_app/constants.dart';

class AddProfilePage extends StatefulWidget {
  // List<Friend> friends;

  // AddProfilePage({Key key, this.friends}) : super(key: key);
  AddProfilePage({Key key}) : super(key: key);

  @override
  AddProfilePageState createState() {
    return new AddProfilePageState();
  }
}

class AddProfilePageState extends State<AddProfilePage> {
  final _formKey = GlobalKey<FormState>();
  String selectedType = "Cat";
  String selectedAvail = "Available";
  String selectedBreed = 'other';
  bool goodWAnimals = true;
  bool goodWChild = true;
  bool leashed = true;
  // Friend _selectedFriend = null;

  static AddProfilePageState of(BuildContext context) {
    return context.findAncestorStateOfType<AddProfilePageState>();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Add a profile"),
        leading: CloseButton(),
        actions: <Widget>[
          Builder(
            builder: (context) => FlatButton(
              child: Text("SAVE"),
              textColor: Colors.white,
              onPressed: () {
                AddProfilePageState.of(context).save(context);
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
                // DropdownButtonFormField<Friend>(
                //   value: _selectedFriend,
                //   onChanged: (friend) {
                //     setState(() {
                //       _selectedFriend = friend;
                //     });
                //   },
                //   items: widget.friends
                //       .map(
                //         (f) => DropdownMenuItem<Friend>(
                //       value: f,
                //       child: Text(f.name),
                //     ),
                //   )
                //       .toList(),
                //   validator: (friend) {
                //     if (friend == null) {
                //       return "You must select a friend to ask the favor";
                //     }
                //     return null;
                //   },
                // ),
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
                Text("Upload image:"),
                Container(
                  height: 16.0,
                ),
                Text("Status description:"),
                Container(
                  height: 16.0,
                ),
                TextFormField(
                  maxLines: 5,
                  // inputFormatters: [LengthLimitingTextInputFormatter(200)],
                  validator: (value) {
                    if (value.isEmpty) {
                      return "You must detail the status";
                    }
                    return null;
                  },
                ),
                Container(
                  height: 16.0,
                ),
                // Text("Due Date:"),
                // DateTimePickerFormField(
                //   inputType: InputType.both,
                //   format: DateFormat("EEEE, MMMM d, yyyy 'at' h:mma"),
                //   editable: false,
                //   decoration: InputDecoration(
                //       labelText: 'Date/Time', hasFloatingPlaceholder: false),
                //   validator: (dateTime) {
                //     if (dateTime == null) {
                //       return "You must select a due date time for the favor";
                //     }
                //     return null;
                //   },
                // ),
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