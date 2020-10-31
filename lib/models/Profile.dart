// import 'package:flutter/material.dart';

class Profile {
  final String availability, name, status, image;
  final int profileID, typeID, breedID;
  Profile({
    this.profileID,
    this.typeID,
    this.breedID,
    this.availability,
    this.name,
    this.status,
    this.image,
  });
}

List<Profile> profiles = [
  Profile(
    profileID: 1,
    typeID: 1,
    breedID: 1,
    availability: "available",
    name: "Daisy",
    status: "Doing well. Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.",
    image: "assets/images/golden_retriever.jpg",
  ),
  Profile(
    profileID: 2,
    typeID: 2,
    breedID: 2,
    availability: "available",
    name: "Paul",
    status: "Doing great. Status dummy text dummy text dummy text dummy text dummy text dummy text dummy text",
    image: "assets/images/havanese.jpg",
  ),
  Profile(
    profileID: 3,
    typeID: 2,
    breedID: 2,
    availability: "available",
    name: "Bear",
    status: "Doing great",
    image: "assets/images/french_bulldog.jpg",
  ),
  Profile(
    profileID: 4,
    typeID: 2,
    breedID: 2,
    availability: "available",
    name: "Benji",
    status: "Doing great",
    image: "assets/images/great_dane.jpg",
  ),
  Profile(
    profileID: 5,
    typeID: 2,
    breedID: 2,
    availability: "available",
    name: "Apollo",
    status: "Doing great",
    image: "assets/images/dachshund.jpg",
  ),
];

String dummyText =
    "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since. When an unknown printer took a galley.";
