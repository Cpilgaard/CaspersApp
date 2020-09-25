class SoundFile {
  int _id;
   String _imagepath;
   String _filepath;
   String _title;
   String _description;

  SoundFile(this._filepath, this._imagepath, this._title, this._description);

  SoundFile.withId(this._id, this._filepath, this._imagepath, this._title, this._description);

  int get id => _id;

  String get imagepath => _imagepath;

  String get title => _title;

  String get description => _description;

  String get filepath => _filepath;

  Map<String, dynamic> toMap() {

    var map = Map<String, dynamic>();
    if (id != null) {
      map['id'] = _id;
    }
    map['filepath'] = _filepath;
    map['imagepath'] = _imagepath;
    map['title'] = _title;
    map['description'] = _description;

    return map;
  }

  SoundFile.fromMapObject(Map<String, dynamic> map) {
    this._id = map['id'];
    this._filepath = map['filepath'];
    this._imagepath = map['imagepath'];
    this._title = map['title'];
    this._description = map['description'];

  }

}