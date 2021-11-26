class MainModel {
  final String name;
  final int id;

  MainModel({
    required this.name,
    required this.id,
  });
}

class CatalogModel {
  static final items = [
    MainModel(
      name: "Button",
      id: 1,
    ),
    MainModel(
      name: "Toast",
      id: 2,
    ),
    MainModel(
      name: "Dialog",
      id: 3,
    ),
    MainModel(
      name: "AppBar",
      id: 4,
    ),
    MainModel(
      name: "Textview",
      id: 5,
    ),
    MainModel(
      name: "Text Feild (Edittext)",
      id: 6,
    ),
    MainModel(
      name: "ListView",
      id: 7,
    ),
    MainModel(
      name: "DropDown",
      id: 8,
    ),
    MainModel(
      name: "PopMenu",
      id: 9,
    ),
    MainModel(
      name: "Button Radio",
      id: 10,
    ),
    MainModel(
      name: "Button Switch",
      id: 11,
    ),
    MainModel(
      name: "Button Toggle",
      id: 12,
    ),
    MainModel(
      name: "Check Box",
      id: 13,
    ),
  ];
}
