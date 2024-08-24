// bir tane kaydın nasıl bir kayıt olacak şablonu
// freezed adlı bir paket kullandık
import 'package:freezed_annotation/freezed_annotation.dart';

// bu 2 adet part import nedir? bize 2 adet paket ile ilgili sayfa oluşturdu
part 'record.freezed.dart';
part 'record.g.dart';

@freezed
class Record with _$Record {
  factory Record(
      {required double weight,
      required DateTime dateTime,
      String? note,
      String? photoUrl}) = _Record;

      factory Record.fromJson(Map<String, dynamic> json) => _$RecordFromJson(json);
}
