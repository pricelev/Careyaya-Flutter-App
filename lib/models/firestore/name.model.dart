import 'package:flamingo/flamingo.dart';
import 'package:flamingo_annotation/flamingo_annotation.dart';

part 'name.model.flamingo.dart';

class NameModel extends Model {
  NameModel({
    this.first,
    this.last,
    this.middle,
    this.full,
    Map<String, dynamic> values,
  }) : super(values: values);

  @Field()
  String first;
  @Field()
  String last;
  @Field()
  String middle;
  @Field()
  String full;

  @override
  Map<String, dynamic> toData() => _$toData(this);

  @override
  void fromData(Map<String, dynamic> data) => _$fromData(this, data);
}
