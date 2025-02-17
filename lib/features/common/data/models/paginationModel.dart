import 'from_json_contract.dart';

class PaginationModel<T extends FromJsonContract> {
  List<T>? results;
  int? total;
  int? firstPage;
  int? previous;
  int? next;
  int? lastPage;

  PaginationModel({
    this.results,
    this.total,
    this.firstPage,
    this.previous,
    this.next,
    this.lastPage,
  });
}