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
      name: 'Button',
      id: 1,
    ),
    MainModel(
      name: 'Toast',
      id: 2,
    ),
    MainModel(
      name: 'Dialog',
      id: 3,
    ),
    MainModel(
      name: 'AppBar',
      id: 4,
    ),
    MainModel(
      name: 'TextView',
      id: 5,
    ),
    MainModel(
      name: 'Text Field (EditText)',
      id: 6,
    ),
    MainModel(
      name: 'ListView',
      id: 7,
    ),
    MainModel(
      name: 'DropDown',
      id: 8,
    ),
    MainModel(
      name: 'PopMenu',
      id: 9,
    ),
    MainModel(
      name: 'Button Radio',
      id: 10,
    ),
    MainModel(
      name: 'Button Switch',
      id: 11,
    ),
    MainModel(
      name: 'Button Toggle',
      id: 12,
    ),
    MainModel(
      name: 'Check Box',
      id: 13,
    ),
    MainModel(
      name: 'Expansion Tile',
      id: 14,
    ),
    MainModel(
      name: 'Slider (SeekBar)',
      id: 15,
    ),
    MainModel(
      name: 'Introduction',
      id: 16,
    ),
    MainModel(
      name: 'Signature',
      id: 17,
    ),
    MainModel(
      name: 'Date & Time',
      id: 18,
    ),
    MainModel(
      name: 'Camera & Gallery',
      id: 19,
    ),
    MainModel(
      name: 'Drawer',
      id: 20,
    ),
    MainModel(
      name: 'WebSocket',
      id: 21,
    ),
    MainModel(
      name: 'Check Internet',
      id: 22,
    ),
    MainModel(
      name: 'Location (GPS)',
      id: 23,
    ),
  ];
}
