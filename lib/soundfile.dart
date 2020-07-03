class SoundFile{
final String _imagepath;
final String _filepath;
final String _title;
final String _description;


  String get imagepath => _imagepath;
  String get title => _title;
  String get description => _description;
  String get filepath => _filepath;

SoundFile(this._filepath, this._imagepath, this._title, this._description,);
}
