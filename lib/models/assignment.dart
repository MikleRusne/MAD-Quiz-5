import 'package:rolodex/models/base_model.dart';

class Assignment extends BaseModel {
  late String _title;
  late String _deadline;
  late int _status;

  Assignment(this._title, this._deadline, this._status);

  Assignment.map(dynamic obj) {
    setId(obj["incremental_id"]);
    _title = obj["title"];
    _deadline = obj['deadline'];
    _status = obj['status'];
  }

  String get title => _title;
  String get deadline => _deadline;
  int get status => _status;

  @override
  Map<String, dynamic> toMap() {
    var map = <String, dynamic>{};
    map["incremental_id"] = id;
    map["title"] = _title;
    map["deadline"] = _deadline;
    map["status"] = _status;

    return map;
  }
}
