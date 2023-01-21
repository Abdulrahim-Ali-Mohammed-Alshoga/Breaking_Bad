import 'package:hive/hive.dart';
part 'quote_hive.g.dart';
@HiveType(typeId: 0)
class QuoteHive {
  @HiveField(0)
  late String quote;
  QuoteHive(this.quote);
}
//flutter packages pub run build_runner build