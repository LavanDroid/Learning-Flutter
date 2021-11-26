class MainModel {
  final String name;
  final int id;

  MainModel({
    required this.name,
    required this.id,
  });
}

class MainModelTwo {
  final String name;
  final int id;
  final String img;

  MainModelTwo({
    required this.name,
    required this.id,
    required this.img,
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

  static final items2 = [
    MainModelTwo(
      name: 'Button',
      id: 1,
      img: 'http://lorempixel.com/200/200/animals/1/',
    ),
    MainModelTwo(
      name: "Toast",
      id: 2,
      img: 'http://lorempixel.com/200/200/food/1/',
    ),
    MainModelTwo(
      name: "Dialog",
      id: 3,
      img: 'http://lorempixel.com/200/200/sports/1/',
    ),
    MainModelTwo(
      name: "AppBar",
      id: 4,
      img: 'http://lorempixel.com/200/200/animals/2/',
    ),
    MainModelTwo(
      name: "Textview",
      id: 5,
      img: 'http://lorempixel.com/200/200/food/2/',
    ),
    MainModelTwo(
      name: "Text Feild (Edittext)",
      id: 6,
      img: 'http://lorempixel.com/200/200/sports/2/',
    ),
    MainModelTwo(
      name: "ListView",
      id: 7,
      img: 'http://lorempixel.com/200/200/animals/3/',
    ),
    MainModelTwo(
      name: "DropDown",
      id: 8,
      img: 'http://lorempixel.com/200/200/food/3/',
    ),
    MainModelTwo(
      name: "PopMenu",
      id: 9,
      img: 'http://lorempixel.com/200/200/sports/3/',
    ),
    MainModelTwo(
      name: "Button Radio",
      id: 10,
      img: 'http://lorempixel.com/200/200/animals/4/',
    ),
    MainModelTwo(
      name: "Button Switch",
      id: 11,
      img: 'http://lorempixel.com/200/200/food/4/',
    ),
    MainModelTwo(
      name: "Button Toggle",
      id: 12,
      img: 'http://lorempixel.com/200/200/city/4/',
    ),
    MainModelTwo(
      name: "Check Box",
      id: 13,
      img: 'http://lorempixel.com/200/200/animals/5/',
    ),
    MainModelTwo(
      name: 'Button',
      id: 14,
      img: 'http://lorempixel.com/200/200/food/5/',
    ),
    MainModelTwo(
      name: "Toast",
      id: 15,
      img: 'http://lorempixel.com/200/200/sports/5/',
    ),
    MainModelTwo(
      name: "Dialog",
      id: 16,
      img: 'http://lorempixel.com/200/200/animals/6/',
    ),
    MainModelTwo(
      name: "AppBar",
      id: 17,
      img: 'http://lorempixel.com/200/200/food/6/',
    ),
    MainModelTwo(
      name: "Textview",
      id: 18,
      img: 'http://lorempixel.com/200/200/sports/6/',
    ),
    MainModelTwo(
      name: "Text Feild (Edittext)",
      id: 19,
      img: 'http://lorempixel.com/200/200/animals/7/',
    ),
    MainModelTwo(
      name: "ListView",
      id: 20,
      img: 'http://lorempixel.com/200/200/food/7/',
    ),
    MainModelTwo(
      name: "DropDown",
      id: 21,
      img: 'http://lorempixel.com/200/200/sports/7/',
    ),
    MainModelTwo(
      name: "PopMenu",
      id: 22,
      img: 'http://lorempixel.com/200/200/animals/8/',
    ),
    MainModelTwo(
      name: "Button Radio",
      id: 23,
      img: 'http://lorempixel.com/200/200/food/8/',
    ),
    MainModelTwo(
      name: "Button Switch",
      id: 24,
      img: 'http://lorempixel.com/200/200/sports/8/',
    ),
    MainModelTwo(
      name: "Button Toggle",
      id: 25,
      img: 'http://lorempixel.com/200/200/animals/9/',
    ),
    MainModelTwo(
      name: "Check Box",
      id: 26,
      img: 'http://lorempixel.com/200/200/sports/9/',
    ),
  ];
}
